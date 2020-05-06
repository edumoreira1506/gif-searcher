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

  List<GifDTO> _gifs = [];

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
      _gifs = items;
    });
  }

  _searchGifs(keyword) async {
    Map serializedData = await _giphyService.search(keyword);
    List<GifDTO> items = _giphyService.unserializeData(serializedData);

    setState(() {
      _gifs = items;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(),
      backgroundColor: Colors.black,
      body: Column(
        children: <Widget>[
          SearchForm(_searchGifs),
          GifTable(this._gifs)
        ],
      )
    );
  }
}
