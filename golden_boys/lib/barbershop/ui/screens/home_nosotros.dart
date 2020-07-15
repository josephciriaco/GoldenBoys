import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:goldenboys/barbershop/ui/widgets/description_nosotros.dart';
import 'package:goldenboys/widgets/gradient_back_generico.dart';
import 'package:goldenboys/widgets/title_header.dart';

class HomeNosotrosDetailDialog extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _HomeNosotrosDetailDialog();
  }
}

class _HomeNosotrosDetailDialog extends State<HomeNosotrosDetailDialog>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        body: Stack(
          children: <Widget>[
            GradientBackGenerico(height: 250.0,),
            Container(
              margin: EdgeInsets.only(top: 30.0),
              child: Row(
                children: <Widget>[
                  Container(
                    child: SizedBox(height: 50.0, width: 50.0,
                      child: IconButton(icon: Icon(Icons.arrow_back, color: Colors.white, size: 35,),
                        onPressed: (){Navigator.pop(context);},
                      ),
                    ),
                  ),
                  Container(
                    child: TitleHeader(title: "Nosotros"),
                  ),
                ],
              ),
            ),

            Container(
              margin: EdgeInsets.only(top: 80.0),
              child: ListView(
                scrollDirection: Axis.vertical,
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Container(
                            child: DescriptionNosotros(),
                          )
                        ],
                      )
                    ],
                  )
                ],
              ),
            )
          ]
        )
    );
  }

}