import 'package:flutter/material.dart';
import 'package:goldenboys/barbershop/ui/screens/add_photo_screen.dart';
import 'package:goldenboys/widgets/title_header.dart';

class GalleryHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.only(top: 30.0, left: 20.0, right: 20),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 3,
            child: TitleHeader(title: "GoldenPhotos"),
          ),
          Expanded(
            flex: 1,
            child: SizedBox(
              height: 20,
              width: 20,
            ),
          ),
          Expanded(
            flex: 1,
            child: FlatButton(
              child: Icon(
                Icons.add_a_photo,
                color: Colors.white,
                size: 30.0,
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => AddPhotoScreen()));
              },
            ),
          ),
        ],
      ),
    );
  }
}
