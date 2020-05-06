import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Gif extends StatelessWidget {
  final String id;
  final String slug;
  final String url;

  Gif(this.id, this.slug, this.url);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Image.network(
        url,
        height: 30,
        fit: BoxFit.cover
      )
    );
  }
}
