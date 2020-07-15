import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ButtonGeneral extends StatefulWidget{

  final String text;
  String icon;
  double width;
  double height;
  final VoidCallback onPressed; //esto es una variable y puede recibir una funcion como parametro

  ButtonGeneral({Key Key, @required this.text, @required this.onPressed, this.height, this.width, this.icon});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ButtonGeneral();
  }
}

class _ButtonGeneral extends State<ButtonGeneral>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return InkWell(
      onTap: widget.onPressed,
      child: Container(
        margin: EdgeInsets.only(
          top: 10.0,
          left: 40.0,
          right: 40.0,
          bottom: 10.0
        ),
        height: widget.height,
        width: widget.width ,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30.0),
            /*boxShadow: <BoxShadow>[  //esto es para agregar una sombra
              BoxShadow(
                  color: Color(0xffdbdbdb), //el color de la sombra
                  blurRadius: 7.0,     //que tan degradado quieres
                  offset: Offset(0.0, 4.0) //la posicion de la sombra en X y Y
              )
            ],*/
            gradient: LinearGradient(
                colors: [
                  Color(0xFFf0a500), //color de arriba
                  Color(0xFFcf7500) //color de abajo
                ],
                begin: FractionalOffset(0.2, 0.0),
                end: FractionalOffset(1.0, 0.6),
                stops: [0.0, 0.6],
                tileMode: TileMode.clamp
            )
        ),
        child: Padding(
          padding: EdgeInsets.only(right: 20, left: 20, bottom: 5, top: 5),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                flex: 1,
                child: FittedBox(
                  child: Text(
                    widget.icon,
                    style: TextStyle(
                        fontSize: 35.0,
                        fontFamily: "Lato",
                        color: Color(0xffdbdbdb),
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 5,
                child: FittedBox(
                  child: Text(
                    widget.text,
                    style: TextStyle(
                        fontSize: 18.0,
                        fontFamily: "Lato",
                        color: Color(0xffdbdbdb),
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
      ),
    );
  }

}