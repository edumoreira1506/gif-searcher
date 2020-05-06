import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:gif_searcher/src/presentation/screen/home.dart';

void main() async {
  await DotEnv().load('.env');

  String giphyKey = DotEnv().env['GIPHY_KEY'];

  runApp(MaterialApp(
    home: HomePage(giphyKey),
    theme: ThemeData(hintColor: Colors.white)
  ));
}
