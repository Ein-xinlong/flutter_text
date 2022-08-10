import 'dart:io';

import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:untitled/utils/log.dart';

enum AnNetworkEnv { Product, Prepub, Develop }

class PdaNetworkConfig {
  var currentEnv = AnNetworkEnv.Product;
  Map<String, String> _headers = {};
  Map<String, dynamic> _commonParameters = {};
  String? _proxy;
  var _environments = {
    AnNetworkEnv.Product: PdaNetworkEnvironment(
      baseUrl: 'https://www.wanandroid.com/',///https://httpbin.org/  测试get post接口
    ),
    AnNetworkEnv.Prepub: PdaNetworkEnvironment(
      baseUrl: 'https://www.wanandroid.com/',
    ),
    AnNetworkEnv.Develop: PdaNetworkEnvironment(
      baseUrl: 'https://www.wanandroid.com/',
    ),
  };

  PdaNetworkEnvironment? get environment => _environments[currentEnv];

  factory PdaNetworkConfig.shareInstance() => _instance;

  static PdaNetworkConfig _instance = PdaNetworkConfig._();

  PdaNetworkConfig._();

  /// 仅支持修改Develop的配置，用于调试
  changeDevelopConfig(PdaNetworkEnvironment newEnv) {
    _environments[AnNetworkEnv.Develop] = newEnv;
  }

  setProxy(String proxy) {
    _proxy = proxy;
  }

  addCommonParameters(Map<String, dynamic> params) {
    _commonParameters.addAll(params);
  }

  setCommonParameter(String key, dynamic value) {
    if (key?.isNotEmpty == true) {
      if (value?.isNotEmpty == true) {
        _commonParameters[key] = value;
      } else {
        _commonParameters.remove(key);
      }
    }
  }

  String get proxy {
    return _proxy!;
  }

  /// 设置Header中的 Cookie，key == null 不生效, value == null，remove该key
  setHeader(String key, String value) {
    if (key?.isNotEmpty == true) {
      if (value?.isNotEmpty == true) {
        _headers[key] = value;
      } else {
        _headers.remove(key);
      }
    }
  }

  String get headers {
    String builder = '';
    _headers.forEach((key, value) {
      builder += '$key=$value;';
    });
    return builder;
  }

  BaseOptions get baseOptions {
    var env = _environments[currentEnv];
    return BaseOptions(
        baseUrl: env!.baseUrl,
        connectTimeout: Duration(seconds: 20),
        contentType: Headers.jsonContentType,
        followRedirects: false,
        headers: _headers);
  }
}

typedef RequestSuccess = void Function(Response response);

typedef RequestFailed = void Function(dynamic error);

class AnNetwork {
  Dio? _dio;

  factory AnNetwork.shareInstance() => _shareInstance();

  static AnNetwork _instance = AnNetwork._();

  static AnNetwork _shareInstance() {
    return _instance;
  }

  Dio get getDio => _dio!;

  AnNetwork._() {
    _dio = Dio(PdaNetworkConfig.shareInstance().baseOptions);


    _dio!.interceptors.add(TokenExpiredInterceptor());
    _dio!.interceptors.add(InterceptorsWrapper(
      onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
        print("\n================== 请求数据 ==========================");
        print("url = ${options.uri.toString()}");
        print("headers = ${options.headers}");
        print("params = ${options.data}");
        handler.next(options); // 手动调用 next 方法以继续请求链
      },
      onError: (DioError e, ErrorInterceptorHandler handler) {
        print("\n================== 错误响应数据 ======================");
        print("type = ${e.type}");
        print("message = ${e.message}");
        print("stackTrace = ${e.response}");
        print("\n");
        handler.next(e); // 手动调用 next 方法以继续请求链
      },
    ));
    _addCookieJar(_dio!);
    if (PdaNetworkConfig.shareInstance().proxy?.isNotEmpty == true) {
      _configProxy(_dio!);
    }
  }

  _configProxy(Dio dio) {
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) {
        return true;
      };
      client.findProxy = (uri) {
        String proxy = "PROXY" + ' ' + PdaNetworkConfig.shareInstance().proxy;
        return proxy;
      };
    };
  }

  /// 添加cooike 缓存管理
  _addCookieJar(Dio dio) async {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    String appDocPath = appDocDir.path;
    //var cookieJar = PersistCookieJar(dir: appDocPath + "/.cookies/");
    var cookieJar = PersistCookieJar();
    dio.interceptors.add(CookieManager(cookieJar));
    dio.interceptors.add(CookieManager(cookieJar));
  }

  _addCommonParam(Map<String, dynamic> param) {
    param.addAll(PdaNetworkConfig.shareInstance()._commonParameters);
  }

  post<T>(String path,
      {Map<String, dynamic>? paramaters,
        CancelToken? cancelToken,
        Map<String, dynamic>? query,
        Options? options,
        RequestSuccess? success,
        RequestFailed? failed}) async {
    try {
      Map<String, dynamic> nonNullParameters = paramaters ?? {};
      Options nonNullOptions = options ?? Options();
      _addCommonParam(nonNullParameters);
      _configOption(nonNullOptions);
      await _post(
        path,
        paramaters: nonNullParameters,
        cancelToken: cancelToken!,
        query: query!,
        options: nonNullOptions,
        success: (response) {
          success!(response);
        },
      );
    } catch (e) {
      failed!(e);
    }
  }

  _post<T>(
      String path, {
        Map<String, dynamic>? paramaters,
        CancelToken? cancelToken,
        Map<String, dynamic>? query,
        Options? options,
        RequestSuccess? success,
      }) async {
    Map<String, dynamic> paramMap = paramaters ?? {};
    var usedDio = _dio;

    Response<T> response = await usedDio!.post(
      path,
      data: paramMap,
      queryParameters: query,
      options: options,
      cancelToken: cancelToken,
    );
    success!(response);
  }

  _configOption(Options options) {}

  get<T>(String path,
      {bool isColor = true,
        String? functionId,
        Map<String, dynamic>? queryParameters,
        CancelToken? cancelToken,
        Options? options,
        RequestSuccess? success,
        RequestFailed? failed}) async {
    try {
      Map<String, dynamic> nonNullParameters = queryParameters ?? {};
      Options nonNullOptions = options ?? Options();
      _addCommonParam(nonNullParameters);
      _configOption(nonNullOptions);
      await _get(
        path,
        queryParameters: nonNullParameters,
        cancelToken: cancelToken!,
        options: nonNullOptions,
        success: (response) {
          success!(response);
        },
      );
    } catch (e) {
      failed!(e);
    }
  }

  _get<T>(
      String path, {
        Map<String, dynamic>? queryParameters,
        CancelToken? cancelToken,
        Options? options,
        RequestSuccess? success,
      }) async {
    Map<String, dynamic> paramMap = queryParameters ?? {};
    var usedDio = _dio;

    Response<T> response = await usedDio!.get(
      path,
      queryParameters: paramMap,
      options: options,
      cancelToken: cancelToken,
    );
    success!(response);
  }
}

class TokenExpiredInterceptor extends Interceptor {
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
      if (response.statusCode == 302) {
        Log.e("302");
      }
    super.onResponse(response, handler);
  }
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
      if (err.response!.statusCode == 302) {
        Log.e("302");
      }
    super.onError(err, handler);
  }
}

class PdaNetworkEnvironment {
  String baseUrl;

  PdaNetworkEnvironment({
    required this.baseUrl,
  });
}
