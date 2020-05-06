import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gif_searcher/src/model/dto/gif.dart';
import 'package:gif_searcher/src/model/service/giphy.dart';
import 'package:gif_searcher/src/presentation/widgets/gif_table.dart';
import 'package:gif_searcher/src/presentation/widgets/header.dart';
import 'package:gif_searcher/src/presentation/widgets/search_form.dart';

class HomePage extends StatefulWidget {
  final String giphyKey;

  HomePage(this.giphyKey);

  @override
  _HomePageState createState() => _HomePageState(this.giphyKey);
}

class _HomePageState extends State<HomePage> {
  final String giphyKey;

  _HomePageState(this.giphyKey);

  Giphy _giphyService;

  bool _featured = true;
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
      appBar: Header(
        Image.network('https://developers.giphy.com/static/img/dev-logo-lg.7404c00322a8.gif'),
        []
      ),
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
