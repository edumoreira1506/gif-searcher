import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Header extends StatelessWidget with PreferredSizeWidget {
  final Widget title;

  Header(this.title);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: this.title,
      centerTitle: true,
      backgroundColor: Colors.black
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
