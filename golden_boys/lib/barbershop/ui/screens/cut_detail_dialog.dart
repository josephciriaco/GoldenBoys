import 'package:flutter/material.dart';
import 'package:goldenboys/barbershop/ui/widgets/card_image_cut_detail_dialog.dart';
import 'package:goldenboys/barbershop/ui/widgets/description_cut_detail_dialog.dart';
import 'package:goldenboys/widgets/gradient_back_generico.dart';
import 'package:goldenboys/widgets/title_header.dart';

class CutDetailDialog extends StatefulWidget{
  final String title;
  final String pathImage;
  double height;
  double width;
  double top;
  double left;
  double bottom;

  CutDetailDialog({Key Key, @required this.title, @required this.pathImage, this.height, this.width, this.top, this.bottom, this.left});

  @override
  State<StatefulWidget> createState() {
    return _CutDetailDialog();
  }
}

class _CutDetailDialog extends State<CutDetailDialog>{
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
                Flexible(child: Container(
                  child: TitleHeader(title: widget.title),
                ),
                )
              ],
            ),
          ),

          Container(
            margin: EdgeInsets.only(top: 80.0),
            child: ListView(
              children: <Widget>[
                Container(
                  child: CardImageCutDetailDialog(pathImage: widget.pathImage, height: widget.height, width: widget.width, top: widget.top, bottom: widget.bottom, left: widget.left,),
                ),
                Container(
                  child: DescriptionCutDetailDialog(titulo: "Corte escolar", precio: "S/. 10.00", descripcion: "Un corte de pelo normal o corte de pelo estándar es un peinado de hombres y muchachos que tiene una longitud peinable en la parte superior, una parte lateral definida o deconstruida, y una parte trasera y lateral corta , semi-corta, media, larga o extra larga .",),
                )
                    ],
                  ),
                )
              ],
            ),
          );
  }

}