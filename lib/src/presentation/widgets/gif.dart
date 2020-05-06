import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gif_searcher/src/model/dto/gif.dart';
import 'package:gif_searcher/src/presentation/screen/gif.dart';
import 'package:share/share.dart';

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
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => GifPage(GifDTO(id: this.id, slug: this.slug, url: this.url)))
        );
      },
      onLongPress: () {
        Share.share(url);
      },
    );
  }
}
