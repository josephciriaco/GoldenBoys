import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:goldenboys/barbershop/ui/screens/promotions.dart';
import 'package:goldenboys/barbershop/ui/screens/gallery.dart';
import 'package:goldenboys/barbershop/ui/screens/reservation.dart';
import 'package:goldenboys/user/bloc/bloc_user.dart';
import 'package:goldenboys/user/ui/screens/profile_user.dart';
import 'barbershop/ui/screens/home.dart';

class GoldenBoysCupertino extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      bottomNavigationBar: CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          backgroundColor: Colors.black,
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home, color: Color(0xffcf7500)),
                  title: Text("Inicio",
                  style: TextStyle(
                    color: Color(0xffdbdbdb)
                  ),)
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.star, color: Color(0xffcf7500)),
                  title: Text("Promociones",
                      style: TextStyle(
                          color: Color(0xffdbdbdb)
                      ))
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.photo_library, color: Color(0xffcf7500)),
                  title: Text("Galería",
                      style: TextStyle(
                          color: Color(0xffdbdbdb)
                      ))
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.event, color: Color(0xffcf7500)),
                  title: Text("Reservas",
                      style: TextStyle(
                          color: Color(0xffdbdbdb)
                      ))
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person, color: Color(0xffcf7500),),
                  title: Text("Perfil",
                      style: TextStyle(
                          color: Color(0xffdbdbdb)
                      ))
              ),
            ]
        ),

        tabBuilder: (BuildContext context, int index) {
          switch (index) {
            case 0:
              return CupertinoTabView(
                builder: (BuildContext context) => Home(),
              );
              break;
            case 1:
              return CupertinoTabView(
                builder: (BuildContext context) => Promotions(),
              );
              break;
            case 2:
              return CupertinoTabView(
                builder: (BuildContext context) {
                  return BlocProvider<UserBloc>(bloc: UserBloc(), child: Gallery(),);
                },
              );
              break;
            case 3:
              return CupertinoTabView(
                builder: (BuildContext context) => Reservation(),
              );
              break;
            case 4:
              return CupertinoTabView(
                builder: (BuildContext context) {
                  return BlocProvider<UserBloc>(bloc: UserBloc(), child: ProfileUser(),
                  );
                },
              );
              break;

          }

        },
      ),
    );
  }

}