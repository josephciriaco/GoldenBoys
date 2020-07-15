import 'package:flutter/material.dart';

class TituloLogin extends StatelessWidget{

  String descriptionTitle;

  TituloLogin(this.descriptionTitle);

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: EdgeInsets.only(left: 40, right: 40),
      child: FittedBox(
        child: Text(
          descriptionTitle,
          style: const TextStyle(
              fontFamily: "Lato",
              color: Color(0xffdbdbdb),
              fontSize: 45.0 ,
              fontWeight: FontWeight.bold
          ),
          textAlign: TextAlign.center,
        ),
      ),
      //alignment: Alignment(0.0, 0.0),
    );
  }

}