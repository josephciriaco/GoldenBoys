import 'package:flutter/material.dart';
import 'package:goldenboys/barbershop/model/barbershop.dart';

class User{
  final String uid;
  final String name;
  final String email;
  final String photoURL;
  final List<Barbershop> myPhotos;
  final List<Barbershop> myFavoritePhotos;

  //myFavoritePlaces
  //myPlaces

  User({
    Key Key,
    @required this.uid,
    @required this.name,
    @required this.email,
    @required this.photoURL,
    this.myPhotos,
    this.myFavoritePhotos
});
}