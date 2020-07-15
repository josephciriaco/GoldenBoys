import 'package:flutter/material.dart';
import 'package:goldenboys/barbershop/model/barbershop.dart';
import 'package:goldenboys/widgets/floating_action_button_yellow.dart';


// ignore: must_be_immutable
class ProfileBarbershopInfo extends StatelessWidget {

  Barbershop foto;

  ProfileBarbershopInfo(this.foto);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    /*final photo = Text(    //author.fullname == null? '' : author.fullname
      this.foto.name == null? '': this.foto.name,
      style: TextStyle(
          fontFamily: 'Pattaya',
          fontSize: 20.0,
          fontWeight: FontWeight.bold
      ),
    );*/

    final photoInfo = Padding(
        padding: EdgeInsets.symmetric(
            vertical: 10.0
        ),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                this.foto.name,
                style: TextStyle(
                    fontFamily: 'Lato',
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold
                ),
              ),
              Text(
                this.foto.description,
                style: TextStyle(
                    color: Color.fromRGBO(0, 0, 0, 0.4),
                    fontFamily: 'Lato',
                    fontSize: 12.0,
                    fontWeight: FontWeight.bold
                ),
              )
            ]
        )
    );

    // ignore: non_constant_identifier_names
    final Golds = Text(
      'Golds  ${this.foto.likes}',
      style: TextStyle(
          fontFamily: 'Lato',
          fontSize: 14.0,
          fontWeight: FontWeight.bold,
          color: Colors.amber
      ),
    );

    final card = Container(
      width: screenWidth * 0.65,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          color: Colors.white,
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.black38,
                blurRadius: 10.0,
                offset: Offset(0.0, 5.0)
            )
          ]
      ),
      child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              //photo,
              photoInfo,
              Golds
            ],
          )
      ),
    );

    return Stack(
      alignment: Alignment(0.8, 1.25),
      children: <Widget>[
        card,
        FloatingActionButtonYellow(iconData: Icons.favorite_border,onPressed: (){},)
      ],
    );
  }

}