import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class S5322 extends StatelessWidget {
  const S5322({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
        child: CachedNetworkImage(
      imageUrl:
          'https://i.pinimg.com/originals/a4/3e/e6/a43ee6d3e310564af22b71bdfb1a52e7.jpg',
      placeholder: (context, url) => CircularProgressIndicator(),
      errorWidget: (context, url, error) => const Icon(Icons.error),
      width: 200,
      height: 200,
      fit: BoxFit.contain,
    ));
  }
}
