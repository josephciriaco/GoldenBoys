import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:goldenboys/barbershop/model/barbershop.dart';
import 'package:goldenboys/user/bloc/bloc_user.dart';
import 'package:goldenboys/widgets/button_add_photo_screen_and_reservar.dart';
import 'package:goldenboys/widgets/gradient_back_generico.dart';
import 'package:goldenboys/widgets/text_input.dart';
import 'package:goldenboys/widgets/title_header.dart';
import 'package:image_picker/image_picker.dart';


class AddPhotoScreen extends StatefulWidget{
  @override
  _AddPhotoScreen createState() => _AddPhotoScreen();
}

class _AddPhotoScreen extends State<AddPhotoScreen>{

  File _image;
  final picker = ImagePicker();

  final _controllerTitlePhoto =  TextEditingController();
  final _controllerDescriptionPhoto =  TextEditingController();

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);

    setState(() {
      _image = File(pickedFile.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    UserBloc userBloc = BlocProvider.of<UserBloc>(context);
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: <Widget>[
          GradientBackGenerico(height: 300.0,),
          Row( //esto es el appbar
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: 30.0, left: 5.0),
                child: SizedBox(
                  height: 45.0,
                  width: 45.0,
                  child: IconButton(
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.white, size: 40,
                    ),
                    onPressed: (){
                      Navigator.pop(context);
                    },
                  ),
                ),
              ),

              Flexible(
                child: Container(
                  padding: EdgeInsets.only(top: 30.0, left: 20.0, right: 10.0),
                  child: TitleHeader(title: "Agreaga una foto"),
              ),
              )
            ],
          ),

          Container(
            margin: EdgeInsets.only(top: 80.0),
            child: ListView(
              children: <Widget>[ //aqui contiene la foto
                Stack(
                  alignment: Alignment(0.9,1.0),
                  children: <Widget>[
                    Container(    //aqui contiene la foto
                      alignment: Alignment.center, //esto hace que el texto se alinie al medio
                      height: 350.0,
                      width: screenWidth,
                      margin: EdgeInsets.only(
                          bottom: 20.0
                      ),
                      decoration: BoxDecoration(
                        //borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        color: Colors.white,
                        boxShadow: <BoxShadow>[
                          BoxShadow (
                              color:  Colors.black38,
                              blurRadius: 15.0,
                              offset: Offset(0.0, 7.0)
                          )
                        ]
                      ),
                      child: _image == null? Text('No hay imagen seleccionada.', textAlign: TextAlign.center,) : Image.file(_image),
                    ),
                    FloatingActionButton(
                      onPressed: getImage,
                      tooltip: 'Pick Image',
                      child: Icon(Icons.add_a_photo),
                    ),
                  ],
                ),



                Container(
                  margin: EdgeInsets.only(top: 30.0, bottom: 20.0),
                  child: TextInput(
                    hintText: "Titulo",
                    inputType: null,
                    maxLines: 1,
                    controller: _controllerTitlePhoto,
                  ),
                ), //esto contiene el titulo de la foto
                TextInput( //esto es para la descripcion de la foto
                  hintText: "Descripción",
                  inputType: TextInputType.multiline,
                  maxLines: 5,
                  controller: _controllerDescriptionPhoto,
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 20.0),
                  width: 70.0,
                  child: ButtonAddPhotoScreen(
                    height: 45.0,
                    width: 180.0,
                    buttonText: "Añadir foto",
                    onPressed: (){
                      //ID del usuario logeado actualmente
                      userBloc.currentUser.then((FirebaseUser user) {
                        if(user != null){
                          String uid =  user.uid;
                          String path = "${uid}/${DateTime.now().toString()}.jpg";
                          //1.Firebastore
                          //url -
                          userBloc.uploadFile(path, _image)
                              .then((StorageUploadTask storageUploadTask){
                            storageUploadTask.onComplete.then((StorageTaskSnapshot snapshot){
                              snapshot.ref.getDownloadURL().then((urlImage){
                                print("URLIMAGE: ${urlImage}");

                                //2.cloud Firestore
                                //Photo: title, description, url, userOwner, likes
                                userBloc.updateBarbershopDate(Barbershop(
                                  name: _controllerTitlePhoto.text,
                                  description: _controllerDescriptionPhoto.text,
                                  likes: 0,
                                  urlImage: urlImage
                                )).whenComplete((){
                                  print("TERMINADO");
                                  Navigator.pop(context); //esto es para destruir la ventana, para regresar a la ventana anterior
                                });

                              });
                            });
                          });

                        }
                      });


                    },
                  ),
                )
              ],
            ),
          )

        ],
      ),
    );
  }

}