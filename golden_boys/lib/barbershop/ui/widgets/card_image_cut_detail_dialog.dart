import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CardImageCutDetailDialog extends StatelessWidget{

  final String pathImage;
  double height;
  double width;
  double top;
  double left;
  double bottom;
  CardImageCutDetailDialog({Key Key, @required this.pathImage, this.height, this.width, this.top, this.left, this.bottom});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    final card = Container(
      height: height, //dimension altura
      width: width, //dimension ancho
      margin: EdgeInsets.only(
        left: left,
        right: 20.0,
        top: top,
        bottom: bottom,
      ),

      //decoración de la imagen
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fill, //para que se ajuste la imagen y no se vea cortada
              image: AssetImage(pathImage) //aqui se pasa la imagen
          ),
          borderRadius: BorderRadius.all(Radius.circular(15.0)), //esto es para todas la esquinas
          shape: BoxShape.rectangle, // para que la figura sea rectangular
          boxShadow: <BoxShadow>[  //esto es para agregar una sombra
            BoxShadow(
                color: Colors.black38, //el color de la sombra
                blurRadius: 10.0,     //que tan degradado quieres
                offset: Offset(0.0, 6.0) //la posicion de la sombra en X y Y
            )
          ]

      ),
    );

    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        card
      ],
    );
  }

}