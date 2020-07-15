import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:goldenboys/user/bloc/bloc_user.dart';
import 'package:goldenboys/user/model/user.dart';
import 'package:goldenboys/user/ui/widgets/button_bar.dart';
import 'package:goldenboys/user/ui/widgets/user_info.dart';


class ProfileHeader extends StatelessWidget {

  User user;
  ProfileHeader(@required this.user);

  @override
  Widget build(BuildContext context) {

    return Container(
      child: Column(
        children: <Widget>[
          UserInfoo(user),
          ButtonsBar()
        ],
      ),
    );
  }

  Widget showProfileData(AsyncSnapshot snapshot){
    if(!snapshot.hasData || snapshot.hasError){
      print("No logeado");
      return Container(
        margin: EdgeInsets.only(
            top: 50.0
        ),
        child: Column(
          children: <Widget>[
            Center(child: CircularProgressIndicator(),),
            Text("No se pudo cargar la información. Haz login")
          ],
        ),
      );
    } else {
      print("Logeado");
      print(snapshot.data);
      user = User(name: snapshot.data.displayName, email: snapshot.data.email, photoURL: snapshot.data.photoUrl);

      return Container(
        child: Column(
          children: <Widget>[
            UserInfoo(user),
            ButtonsBar()
          ],
        ),
      );
    }
  }

}