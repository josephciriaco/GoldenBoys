import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:goldenboys/barbershop/model/barbershop.dart';
import 'package:goldenboys/user/bloc/bloc_user.dart';
import 'package:goldenboys/user/model/user.dart';
import 'package:goldenboys/user/ui/widgets/profile_barbershop.dart';


class ProfileBarbershopList extends StatelessWidget {

  UserBloc userBloc;
  User user;
  ProfileBarbershopList(@required this.user);

  Barbershop foto = Barbershop(
      name: "Knuckles Mountains Range",
      description: "Hiking. Water fall hunting. Natural bath",
      urlImage: "https://images.unsplash.com/photo-1519681393784-d120267933ba?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80",
      likes: 3

  );
  Barbershop foto2 = Barbershop(
      name: "Mountains",
      description: "Hiking. Water fall hunting. Natural bath', 'Scenery & Photography",
      urlImage: "https://images.unsplash.com/photo-1524654458049-e36be0721fa2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80",
      likes: 10

  );

  @override
  Widget build(BuildContext context) {
    userBloc = BlocProvider.of<UserBloc>(context);

    return Container(
      margin: EdgeInsets.only(
          top: 10.0,
          left: 20.0,
          right: 20.0,
          bottom: 10.0
      ),
      child: StreamBuilder(
          stream: userBloc.myPhotosListStream(user.uid),
          builder: (context, AsyncSnapshot snapshot){
            switch(snapshot.connectionState){
              case ConnectionState.waiting:
                return Center(child: CircularProgressIndicator(),);
              case ConnectionState.done:
                return Column(
                  children: userBloc.buildMyPhotos(snapshot.data.documents)
                );
              case ConnectionState.active:
                return Column(
                    children: userBloc.buildMyPhotos(snapshot.data.documents)
                );
              case ConnectionState.none:
                return Center(child: CircularProgressIndicator(),);
              default:
                return Column(
                    children: userBloc.buildMyPhotos(snapshot.data.documents)
                );
            }
          }

      ),
    );
  }


  /*Column(
        children: <Widget>[
          ProfileBarbershop(foto),
          ProfileBarbershop(foto2),
        ],
      ),*/
}