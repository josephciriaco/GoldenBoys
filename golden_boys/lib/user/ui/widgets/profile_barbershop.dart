import 'package:flutter/material.dart';
import 'package:goldenboys/barbershop/model/barbershop.dart';
import 'package:goldenboys/user/ui/widgets/profile_barbershop_info.dart';
import 'package:cached_network_image/cached_network_image.dart';


class ProfileBarbershop extends StatelessWidget {

  Barbershop foto;
  ProfileBarbershop( this.foto);

  @override
  Widget build(BuildContext context) {

    final photoCard = Container(
      margin: EdgeInsets.only(
          top: 10.0,
          bottom: 70.0
      ),
      height: 220.0,
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover,
              image: CachedNetworkImageProvider(foto.urlImage)
          ),
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
          color: Colors.black26,
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.black38,
                blurRadius: 10.0,
                offset: Offset(0.0, 5.0)
            )
          ]
      ),
    );

    return Stack(
      alignment: Alignment(0.0, 0.8),
      children: <Widget>[
        photoCard,
        ProfileBarbershopInfo(foto)
      ],
    );
  }

}