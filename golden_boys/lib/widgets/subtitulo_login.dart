import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SubTituloLogin extends StatelessWidget{

  String Title;

  SubTituloLogin(this.Title);

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: EdgeInsets.only(left: 20, right: 20),
      child: FittedBox(
        child: Text(
          Title,
          style: const TextStyle(
              fontFamily: "Lato",
              color: Color(0xffdbdbdb),
              fontSize: 20.0 ,
              fontWeight: FontWeight.bold
          ),
          textAlign: TextAlign.center,
        ),
      ),
      //alignment: Alignment(0.0, 0.0),
    );
  }

}