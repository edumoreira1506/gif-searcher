import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gif_searcher/src/model/dto/gif.dart';
import 'package:gif_searcher/src/presentation/widgets/header.dart';

class GifPage extends StatelessWidget {
  final GifDTO _gif;

  GifPage(this._gif);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(Text(_gif.slug)),
      body: Center(
        child: Image.network(_gif.url)
      ),
      backgroundColor: Colors.black,
    );
  }
}
