import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextInput extends StatelessWidget{

  final String hintText;
  final TextInputType inputType;
  final TextEditingController controller;
  int maxLines = 1;

  TextInput({
    Key Key,
    @required this.hintText,
    @required this.inputType,
    @required this.controller,
    this.maxLines
  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: EdgeInsets.only(right: 20.0, left: 20.0),
      child: TextField(
        controller: controller,
        keyboardType: inputType,
        maxLines: maxLines,
        style: TextStyle(
          fontSize: 15.0,
          color: Colors.blueGrey,
        ),
        decoration: InputDecoration(
          filled: true,
          fillColor: Color(0xFFffffff),
          border: InputBorder.none,
          hintText: hintText,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFFffffff)),
            borderRadius: BorderRadius.all(Radius.circular(12.0))
          ),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xFFffffff)),
                borderRadius: BorderRadius.all(Radius.circular(12.0))
            )
        ),
      ),
      decoration: BoxDecoration(
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10.0,
            offset: Offset(0.0, 9.0)
          )
        ]
      ),
    );
  }

}