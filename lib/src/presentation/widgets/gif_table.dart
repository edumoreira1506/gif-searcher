import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gif_searcher/src/model/dto/gif.dart';
import 'package:gif_searcher/src/presentation/widgets/gif.dart';

class GifTable extends StatelessWidget {
  final List<GifDTO> gifs;

  GifTable(this.gifs);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        padding: EdgeInsets.all(10),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10
        ),
        itemCount: this.gifs.length,
        itemBuilder: (context, index) => Gif(this.gifs[index].id, this.gifs[index].slug, this.gifs[index].url),
      )
    );
  }
}
