import 'package:flutter/material.dart';

class TitleHeader extends StatelessWidget{

  final String title;
  TitleHeader({Key Key, @required this.title});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return FittedBox(
      child: Text(
        title,
        style: TextStyle(
          color: Colors.white,
          fontSize: 30.0,
          fontFamily: "Lato",
        ),
      ),
    );


  }

}