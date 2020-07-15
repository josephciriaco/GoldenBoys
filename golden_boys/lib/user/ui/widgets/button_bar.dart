import 'dart:io';

import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:goldenboys/barbershop/ui/screens/add_photo_screen.dart';
import 'package:goldenboys/user/bloc/bloc_user.dart';
import 'circle_button.dart';

class ButtonsBar extends StatelessWidget {
  UserBloc userBloc;

  @override
  Widget build(BuildContext context) {
    userBloc = BlocProvider.of(context);
    return Padding(
        padding: EdgeInsets.symmetric(
            horizontal: 0.0,
            vertical: 10.0
        ),
        child: Row(
          children: <Widget>[
            //cambiar la contraseña
            CircleButton(true, Icons.event, 20.0, Color.fromRGBO(255, 255, 255, 0.6),
                    () => {}),

            //añadir una nueva foto
            CircleButton(false, Icons.add, 40.0, Color.fromRGBO(255, 255, 255, 1),
                    () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder:
                        (BuildContext context) => AddPhotoScreen()));
                    }),

            //cerrar sesión
            CircleButton(true, Icons.exit_to_app, 20.0, Color.fromRGBO(255, 255, 255, 0.6),
                    () => {
              userBloc.signOut()
                    })
          ],
        )
    );
  }

}