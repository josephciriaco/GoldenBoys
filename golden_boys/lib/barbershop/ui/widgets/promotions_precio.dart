import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PromotionsPrecio extends StatelessWidget{

  String promonumber;
  String titulo;
  String precio;
  final VoidCallback onPressed;

  PromotionsPrecio({Key Key, this.promonumber, this.titulo, this.precio, @required this.onPressed});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    final promo = FittedBox(
      child: Text(
        promonumber,
        style: const TextStyle(
          fontFamily: "Lato",
          color: Colors.black,
          fontSize: 18.0,
          //fontWeight: FontWeight.bold
        ),
        textAlign: TextAlign.left,
      ),
    );

    final tituloPromo = FittedBox(
      child: Text(
        titulo,
        style: const TextStyle(
            fontFamily: "Lato",
            color: Colors.black,
            fontSize: 13.0,
            //fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic
        ),
        textAlign: TextAlign.left,
      ),
    );

    final promoName = Expanded(
      flex: 3,
      child: Container(
        child:
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            promo,
            tituloPromo
          ],
        ),
      ),
    );

    final precioPromo = Expanded(
      flex: 1,
      child: Container(
          child: FittedBox(
            child: Text(
              precio,
              style: const TextStyle(
                fontFamily: "Lato",
                color: Colors.black,
                fontSize: 18.0,
                //fontWeight: FontWeight.bold
              ),
              textAlign: TextAlign.right,
            ),
          )
      ),
    );

     final botom = Container(
      child: Row(
          children: <Widget>[
            promoName,
            precioPromo
          ],
      ),
    );

     return FlatButton(
       child: botom,
       onPressed: onPressed,);
  }

}