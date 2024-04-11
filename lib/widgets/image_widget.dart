import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../data/post_model.dart';

class ImageWidget extends StatelessWidget {
  const ImageWidget({
    super.key,
    required this.image,
    this.width = 300,
    this.height = 300,
    this.fit = BoxFit.cover,
  });

  final ImageModel image;

  final double width;

  final double height;

  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: image.url,
      fit: BoxFit.cover,
      width: width,
      height: height,
    );
  }
}
