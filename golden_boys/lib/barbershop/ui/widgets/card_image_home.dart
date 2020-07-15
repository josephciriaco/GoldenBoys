import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CardImage extends StatelessWidget{

  //final String pathImage;
  double top;
  double left;
  double bottom;
  double right;

  CardImage({Key Key, this.top, this.left, this.bottom, this.right});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    final card = SizedBox(
        child: Container(
          //height: MediaQuery.of(context).size.height*0.3, //dimension altura
          width: MediaQuery.of(context).size.width-40, //dimension ancho
          margin: EdgeInsets.only(
              left: left,
              top: top,
              bottom: bottom,
              right: right
          ),

          child: Carousel(
            autoplay: true,
            autoplayDuration: Duration(seconds: 3),
            boxFit: BoxFit.cover,
            indicatorBgPadding: 0,
            dotSize: 0,
            borderRadius: true,
            images: [
              AssetImage("assets/images/imagenUno.jpg"),
              AssetImage("assets/images/imagenDos.jpg"),
              AssetImage("assets/images/imagenTres.jpg"),
              AssetImage("assets/images/imagenCuatro.jpg"),
              AssetImage("assets/images/imagenCinco.jpg"),
              AssetImage("assets/images/imagenSeis.jpg"),
            ],
          ),
        ),
      );

    return card;

  }

}