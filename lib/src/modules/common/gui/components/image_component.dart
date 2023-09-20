import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImageComponent {
  static DecorationImage? createDecorationImage({
    String? image,
  }) {
    final img = ((image != null)
        ? CachedNetworkImageProvider(image)
        : const NetworkImage(
            "https://media.fuzia.com/assets/uploads/images/co_brand_1/article/2016/Matina.jpeg",
          ));

    return DecorationImage(
      image: img as ImageProvider<Object>,
      fit: BoxFit.cover,
    );
  }
}
