import 'package:flutter/material.dart';
import 'package:goldenboys/barbershop/ui/widgets/promotions_precio_list.dart';

class PromotionsHeader extends StatelessWidget{
  String imgProfile;
  PromotionsHeader(this.imgProfile);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    double screenWidth = MediaQuery.of(context).size.width;

    final promoPhoto = Padding(
      padding: EdgeInsets.only(right: 15.0, left: 15.0, bottom: 30.0),
      child: SizedBox(
        width: screenWidth,
        height: MediaQuery.of(context).size.height-270,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(15.0)),
              shape: BoxShape.rectangle,
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage(imgProfile)
              ),
              boxShadow: <BoxShadow>[  //esto es para agregar una sombra
                BoxShadow(
                    color: Colors.black38, //el color de la sombra
                    blurRadius: 10.0,     //que tan degradado quieres
                    offset: Offset(0.0, 4.0) //la posicion de la sombra en X y Y
                )
              ]
          ),
        ),
      ),


    );

    return Container(
      child: Column(
        children: <Widget>[
          promoPhoto,
          PromotionsList(),
        ],
      ),
    );
  }

}