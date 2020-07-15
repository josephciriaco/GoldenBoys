import 'package:flutter/material.dart';

class GradientBackLogin extends StatelessWidget{

  double height = 0.0;
  String imagefondo = "";
  GradientBackLogin(this.height, this.imagefondo);

  @override
  Widget build(BuildContext context) {

    return Container(
      height: height,
      color: Color(0xff000000),
      child: Stack(
        children: <Widget>[
          Opacity(
            opacity: 0.2,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(imagefondo),
                )
              ),
            ),
          )
        ],
      ),
      alignment: Alignment(0.0, 0.0),
    );
  }

}