import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ButtonCall extends StatelessWidget {
  String textCall = "Llamar a Golden Boys";
  ButtonCall(this.textCall); //esto es un constructor

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    double screenWidth = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: () => launch("tel://959181504"),
      child: Container(
          margin:
              EdgeInsets.only(top: 20.0, left: 10.0, right: 10.0, bottom: 10.0),
          height: 40.0,
          width: screenWidth,
          //color: Colors.transparent, esto es si quieres el boton transparente
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.0),
              gradient: LinearGradient(
                  colors: [Color(0xFFf0a500), Color(0xFFcf7500)],
                  begin: FractionalOffset(0.2, 0.0),
                  end: FractionalOffset(1.0, 0.6),
                  stops: [0.0, 0.6],
                  tileMode: TileMode.clamp)),
          child: Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: FittedBox(
                      child: Icon(
                    Icons.phone,
                    size: 30.0,
                    color: Color(0xffdbdbdb),
                  )),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 15, left: 5),
                  child: FittedBox(
                    child: Text(
                      textCall,
                      style: TextStyle(
                          fontSize: 20.0,
                          fontFamily: "Lato",
                          color: Color(0xffdbdbdb)),
                    ),
                  ),
                )
              ],
            ),
          )),
    );
  }
}
