import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Review extends StatelessWidget {

  final VoidCallback onPressed;
  String pathImage = "asset/images/corte_colita.png";
  String name = "Ricardo Montero";
  String comment = "Esto es un corte en Golden Boys";

  Review(this.pathImage, this.name, this.comment, @required this.onPressed);

  @override
  Widget build(BuildContext context) {

    final userComment = Container(
      margin: EdgeInsets.only(
          bottom: 20.0
      ),

      child: Text(
        comment,
        textAlign: TextAlign.left,
        style: TextStyle(
            fontFamily: "Lato",
            fontSize: 13.0,

        ),

      ),
    );

    final userName = Container(
      margin: EdgeInsets.only(
        top: 10.0
      ),
      child: Text(
        name,
        textAlign: TextAlign.left,
        style: TextStyle(
          fontFamily: "Lato",
          fontSize: 13.0,
          fontWeight: FontWeight.bold
        ),
      ),
    );

    final userDetails = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        userName,
        userComment
      ],
    );



    final photo = FittedBox(
        child: Container(
          margin: EdgeInsets.only(
            top: 10.0,
          ),
          width: MediaQuery.of(context).size.width*0.43,
          height: 150.0,
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              image: DecorationImage(
                  fit: BoxFit.fill, // esto es para encuadrar la imgaen al centro
                  image: AssetImage(pathImage) //aqui insertamos la imagen
              ),
              borderRadius: BorderRadius.all(Radius.circular(15.0)),
              boxShadow: <BoxShadow>[  //esto es para agregar una sombra
                BoxShadow(
                    color: Colors.black38, //el color de la sombra
                    blurRadius: 10.0,     //que tan degradado quieres
                    offset: Offset(0.0, 4.0) //la posicion de la sombra en X y Y
                )
              ]
          ),
          child: FlatButton(child: null,
            onPressed: onPressed,
          ),
        ),
      );


    return Column(mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        photo,
        userDetails
      ],
    );
  }

}