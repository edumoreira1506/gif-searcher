import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Header extends StatelessWidget with PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Image.network('https://developers.giphy.com/static/img/dev-logo-lg.7404c00322a8.gif'),
      centerTitle: true,
      backgroundColor: Colors.black
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
