import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:goldenboys/user/bloc/bloc_user.dart';
import 'package:goldenboys/user/model/user.dart';
import 'package:goldenboys/user/ui/screens/profile_header.dart';
import 'package:goldenboys/user/ui/widgets/profile_barbershop_list.dart';
import 'package:goldenboys/widgets/gradient_back_generico.dart';
import 'package:goldenboys/widgets/title_header.dart';


class ProfileUser extends StatelessWidget {
  UserBloc userBloc;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    userBloc = BlocProvider.of<UserBloc>(context);

    return StreamBuilder(
      stream: userBloc.authStatus,
      builder: (BuildContext context, AsyncSnapshot snapshot){
        switch (snapshot.connectionState){
          case ConnectionState.waiting:
            return Center(child: CircularProgressIndicator(),);
          case ConnectionState.done:
            return Center(child: CircularProgressIndicator(),);

          case ConnectionState.active:
            return showProfileData(snapshot);
          case ConnectionState.none:
            return showProfileData(snapshot);
          default:
        }
      },
    );
  }

  Widget showProfileData(AsyncSnapshot snapshot){
    if(!snapshot.hasData || snapshot.hasError){
      print("No logeado");

      return Stack(
        children: <Widget>[
          GradientBackGenerico(height: 360.0),
          ListView(
            children: <Widget>[
              Container(
                alignment: Alignment.center,
                child: Text("Usuario no logeado. Haz Login.", textAlign: TextAlign.center,),
              )
            ],
          ),
        ],
      );
    } else{
      print("Usuario logeado");
      var user = User(
          uid: snapshot.data.uid,
          name: snapshot.data.displayName,
        email: snapshot.data.email,
        photoURL: snapshot.data.photoUrl
      );
      return Stack(
        children: <Widget>[
          GradientBackGenerico(height: 360.0),
          Container(
            margin: EdgeInsets.only(top: 30.0, left: 20.0),
            child: TitleHeader(title: "Perfil"),
          ),
          Container(
            margin: EdgeInsets.only(top: 80.0),
            child: ListView(
              children: <Widget>[
                ProfileHeader(user), //User datos
                ProfileBarbershopList(user) //User uid
              ],
            ),
          ),
        ],
      );
    }
  }
}
