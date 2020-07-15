import 'package:flutter/material.dart';

class ButtonAddPhotoScreen extends StatelessWidget{

  final String buttonText;
  final VoidCallback onPressed;
  double height;
  double width;

  ButtonAddPhotoScreen({
    Key Key,
    @required this.buttonText,
    @required this.onPressed,
    this.height,
    this.width
});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return InkWell(
      onTap: onPressed,
      child: Container(margin: EdgeInsets.only(top: 30.0, left: 20.0, right: 20.0),
        height: height, //45
        width: width, //180
        //color: Colors.transparent, esto es si quieres el boton transparente
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0),
          gradient: LinearGradient(
            colors: [
              Color(0xFFf0a500), //color de arriba
              Color(0xFFcf7500)
            ],
            begin: FractionalOffset(0.2, 0.0),
            end: FractionalOffset(1.0, 0.6),
            stops: [0.0, 0.6],
            tileMode: TileMode.clamp
          )
        ),

        child:Center(
          child: Text(
              buttonText,
              style: TextStyle(
                fontSize: 20.0,
                fontFamily: "Lato",
                color: Color(0xffdbdbdb)
              ),
          ),
        ),

      ),
    );
  }

}