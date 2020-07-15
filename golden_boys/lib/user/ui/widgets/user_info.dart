import 'package:flutter/material.dart';
import 'package:goldenboys/user/model/user.dart';

// ignore: must_be_immutable
class UserInfoo extends StatelessWidget {

  User user;

  UserInfoo(@required this.user);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    final userPhoto = Container(
      width: 100.0,
      height: 100.0,
      decoration: BoxDecoration(
          border: Border.all(
              color: Colors.white,
              width: 2.0,
              style: BorderStyle.solid
          ),
          shape: BoxShape.circle,
          image: DecorationImage(
              fit: BoxFit.cover,
              //image: AssetImage(user.photoURL)
            image: NetworkImage(user.photoURL)
          )
      ),
    );

    final userInfo = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
            margin: EdgeInsets.only(
                bottom: 2.0
            ),
            child: FittedBox(
              child: Text(
                  user.name,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                    fontFamily: 'Lato',
                  )
              ),
            )
        ),
        FittedBox(
          child: Text(
              user.email,
              style: TextStyle(
                  fontSize: 15.0,
                  color: Colors.white,
                  fontStyle: FontStyle.italic, //esto es para poner las palabras en cursiva
                  fontFamily: 'Lato'
              )
          ),
        ),
      ],
    );

    return Container(
        margin: EdgeInsets.symmetric(
            vertical: 10.0,
          horizontal: 20
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            userPhoto,
            userInfo
          ],
        ),
      );
  }

}