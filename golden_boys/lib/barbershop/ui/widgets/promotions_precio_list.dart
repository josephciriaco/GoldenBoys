import 'package:flutter/material.dart';
import 'package:goldenboys/barbershop/ui/screens/cut_detail_dialog.dart';
import 'package:goldenboys/barbershop/ui/widgets/promotions_precio.dart';

class PromotionsList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    double height = 30.0;

    return Column(
            children: <Widget>[
              PromotionsPrecio(promonumber: "Promo 1", titulo:"Corte + raya + ceja", precio:"S/. 15.00", onPressed: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(builder:
                        (BuildContext context) => CutDetailDialog(
                        pathImage: "assets/images/corte_colita.png", title: "Promociones", height: 300.0, width: 320.0, top: 20.0, bottom: 0.0, left: 20.0
                    )));
              }),

              Divider(height: height, thickness: 1, color: Colors.grey, endIndent: 20, indent: 0,),

              PromotionsPrecio(promonumber: "Promo 2", titulo:"Corte + raya + ceja", precio:"S/. 15.00", onPressed: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(builder:
                        (BuildContext context) => CutDetailDialog(
                        pathImage: "assets/images/corte_colita.png", title: "Promociones", height: 300.0, width: 320.0, top: 20.0, bottom: 0.0, left: 20.0
                    )));
              }),

              Divider(height: height, thickness: 1, color: Colors.grey, endIndent: 20, indent: 0,),

              PromotionsPrecio(promonumber: "Promo 3", titulo:"Corte + raya + ceja", precio:"S/. 15.00", onPressed: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(builder:
                        (BuildContext context) => CutDetailDialog(
                        pathImage: "assets/images/corte_colita.png", title: "Promociones", height: 300.0, width: 320.0, top: 20.0, bottom: 0.0, left: 20.0
                    )));
              }),

              Divider(height: height, thickness: 1, color: Colors.grey, endIndent: 20, indent: 0,),

              PromotionsPrecio(promonumber: "Promo 4", titulo:"Corte + raya + ceja", precio:"S/. 15.00", onPressed: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(builder:
                        (BuildContext context) => CutDetailDialog(
                        pathImage: "assets/images/corte_colita.png", title: "Promociones", height: 300.0, width: 320.0, top: 20.0, bottom: 0.0, left: 20.0
                    )));
              }),

              Divider(height: height, thickness: 1, color: Colors.grey, endIndent: 20, indent: 0,),

              PromotionsPrecio(promonumber: "Promo 5", titulo:"Corte + raya + ceja", precio:"S/. 15.00", onPressed: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(builder:
                        (BuildContext context) => CutDetailDialog(
                        pathImage: "assets/images/corte_colita.png", title: "Promociones", height: 300.0, width: 320.0, top: 20.0, bottom: 0.0, left: 20.0
                    )));
              }),

              Divider(height: height, thickness: 1, color: Colors.grey, endIndent: 20, indent: 0,),

              PromotionsPrecio(promonumber: "Promo 6", titulo:"Corte + raya + ceja", precio:"S/. 15.00", onPressed: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(builder:
                        (BuildContext context) => CutDetailDialog(
                        pathImage: "assets/images/corte_colita.png", title: "Promociones", height: 300.0, width: 320.0, top: 20.0, bottom: 0.0, left: 20.0
                    )));
              }),

              Divider(height: height, thickness: 1, color: Color(0xffdbdbdb), endIndent: 20, indent: 0,),
            ]
        );
  }

}