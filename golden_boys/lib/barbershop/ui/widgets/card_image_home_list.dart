import 'package:flutter/material.dart';
import 'card_image_home.dart';

class CardImageList extends StatelessWidget{
  double top = 0.0;
  double left = 20.0;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      height: MediaQuery.of(context).size.height*0.3, //alto del contenedor
      child: ListView(
        scrollDirection: Axis.horizontal, //lista horizontal
        children: <Widget>[
          CardImage( top: top, left: left, bottom: 0.0, right: 0.0),

          CardImage( top: top, left: left, bottom: 0.0, right: 0.0),

          CardImage( top: top, left: left, bottom: 0.0, right: 0.0),

          CardImage( top: top, left: left, bottom: 0.0, right: 0.0),

          CardImage( top: top, left: left, bottom: 0.0, right: 0.0),

          CardImage( top: top, left: left, bottom: 0.0, right: 0.0)
        ],
      ),
    );
  }

}