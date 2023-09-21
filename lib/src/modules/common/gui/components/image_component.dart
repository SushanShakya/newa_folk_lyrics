import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImageComponent {
  static DecorationImage? createDecorationImage({
    String? image,
  }) {
    final img = ((image != null)
        ? CachedNetworkImageProvider(image)
        : const NetworkImage(
            "https://i1.himalayas.life/c/u/f67894297b6134a6b759b3a9ec15b6cb/2020/06/08104528/hrsh-15993-newari-kalachakra-mandala-pauba-thangka-painting-made-by-solo-artist.jpeg",
          ));

    return DecorationImage(
      image: img as ImageProvider<Object>,
      fit: BoxFit.cover,
    );
  }
}
