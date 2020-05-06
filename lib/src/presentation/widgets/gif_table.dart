import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gif_searcher/src/model/dto/gif.dart';
import 'package:gif_searcher/src/presentation/widgets/gif.dart';
import 'package:gif_searcher/src/presentation/widgets/load_button.dart';

class GifTable extends StatelessWidget {
  final List<GifDTO> _gifs;
  final bool _featured;
  final void Function() onLoadMore;

  GifTable(this._gifs, this._featured, this.onLoadMore);

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
        itemCount: this._featured ? this._gifs.length : this._gifs.length + 1,
        itemBuilder: (context, index) =>
          index < this._gifs.length
           ? Gif(
              this._gifs[index].id,
              this._gifs[index].slug,
              this._gifs[index].url
            )
           : LoadButton(this.onLoadMore)
      )
    );
  }
}
