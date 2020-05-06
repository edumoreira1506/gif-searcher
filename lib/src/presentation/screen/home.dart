import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gif_searcher/src/model/dto/gif.dart';
import 'package:gif_searcher/src/model/service/giphy.dart';
import 'package:gif_searcher/src/presentation/widgets/gif_table.dart';
import 'package:gif_searcher/src/presentation/widgets/header.dart';
import 'package:gif_searcher/src/presentation/widgets/search_form.dart';

class Home extends StatefulWidget {
  final String giphyKey;

  Home(this.giphyKey);

  @override
  _HomeState createState() => _HomeState(this.giphyKey);
}

class _HomeState extends State<Home> {
  final String giphyKey;

  _HomeState(this.giphyKey);

  Giphy _giphyService;

  bool _featured;

  List<GifDTO> _gifs = [];

  int _offset = 19;

  String _keyword;

  @override
  void initState() {
    super.initState();

    _giphyService = Giphy(this.giphyKey);
    _getFeatured();
  }

  _getFeatured() async {
    Map serializedData = await _giphyService.getFeatured();
    List<GifDTO> items = _giphyService.unserializeData(serializedData);

    setState(() {
      _featured = true;
      _gifs = items;
    });
  }

  _onLoadMore() {
    setState(() {
      _offset += 19;
      _searchGifs();
    });
  }

  _searchGifs() async {
    Map serializedData = await _giphyService.search(_keyword, _offset);
    List<GifDTO> items = _giphyService.unserializeData(serializedData);

    setState(() {
      _featured = false;
      _gifs = items;
    });
  }

  _changeKeyword(keyword) {
    setState(() {
      _keyword = keyword;
      _offset = 0;
      _searchGifs();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(),
      backgroundColor: Colors.black,
      body: Column(
        children: <Widget>[
          SearchForm(_changeKeyword),
          GifTable(this._gifs, this._featured, this._onLoadMore)
        ],
      )
    );
  }
}
