import 'package:flutter/material.dart';
class ImageBuildView extends StatelessWidget {
  final String? url;
  final double? radius;

  const ImageBuildView({Key? key, this.url, this.radius = 10}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius!),
      child: FadeInImage.assetNetwork(
        placeholder: "assets/images/icon_head.webp",
        image: url!,
        fit: BoxFit.cover,
        imageErrorBuilder: (context, error, stackTrace) {
          return Image.asset("assets/images/icon_head.webp");
        },
      ),
    );
  }
}
