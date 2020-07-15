import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:goldenboys/barbershop/model/barbershop.dart';
import 'package:goldenboys/barbershop/ui/widgets/card_image_gallery.dart';
import 'package:goldenboys/user/bloc/bloc_user.dart';
import 'package:goldenboys/user/model/user.dart';

class CardImageGalleryList extends StatefulWidget{
  User user;
  CardImageGalleryList(@required this.user);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _CardImageGalleryList();
  }
}

class _CardImageGalleryList extends State<CardImageGalleryList> {
  UserBloc userBloc;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    userBloc = BlocProvider.of<UserBloc>(context);
    double screenWidth = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      child: FittedBox(
        fit: BoxFit.fill,
        child: Container(
            height: MediaQuery.of(context).size.height * 0.85, //alto del contenedor
            width: screenWidth,
            child: StreamBuilder(
              stream: userBloc.photosStream,
              builder: (context, AsyncSnapshot snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.waiting:
                    print("PLACESLIST: WAITING");
                    return Center(child: CircularProgressIndicator());
                  case ConnectionState.none:
                    print("PLACESLIST: NONE");
                    return Center(child: CircularProgressIndicator());

                  case ConnectionState.active:
                    print("PLACESLIST: ACTIVE");
                    return listViewPhotos(
                        userBloc.buildPhotos(snapshot.data.documents, widget.user));
                  case ConnectionState.done:
                    print("PLACESLIST: DONE");
                    return listViewPhotos(
                        userBloc.buildPhotos(snapshot.data.documents, widget.user));
                  default:
                    print("PLACESLIST: DEFAULT");
                }
              },
            )

        ),
      ),
    );
  }


  Widget listViewPhotos(List<Barbershop> photos){

    void setLiked(Barbershop barbershop){
      setState(() {
        barbershop.liked = !barbershop.liked;
        userBloc.likePhoto(barbershop, widget.user.uid);
      });
    }
    IconData iconDataLiked = Icons.favorite;
    IconData iconDataLike = Icons.favorite_border;
    return ListView(
      scrollDirection: Axis.vertical,
      children: photos.map((barbershop){
        return CardImageGallery(
          pathImage: barbershop.urlImage,
          width: MediaQuery.of(context).size.width,
          top: 0.0,
          bottom: 50.0,
          left: 10.0,
          color: Colors.amberAccent,
          iconData: barbershop.liked?iconDataLiked:iconDataLike,
          onPressedFabIcon: (){
            setLiked(barbershop);
          },
          internet: true,
        );
      }).toList(),
    );
  }


}





//Container(margin: EdgeInsets.only(top: 20.0),child: TitleHeader(title: "GOLDENPHOTO",),),