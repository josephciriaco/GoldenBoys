import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../widgets/floating_action_button_yellow.dart';

class LogoImage extends StatelessWidget{

  String pathImage = "assets/images/logo_oficial.png";

  LogoImage(this.pathImage);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    final card = Container(
      height: 60.0, //dimension altura
      width: 60.0, //dimension ancho
      margin: EdgeInsets.only(
          left: 18.0
      ),

      //decoración de la imagen
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover, //para que se ajuste la imagen y no se vea cortada
              image: AssetImage(pathImage) //aqui se pasa la imagen
          ),
          borderRadius: BorderRadius.all(Radius.circular(10.0)), //esto es para todas la esquinas
          shape: BoxShape.rectangle, // para que la figura sea rectangular
          boxShadow: <BoxShadow>[  //esto es para agregar una sombra
            BoxShadow(
                color: Colors.amberAccent, //el color de la sombra
                blurRadius: 15.0,     //que tan degradado quieres
                offset: Offset(0.0, 0.0) //la posicion de la sombra en X y Y
            )
          ]

      ),
    );

    return Stack(
      alignment: Alignment(0.9, 1.1),
      children: <Widget>[
        card
      ],
    );
  }

}