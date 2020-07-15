import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:goldenboys/barbershop/ui/screens/gallery.dart';
import 'package:goldenboys/barbershop/ui/screens/home.dart';
import 'package:goldenboys/barbershop/ui/screens/promotions.dart';
import 'package:goldenboys/barbershop/ui/screens/reservation.dart';
import 'package:goldenboys/user/bloc/bloc_user.dart';
import 'package:goldenboys/user/ui/screens/profile_user.dart';

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int pageIndex = 0;

  final Home _home = Home();
  final Promotions _Promotions = Promotions();
  final Gallery _Gallery = Gallery();
  final Reservation _Reservation = Reservation();
  final ProfileUser _ProfileUser = ProfileUser();

  Widget _showPage = Home();

  Widget _pageChooser(page){
    switch (page) {
      case 0:
        return _home;
        break;
      case 1:
        return _Promotions;
        break;
      case 2:
        return BlocProvider<UserBloc>(bloc: UserBloc(), child: _Gallery,);
        break;
      case 3:
        return _Reservation;
        break;
      case 4:
        return BlocProvider<UserBloc>(bloc: UserBloc(), child: _ProfileUser,);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
          index: pageIndex,
          height: 50.0,
          items: <Widget>[
            Icon(Icons.home, size: 30, color: Color(0xFFf0a500),),
            Icon(Icons.star, size: 30, color: Color(0xFFf0a500),),
            Icon(Icons.photo_library, size: 30, color: Color(0xFFf0a500),),
            Icon(Icons.event, size: 30, color: Color(0xFFf0a500),),
            Icon(Icons.person, size: 30, color: Color(0xFFf0a500),),
          ],
          color: Color(0xFF000000),
          buttonBackgroundColor: Color(0xFF000000),
          backgroundColor: Color(0xFFdbdbdb),
          animationCurve: Curves.easeInOut,
          animationDuration: Duration(milliseconds: 400),
          onTap: (tappedIndex) {
            setState(() {
              _showPage = _pageChooser(tappedIndex);
            });
          },
        ),
        body: Container(
          child: Center(
            child: _showPage,
          ),
        ));
  }
}