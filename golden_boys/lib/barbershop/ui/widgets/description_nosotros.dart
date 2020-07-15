import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:goldenboys/barbershop/ui/widgets/google_map_nosotros.dart';
import 'package:goldenboys/barbershop/ui/widgets/profile_barber_nosotros.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class DescriptionNosotros extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _DescriptionNosotros();
  }
}

class _DescriptionNosotros extends State<DescriptionNosotros> {

  GoogleMapController mapController;
  final LatLng _center = const LatLng(-11.999822, -77.054840);
  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  //esto es para poner un marcador
  List<Marker> allMarkers= [];
  @override
  void initState(){
    super.initState();
    allMarkers.add(Marker(
        markerId: MarkerId('myMarker'),
        draggable: false,
        onTap: (){
          print('Marker Tapped');
        },
        position: LatLng(-11.999822, -77.054840)
    ));
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            height: 250,
            width: screenWidth,
            child: GoogleMap(
              onMapCreated: _onMapCreated,
              myLocationEnabled: true,
              initialCameraPosition: CameraPosition(
                target: _center,
                zoom: 16.0,
              ),
              markers: Set.from(allMarkers),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
            width: screenWidth,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "AV. Las Violetas #684-686 Indenpendencia-Lima",
                  style: TextStyle(
                      fontFamily: "Lato", fontSize: 14.0, color: Colors.black),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 5.0),
                  child: Text(
                    "info@goldenboysbarbershop.com",
                    style: TextStyle(
                        fontFamily: "Lato",
                        fontSize: 14.0,
                        color: Colors.black),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 5.0),
                  child: Text(
                    "+51 959 181 504",
                    style: TextStyle(
                        fontFamily: "Lato",
                        fontSize: 14.0,
                        color: Colors.black),
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  //botom de whatsapp
                  height: 40.0, width: 130.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0),
                      gradient: LinearGradient(
                          colors: [Color(0xFFf0a500), Color(0xFFcf7500)],
                          begin: FractionalOffset(0.2, 0.0),
                          end: FractionalOffset(1.0, 0.6),
                          stops: [0.0, 0.6],
                          tileMode: TileMode.clamp)),
                  child: InkWell(
                    onTap: () {
                    },
                    child: Center(
                      child: Text(
                        "RESERVAR",
                        style: TextStyle(
                            fontFamily: "Lato",
                            fontSize: 12.0,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 40.0, left: 40.0),
                ),
                Container(
                  //ver mapa en la app de google map
                  height: 40.0, width: 130.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0),
                      gradient: LinearGradient(
                          colors: [Color(0xFFf0a500), Color(0xFFcf7500)],
                          begin: FractionalOffset(0.2, 0.0),
                          end: FractionalOffset(1.0, 0.6),
                          stops: [0.0, 0.6],
                          tileMode: TileMode.clamp)),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => GoogleMapNosotros()),
                      );
                    },
                    child: Center(
                      child: Text(
                        "COMO LLEGAR",
                        style: TextStyle(
                            fontFamily: "Lato",
                            fontSize: 12.0,
                            color: Colors.white),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          //esto es la histaria de Golden Boys
          Container( //Titulo
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(top: 30.0, left: 10.0, right: 10.0),
            child: Text(
              "Nuestra Historia",
              style: TextStyle(
                fontFamily: "Lato",
                fontSize: 20.0,
                color: Colors.black,
                fontWeight: FontWeight.w600, ),
            ),
          ),
          Container( //breve historia parte uno
            margin: EdgeInsets.only(top: 20.0, left: 15.0, right: 15.0),
            child: Text(
              "Golden Boys BARBERSHOP llega a Lima con un concepto novedoso, innovador y exclusivo, creado especialmente a partir de ls exigencias de nuestros clientes y con la colaboración de las mejores marcas.",
              style: TextStyle(
                fontFamily: "Lato",
                fontSize: 15.0,
                color: Colors.black,),
              textAlign: TextAlign.left,
            ),
          ),
          Container( //breve historia parte dos
            margin: EdgeInsets.only(top: 20.0, left: 15.0, right: 15.0),
            child: Text(
              "El concepto de BARBERSHOP Golden Boys ofrece una transpariencia entre nuestra profesionalidad y nuestros clientes en la utilización de los productos técnicos. Disfrutará de un diagnostico personalizado, cortes, peinados, colores y degradados con un acabado y tratamiento de lata calidad.",
              style: TextStyle(
                fontFamily: "Lato",
                fontSize: 15.0,
                color: Colors.black,),
              textAlign: TextAlign.left,
            ),
          ),
          Container( //breve historia parte dos
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(top: 20.0, left: 15.0, right: 15.0),
            child: Text(
              "Quieres verte bien?... Somos tu mejor opción!",
              style: TextStyle(
                fontFamily: "Lato",
                fontSize: 15.0,
                color: Colors.black,),
            ),
          ),
          Container( //breve historia parte dos
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(top: 20.0, left: 15.0, right: 15.0),
            child: Text(
              "Promociones y más promociones, ven y visitanos!",
              style: TextStyle(
                fontFamily: "Lato",
                fontSize: 15.0,
                color: Colors.black,),
            ),
          ),
          Container( //Titulo
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(top: 30.0, left: 10.0, right: 10.0,bottom: 10.0),
            child: Text(
              "Horario de atención",
              style: TextStyle(
                fontFamily: "Lato",
                fontSize: 20.0,
                color: Colors.black,
                fontWeight: FontWeight.w600, ),
            ),
          ),
          //esto es para la lista de horario
          Container(
            padding: EdgeInsets.all(5.0),
            child: Row(
              children: <Widget>[
                Expanded(flex: 2, child: Row(
                    children: <Widget>[
                      Icon(Icons.check_box),
                      Padding(padding: EdgeInsets.only(left: 5.0), child: Text("Lunes", style: TextStyle(fontFamily: "Lato", fontSize: 18.0, color: Colors.black)),)
                    ],),),
                Expanded(flex: 1, child: Text("09:00-19:00",textAlign: TextAlign.right, style: TextStyle(fontFamily: "Lato", fontSize: 15.0, color: Colors.black)),)
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(5.0),
            child: Row(
              children: <Widget>[
                Expanded(flex: 2, child: Row(
                  children: <Widget>[
                    Icon(Icons.check_box),
                    Padding(padding: EdgeInsets.only(left: 5.0), child: Text("Martes", style: TextStyle(fontFamily: "Lato", fontSize: 18.0, color: Colors.black)),)
                  ],),),
                Expanded(flex: 1, child: Text("09:00-19:00",textAlign: TextAlign.right, style: TextStyle(fontFamily: "Lato", fontSize: 15.0, color: Colors.black)),)
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(5.0),
            child: Row(
              children: <Widget>[
                Expanded(flex: 2, child: Row(
                  children: <Widget>[
                    Icon(Icons.check_box),
                    Padding(padding: EdgeInsets.only(left: 5.0), child: Text("Miercoles", style: TextStyle(fontFamily: "Lato", fontSize: 18.0, color: Colors.black)),)
                  ],),),
                Expanded(flex: 1, child: Text("09:00-19:00",textAlign: TextAlign.right, style: TextStyle(fontFamily: "Lato", fontSize: 15.0, color: Colors.black)),)
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(5.0),
            child: Row(
              children: <Widget>[
                Expanded(flex: 2, child: Row(
                  children: <Widget>[
                    Icon(Icons.check_box),
                    Padding(padding: EdgeInsets.only(left: 5.0), child: Text("Jueves", style: TextStyle(fontFamily: "Lato", fontSize: 18.0, color: Colors.black)),)
                  ],),),
                Expanded(flex: 1, child: Text("09:00-19:00",textAlign: TextAlign.right, style: TextStyle(fontFamily: "Lato", fontSize: 15.0, color: Colors.black)),)
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(5.0),
            child: Row(
              children: <Widget>[
                Expanded(flex: 2, child: Row(
                  children: <Widget>[
                    Icon(Icons.check_box),
                    Padding(padding: EdgeInsets.only(left: 5.0), child: Text("Viernes", style: TextStyle(fontFamily: "Lato", fontSize: 18.0, color: Colors.black)),)
                  ],),),
                Expanded(flex: 1, child: Text("09:00-19:00",textAlign: TextAlign.right, style: TextStyle(fontFamily: "Lato", fontSize: 15.0, color: Colors.black)),)
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(5.0),
            child: Row(
              children: <Widget>[
                Expanded(flex: 2, child: Row(
                  children: <Widget>[
                    Icon(Icons.check_box),
                    Padding(padding: EdgeInsets.only(left: 5.0), child: Text("Sabado", style: TextStyle(fontFamily: "Lato", fontSize: 18.0, color: Colors.black)),)
                  ],),),
                Expanded(flex: 1, child: Text("09:00-19:00",textAlign: TextAlign.right, style: TextStyle(fontFamily: "Lato", fontSize: 15.0, color: Colors.black)),)
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(5.0),
            child: Row(
              children: <Widget>[
                Expanded(flex: 2, child: Row(
                  children: <Widget>[
                    Icon(Icons.check_box_outline_blank),
                    Padding(padding: EdgeInsets.only(left: 5.0), child: Text("Domingo", style: TextStyle(fontFamily: "Lato", fontSize: 18.0, color: Colors.black)),)
                  ],),),
                Expanded(flex: 1, child: Text("Cerrado",textAlign: TextAlign.right, style: TextStyle(fontFamily: "Lato", fontSize: 15.0, color: Colors.black)),)
              ],
            ),
          ),
          Container( //Titulo
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(top: 30.0, left: 10.0, right: 10.0,bottom: 10.0),
            child: Text(
              "Barberos",
              style: TextStyle(
                fontFamily: "Lato",
                fontSize: 20.0,
                color: Colors.black,
                fontWeight: FontWeight.w600, ),
            ),
          ),
          //esto son la litsta de barberos
          Container(padding: EdgeInsets.all(10.0),
            child: Row(
              children: <Widget>[
                Expanded(flex: 1,
                  child: Container(margin: EdgeInsets.only(right: 10.0,), width: 100.0, height: 100.0, decoration: BoxDecoration(shape: BoxShape.circle, image: DecorationImage(fit: BoxFit.cover, image: AssetImage("assets/images/corte_colita.png")),
                      boxShadow: <BoxShadow>[BoxShadow(color: Colors.black38, blurRadius: 6.0, offset: Offset(0.0, 5.0))]),
                    child: FlatButton(child: null,
                      onPressed: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) =>
                              ProfileBarberNosotros(
                                title: "Sergio Benahavente",
                                pathImage: "assets/images/corte_degradado.jpg",
                                height: 320.0,
                                width: 340.0,
                                top: 10.0, bottom: 0.0, left: 20.0,
                              )),
                        );
                      },),),
                ),
                Expanded(flex: 2, child: FlatButton(child: Text("Sergio Benahavente",textAlign: TextAlign.left, style: TextStyle(fontFamily: "Lato", fontSize: 20.0, color: Colors.black)),
                  onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>
                          ProfileBarberNosotros(
                            title: "Sergio Benahavente",
                            pathImage: "assets/images/corte_degradado.jpg",
                            height: 320.0,
                            width: 340.0,
                            top: 10.0, bottom: 0.0, left: 20.0,
                          )),
                    );
                  },
                ))
              ],),
          ),

          Divider(height: 10, thickness: 1, color: Colors.grey, endIndent: 20, indent: 0,),

          Container(padding: EdgeInsets.all(10.0),
            child: Row(
              children: <Widget>[
                Expanded(flex: 1,
                  child: Container(margin: EdgeInsets.only(right: 10.0,), width: 100.0, height: 100.0, decoration: BoxDecoration(shape: BoxShape.circle, image: DecorationImage(fit: BoxFit.cover, image: AssetImage("assets/images/corte_colita.png")),
                      boxShadow: <BoxShadow>[BoxShadow(color: Colors.black38, blurRadius: 6.0, offset: Offset(0.0, 5.0))]),
                    child: FlatButton(child: null,
                      onPressed: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) =>
                              ProfileBarberNosotros(
                                title: "Pepe Timoteo",
                                pathImage: "assets/images/corte_cachetada.jpg",
                                height: 320.0,
                                width: 340.0,
                                top: 10.0, bottom: 0.0, left: 20.0,
                              )),
                        );
                      },),),
                ),
                Expanded(flex: 2, child: FlatButton(child: Text("Pepe Timoteo",textAlign: TextAlign.left, style: TextStyle(fontFamily: "Lato", fontSize: 20.0, color: Colors.black)),
                  onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>
                          ProfileBarberNosotros(
                            title: "Pepe Timoteo",
                            pathImage: "assets/images/corte_cachetada.jpg",
                            height: 320.0,
                            width: 340.0,
                            top: 10.0, bottom: 0.0, left: 20.0,
                          )),
                    );
                  },
                ))
              ],),
          )

        ],
      ),
    );
  }
}
