

import 'package:flutter/material.dart';
import 'package:goldenboys/user/model/user.dart';

class Barbershop {
  String id;
  String name;
  String description;
  String urlImage;
  int likes;
  bool liked;
  //User userOwner;

  Barbershop({
    Key Key,
    @required this.name,
    @required this.description,
    @required this.urlImage,
    @required this.likes,
    this.liked,
    this.id
    //@required this.userOwner
});
}