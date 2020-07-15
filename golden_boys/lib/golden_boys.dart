import 'package:flutter/material.dart';
import 'barbershop/ui/screens/home.dart';
import 'barbershop/ui/screens/promotions.dart';
import 'barbershop/ui/screens/gallery.dart';
import 'barbershop/ui/screens/reservation.dart';

class GoldenBoys extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _GoldenBoys();
  }

}

class _GoldenBoys extends State<GoldenBoys>{

  int indexTap = 0;
  final List<Widget> widgetsChildren = [
    Home(),
    Promotions(),
    Gallery(),
    Reservation(),
  ];

  void onTapTapped(int index){
    setState(() {
      indexTap = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
      body: widgetsChildren[indexTap],
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Colors.black12,
          primaryColor: Colors.amber
        ),
        child: BottomNavigationBar(
          onTap: onTapTapped,
          currentIndex: indexTap,

          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text("Home",
              style: TextStyle(
                color: Colors.indigo
              ),)
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.star),
                title: Text("Promociones",
                style: TextStyle(
                  color: Colors.indigo
                ),)
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.photo_library),
                title: Text("Galería",
                style: TextStyle(
                  color: Colors.indigo
                ),)
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.event),
                title: Text("Reservar",
                style: TextStyle(
                  color: Colors.indigo
                ),)
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.person),
                title: Text("Perfil",
                style: TextStyle(
                  color: Colors.indigo
                ),)
            )
          ]
        ),
      ),
    );
  }

}