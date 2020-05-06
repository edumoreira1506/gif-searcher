import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gif_searcher/src/model/dto/gif.dart';
import 'package:gif_searcher/src/presentation/widgets/header.dart';
import 'package:share/share.dart';

class GifPage extends StatelessWidget {
  final GifDTO _gif;

  GifPage(this._gif);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(
        Text(_gif.slug),
        [
          IconButton(
            icon: Icon(Icons.share),
            onPressed: (){
              Share.share(_gif.url);
            },
          )
        ]
      ),
      body: Center(
        child: Image.network(_gif.url)
      ),
      backgroundColor: Colors.black,
    );
  }
}
