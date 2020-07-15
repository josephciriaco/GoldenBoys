import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:goldenboys/barbershop/ui/screens/add_photo_screen.dart';
import 'package:goldenboys/barbershop/ui/widgets/card_image_gallery_list.dart';
import 'package:goldenboys/barbershop/ui/widgets/gallery_header.dart';
import 'package:goldenboys/user/bloc/bloc_user.dart';
import 'package:goldenboys/user/model/user.dart';
import '../../../widgets/gradient_back_generico.dart';

class Gallery extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    UserBloc userBloc;
    userBloc = BlocProvider.of<UserBloc>(context);

    return StreamBuilder(
      stream: userBloc.authStatus,
      builder: (BuildContext context, AsyncSnapshot snapshot){
        switch (snapshot.connectionState){
          case ConnectionState.waiting:
            return Center(child: CircularProgressIndicator(),);
          case ConnectionState.none:
            return Center(child: CircularProgressIndicator(),);
          case ConnectionState.active:
            return showPhotosData(snapshot);
          case ConnectionState.done:
            return showPhotosData(snapshot);
          default:
            return showPhotosData(snapshot);
        }
      },
    );
  }

  Widget showPhotosData(AsyncSnapshot snapshot){
    if(!snapshot.hasData || snapshot.hasError){
      return Stack(
        children: [
          GradientBackGenerico(height: 250.0),
          Center(child: Container(margin: EdgeInsets.only(top: 100.0), child: Text("Usuario no logeado. Haz Login o comprueba tu internet."),))
        ],
      );
    } else {
      User user = User(
          uid: snapshot.data.uid,
          name: snapshot.data.displayName,
          email: snapshot.data.email,
          photoURL: snapshot.data.photoUrl
      );

      return Scaffold(
        body: Stack(
          children: [
            GradientBackGenerico(height: 250.0),
            GalleryHeader(),
            Container(
              margin: EdgeInsets.only(top: 80.0),
              child: ListView(
                children: <Widget>[
                  CardImageGalleryList(user)
                ],
              ),
            )
          ],
        ),
      );
    }
  }

}