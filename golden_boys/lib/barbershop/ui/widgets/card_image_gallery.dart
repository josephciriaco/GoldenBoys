import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../widgets/floating_action_button_yellow.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CardImageGallery extends StatelessWidget{

  final IconData iconData;
  final String pathImage;
  final VoidCallback onPressedFabIcon;
  double width;
  double top;
  double left;
  double bottom;
  Color color;
  bool internet = true;

  CardImageGallery({Key Key, @required this.iconData, @required this.pathImage, @required this.onPressedFabIcon, this.width, this.top, this.left, this.color, this.bottom, this.internet});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    final card = Container(
      height: 350, //dimension altura
      width: width, //dimension ancho
      margin: EdgeInsets.only(
        left: left,
        top: top,
        bottom: bottom,
        right: 10.0
      ),

      //decoración de la imagen
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fill, //para que se ajuste la imagen y no se vea cortada
              image: internet?CachedNetworkImageProvider(pathImage):AssetImage(pathImage)              //NetworkImage(pathImage) //aqui se pasa la imagen
          ),
          borderRadius: BorderRadius.all(Radius.circular(10.0)), //esto es para todas la esquinas
          shape: BoxShape.rectangle, // para que la figura sea rectangular
          boxShadow: <BoxShadow>[  //esto es para agregar una sombra
            BoxShadow(
                color: Colors.black38, //el color de la sombra
                blurRadius: 15.0,     //que tan degradado quieres
                offset: Offset(0.0, 7.0) //la posicion de la sombra en X y Y
            )
          ]

      ),
    );

    return Stack(
      alignment: Alignment(0.85,0.85),
      children: <Widget>[
        card,
        FloatingActionButtonYellow(iconData: iconData, onPressed: onPressedFabIcon, color: color, )
      ],
    );
  }

}