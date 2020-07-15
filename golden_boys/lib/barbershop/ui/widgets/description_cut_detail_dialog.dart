import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:goldenboys/widgets/button_add_photo_screen_and_reservar.dart';

class DescriptionCutDetailDialog extends StatelessWidget{

  String titulo;
  String precio;
  String descripcion;
  DescriptionCutDetailDialog({Key Key, this.titulo, this.precio, this.descripcion});
  double screenWidth;
  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;

    final title = Row(
      children: <Widget>[
        Expanded(
          child: Text(
            titulo,
            style: TextStyle(
                fontFamily: "Lato",
                fontSize: 20.0,
                color: Colors.black
            ),
          )
        ),
        Container(
          child: Text(
            precio,
            style: TextStyle(
                fontFamily: "Lato",
                fontSize: 18.0,
                color: Colors.black
            ),
          ),
        )
      ],
    );

    final description = SizedBox(
      width: 340.0,
      height: 150.0,
      child: Container(
        margin: EdgeInsets.only(top: 25.0),
        child: Text(
          descripcion,
          textAlign: TextAlign.justify,
          style: TextStyle(
              fontFamily: "Lato",
              fontSize: 15.0,
              color: Colors.black
          ),
        ),
      )
    );



    return Container(
      margin: EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0, bottom: 20),
      child: Column(
        children: <Widget>[
          title,
          description,
          Container(
            child: ButtonAddPhotoScreen(buttonText: "Reservar", height: 40.0, width: screenWidth, onPressed: (){},),
          )
        ],
      ),
    );
  }

}