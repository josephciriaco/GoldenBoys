import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:goldenboys/barbershop/ui/screens/home_nosotros.dart';

class ButtonNosotros extends StatelessWidget {
  String textWe = "Nosotros";
  ButtonNosotros(this.textWe); //esto es un constructor

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomeNosotrosDetailDialog()),
        );
      },
      child: Container(
          margin: EdgeInsets.only(top: 0.0, right: 10.0, left: 10.0),
          height: 40.0,
          width: 110.0,
          //color: Colors.transparent, esto es si quieres el boton transparente
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.0),
              gradient: LinearGradient(
                  colors: [Color(0xFFf0a500), Color(0xFFcf7500)],
                  begin: FractionalOffset(0.2, 0.0),
                  end: FractionalOffset(1.0, 0.6),
                  stops: [0.0, 0.6],
                  tileMode: TileMode.clamp)),
          child: Padding(
            padding: EdgeInsets.only(right: 15, left: 15),
            child: Center(
              child: FittedBox(
                child: Text(
                  textWe,
                  style: TextStyle(
                      fontSize: 20.0, fontFamily: "Lato", color: Color(0xffdbdbdb)),
                ),
              ),
            ),
          )),
    );
  }
}
