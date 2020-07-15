import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:goldenboys/barbershop/ui/screens/home_nosotros.dart';
import 'package:goldenboys/widgets/button_call.dart';
import 'package:goldenboys/widgets/button_nosotros.dart';

class DescriptionHome extends StatefulWidget {
  String nameAplication;
  String site;
  DescriptionHome(this.nameAplication, this.site); //esto es un constructor
  @override
  State<StatefulWidget> createState() {
    return _DescriptionHome();
  }
}

class _DescriptionHome extends State<DescriptionHome> {
  @override
  Widget build(BuildContext context) {
    //double screenWidth = MediaQuery.of(context).size.width;

    final nameApp = Container(
      margin: EdgeInsets.only( left: 10.0,),
      child: Text(
        widget.nameAplication,
        style: TextStyle(
            fontFamily: "Lato",
            fontSize: 16.0,
            color: Colors.black,
            fontWeight: FontWeight.bold,
        ),
      ),
    );

    final address = Container(
      margin: EdgeInsets.only(top: 5.0, left: 10.0),
      child: Text(
        widget.site,
        //textAlign: TextAlign.left,
        style: TextStyle(
            fontFamily: "Lato",
            fontSize: 13.0,
            fontStyle: FontStyle.italic,
            color: Colors.black87),
      ),
    );

    return Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[nameApp, address],
                ),
              ),
              Expanded(flex: 2,
                child: ButtonNosotros("Nosotros"),
              )
            ],
          ),
          ButtonCall("Llamar a Barbershop")
        ],
      );
  }
}
