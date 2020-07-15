import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:goldenboys/barbershop/ui/screens/cut_detail_dialog.dart';
import 'package:goldenboys/widgets/title_header.dart';
import 'prueba_promotions_data.dart';

class PruebaPromotions extends StatefulWidget {
  @override
  _PruebaPromotions createState() => _PruebaPromotions();
}

class _PruebaPromotions extends State<PruebaPromotions> {
  final ImagenCabecera Imagenpromo = ImagenCabecera();
  ScrollController controller = ScrollController();
  bool closeTopContainer = false;
  double topContainer = 0;

  List<Widget> itemsData = [];

  void getPostsData() {
    List<dynamic> responseList = FOOD_DATA;
    List<Widget> listItems = [];
    responseList.forEach((post) {
      listItems.add(InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => CutDetailDialog(
                      pathImage: "assets/images/corte_colita.png",
                      title: "Promociones",
                      height: 300.0,
                      width: 320.0,
                      top: 20.0,
                      bottom: 0.0,
                      left: 20.0)));
        },
        child: Container(
            height: 100,
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withAlpha(100), blurRadius: 10.0),
                ]),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
              child: Row(
                //mainAxisAlignment: MainAxisAlignment.spaceBetween, //esto es para que se alinean a los extremos
                children: <Widget>[
                  Expanded(
                    flex: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        FittedBox(
                          child: Text(
                            post["name"],
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                                fontFamily: "Lato",
                                fontWeight: FontWeight.w200),
                          ),
                        ),
                        FittedBox(
                          child: Text(
                            post["brand"],
                            style: TextStyle(
                                fontSize: 13,
                                color: Colors.black,
                                fontFamily: "Lato",
                                fontStyle: FontStyle.italic),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Column(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(top: 10),
                          child: FittedBox(
                            child: Text(
                              post["price"],
                              style:
                                  TextStyle(fontSize: 18, color: Colors.black),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 1,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )),
      ));
    });
    setState(() {
      itemsData = listItems;
    });
  }

  @override
  void initState() {
    super.initState();
    getPostsData();
    controller.addListener(() {
      double value = controller.offset / 119;

      setState(() {
        topContainer = value;
        closeTopContainer = controller.offset > 20;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double categoryHeight = size.height * 0.50; //esto es la altura de la imagenCabecera
    return Container(
      height: size.height,
      child: Column(
        children: <Widget>[
          Container(alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(top:30, left: 20.0,),
            child: TitleHeader(title: "Promociones"),
          ),

          SizedBox(
            height: 10,
          ),

          AnimatedOpacity(
            duration: Duration(milliseconds: 200),
            opacity: closeTopContainer ? 0 : 1,
            child: AnimatedContainer(
                duration: Duration(milliseconds: 200),
                width: size.width,
                alignment: Alignment.topCenter,
                height: closeTopContainer ? 0 : categoryHeight,
                child: Imagenpromo),
          ),

          Expanded(
              child: ListView.builder(
                  controller: controller,
                  itemCount: itemsData.length,
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    double scale = 1.0;
                    if (topContainer > 0.5) {
                      scale = index + 0.1 - topContainer;
                      if (scale < 0) {
                        scale = 0;
                      } else if (scale > 1) {
                        scale = 1;
                      }
                    }
                    return Opacity(
                      opacity: scale,
                      child: Transform(
                        transform: Matrix4.identity()..scale(scale, scale),
                        alignment: Alignment.bottomCenter,
                        child: Align(
                            heightFactor: 0.7,
                            alignment: Alignment.topCenter,
                            child: itemsData[index]),
                      ),
                    );
                  })),
        ],
      ),
    );
  }
}

//esta clase es la imagen de arriba

class ImagenCabecera extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double categoryHeight = MediaQuery.of(context).size.height * 0.60 - 50;
    return FittedBox(
      fit: BoxFit.fill,
      alignment: Alignment.topCenter,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: categoryHeight,
        margin: EdgeInsets.only(right: 10, left: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(15.0)),
            boxShadow: <BoxShadow>[ //esto es para agregar una sombra
              BoxShadow(
                  color: Colors.black38, //el color de la sombra
                  blurRadius: 10.0, //que tan degradado quieres
                  offset: Offset(0.0, 4.0) //la posicion de la sombra en X y Y
                  )
            ],
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("assets/images/promotions.jpg"))),
      ),
    );
  }
}
