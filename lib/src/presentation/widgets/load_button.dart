import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LoadButton extends StatelessWidget {
  final void Function() onTap;

  LoadButton(this.onTap);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.add,
              color: Colors.white,
              size: 70
            ),
            Text(
              'More',
              style: TextStyle(
                color: Colors.white,
                fontSize: 22
              )
            )
          ],
        ),
        onTap: this.onTap
      )
    );
  }
}
