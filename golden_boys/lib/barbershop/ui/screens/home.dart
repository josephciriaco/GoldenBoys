import 'package:flutter/material.dart';
import 'package:goldenboys/barbershop/ui/widgets/card_image_home_list.dart';
import 'package:goldenboys/barbershop/ui/widgets/review_list.dart';
import 'package:goldenboys/barbershop/ui/widgets/title_para_todos.dart';
import 'package:goldenboys/widgets/gradient_back_generico.dart';
import 'package:goldenboys/widgets/title_header.dart';
import '../widgets/description_home.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Home();
  }
}

class _Home extends State<Home>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Stack(
        children: <Widget>[
          GradientBackGenerico(height: 250.0),
          Container(
            margin: EdgeInsets.only(top: 30.0, left: 20.0),
            child: TitleHeader(title: "Bienvenido"),
          ),
          Container(
            margin: EdgeInsets.only(top: 70.0),
            child: ListView(
              scrollDirection: Axis.vertical,
              children: <Widget>[
                CardImageList(),
                DescriptionHome("Golden Boys BARBERSHOP", "AV. Las Violetas #684-686\nIndenpendencia-Lima"),
                TituloCortes("Cortes Destacados"),
                ReviewList(title: "Cortes Destacados"),
                TituloCortes("Cortes Escolares"),
                ReviewList(title: "Cortes Escolares"),
                TituloCortes("Cortes Degradados"),
                ReviewList(title: "Cortes Degradados"),
                TituloCortes("Cortes con Diseños"),
                ReviewList(title: "Cortes con Diseños"),
                TituloCortes("Afeitado de Barba"),
                ReviewList(title: "Afeitado de Barba")
              ],
            ),
          ),
        ],
      ),
    );
  }

}