import 'package:flutter/material.dart';
import 'package:goldenboys/barbershop/ui/widgets/card_image_cut_detail_dialog.dart';
import 'package:goldenboys/barbershop/ui/widgets/description_cut_detail_dialog.dart';
import 'package:goldenboys/widgets/button_add_photo_screen_and_reservar.dart';
import 'package:goldenboys/widgets/gradient_back_generico.dart';
import 'package:goldenboys/widgets/title_header.dart';

class ProfileBarberNosotros extends StatefulWidget{
  final String title;
  final String pathImage;
  double height;
  double width;
  double top;
  double left;
  double bottom;

  ProfileBarberNosotros({Key Key, @required this.title, @required this.pathImage, this.height, this.width, this.top, this.bottom, this.left});

  @override
  State<StatefulWidget> createState() {
    return _ProfileBarberNosotros();
  }
}

class _ProfileBarberNosotros extends State<ProfileBarberNosotros>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    double screenWidth = MediaQuery.of(context).size.width;

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
                  width: screenWidth,
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
                Container( //Titulo nombre
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(top: 30.0, left: 10.0, right: 10.0),
                  child: Text(
                    "Sergio Benahavente",
                    style: TextStyle(
                      fontFamily: "Lato",
                      fontSize: 20.0,
                      color: Colors.black,
                      fontWeight: FontWeight.w600, ),
                  ),
                ),
                Container( //breve historia del barbero
                  margin: EdgeInsets.only(top: 20.0, left: 15.0, right: 15.0, bottom: 20.0),
                  child: Text(
                    "Golden Boys BARBERSHOP llega a Lima con un concepto novedoso, innovador y exclusivo, creado especialmente a partir de ls exigencias de nuestros clientes y con la colaboración de las mejores marcas.",
                    style: TextStyle(
                      fontFamily: "Lato",
                      fontSize: 15.0,
                      color: Colors.black,),
                    textAlign: TextAlign.left,
                  ),
                ),
                Container( //botom de reserva
                  child: ButtonAddPhotoScreen(buttonText: "Reservar", height: 40.0, width: screenWidth, onPressed: (){},),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

}