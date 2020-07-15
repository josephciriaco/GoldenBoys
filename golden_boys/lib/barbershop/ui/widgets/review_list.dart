import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:goldenboys/barbershop/ui/screens/cut_detail_dialog.dart';
import 'review.dart';

class ReviewList extends StatelessWidget {
  final String title;

  ReviewList({Key Key, @required this.title});
  double screenWidth;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    screenWidth = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Review("assets/images/corte_colita.png", "Degradado total", "Costo: S/. 15.00",
                      () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder:
                            (BuildContext context) => CutDetailDialog(
                              pathImage: "assets/images/corte_colita.png", title: title, height: 300.0, width: screenWidth, top: 20.0, bottom: 0.0, left: 20.0
                            )));
                  }
              ),
              Padding(padding: EdgeInsets.only(left: 20.0),),
              Review("assets/images/corte_raya.jpg", "Degradado total", "Costo: S/. 15.00",
                      () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder:
                            (BuildContext context) => CutDetailDialog(pathImage: "assets/images/corte_raya.jpg", title: "Cortes Destacados", height: 300.0, width: screenWidth, top: 20.0, bottom: 0.0, left: 20.0
                            )));
                  })
            ]
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Review("assets/images/corte_degradado.jpg", "Degradado total", "Costo: S/. 15.00",
                    () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder:
                          (BuildContext context) => CutDetailDialog(pathImage: "assets/images/corte_degradado.jpg", title: "Cortes Destacados", height: 300.0, width: screenWidth, top: 20.0, bottom: 0.0, left: 20.0
                          )));
                }),
            Padding(padding: EdgeInsets.only(left: 20.0),),
            Review("assets/images/corte_cachetada.jpg", "Degradado raya", "Costo: S/. 20.00",
                    () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder:
                          (BuildContext context) => CutDetailDialog(pathImage: "assets/images/corte_cachetada.jpg", title: "Cortes Destacados", height: 300.0, width: screenWidth, top: 20.0, bottom: 0.0, left: 20.0
                          )));
                }),
          ],
        ),
      ],
    );
  }

}