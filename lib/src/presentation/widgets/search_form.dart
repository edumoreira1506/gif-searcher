import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SearchForm extends StatelessWidget {
  final void Function(String) onSubmit;

  SearchForm(this.onSubmit);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: TextField(
        onSubmitted: (text) => this.onSubmit(text),
        decoration: InputDecoration(
          labelText: 'Search...',
          labelStyle: TextStyle(
            color: Colors.white,
          ),
          border: OutlineInputBorder(),
        ),
        style: TextStyle(
          color: Colors.white,
          fontSize: 18
        ),
        textAlign: TextAlign.center
      )
    );
  }
}
