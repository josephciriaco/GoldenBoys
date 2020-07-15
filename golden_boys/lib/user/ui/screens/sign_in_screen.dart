import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:goldenboys/golden_boys_cupertino.dart';
import 'package:goldenboys/user/bloc/bloc_user.dart';
import 'package:goldenboys/user/model/user.dart';
import 'package:goldenboys/widgets/button_general.dart';
import 'file:///C:/Users/joseph/AndroidStudioProjects/GoldenBoys/golden_boys/lib/curved_navigation_bar.dart';
import 'package:goldenboys/widgets/gradient_back_login.dart';
import 'package:goldenboys/widgets/subtitulo_login.dart';
import 'package:goldenboys/widgets/titulo_login.dart';

class SignInScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _SignInScreen();
  }
}

class _SignInScreen extends State<SignInScreen>{

  UserBloc userBloc;
  double screenWidth;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    screenWidth = MediaQuery.of(context).size.width;
    userBloc = BlocProvider.of(context); ///aqui estoy instanciando el objeto user, para poder usarlo
    return _handleCurrentSession();
  }

  //este metodo es para podeer decidir que pantalla abrir, si es la pantalla de sesion o el home
  Widget _handleCurrentSession(){
    return StreamBuilder(
      stream: userBloc.authStatus,
      builder: (BuildContext context, AsyncSnapshot snapshot){
        //snapshot contiene nuestros datos osea nuestro objeto user
        if(snapshot.hasData) {
          return BottomNavBar();
        } if (snapshot.hasError) {
          return Text("Ocurrio un error en la transmision de datos");
        } if(snapshot.connectionState != ConnectionState.waiting) {
          return signInGoogleUI();
        } else {
          return Container(
            color: Colors.white,
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 20.0),
                  child: Text(
                    "G O L D E N   B O Y S   B A R B E R S H O P",
                    style: TextStyle(
                      color: Color(0xff000000),
                      fontSize: 22,
                    ),
                  ),
                )
              ],
            ),
          );
        }
      },
    );
  }

  Widget signInGoogleUI(){
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          GradientBackLogin(null, "assets/images/fondo_loginDos.jpg"),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[

              SizedBox(
                height: MediaQuery.of(context).size.height/3,
                child: Column(
                  children: <Widget>[
                    TituloLogin("Bienvenido"),
                    SubTituloLogin("¿Q U I E R E S   V E R T E   B I E N?"),
                  ],
                ),
              ),

              FittedBox(
                  child: Text(
                    "Reserva tu próxima cita",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 15.0,
                      fontFamily: "Lato",
                      color: Color(0xffdbdbdb),
                    ),
                  ),
                ),

              ButtonGeneral(
                width: screenWidth,
                height: 50.0,
                text: "INGRESA CON GMAIL",
                onPressed: (){
                userBloc.signOut(); // esto es para forzar el cierre de sesion del usuario
                  userBloc.signIn().then((FirebaseUser user) {
                    userBloc.updateUserData(User(
                      uid: user.uid,
                      name: user.displayName,
                      email: user.email,
                      photoURL: user.photoUrl
                    ));
                  });
                  },
                icon: "G",

              ),
              Container(margin: EdgeInsets.only(bottom: 20.0),
                child: ButtonGeneral(
                  width: screenWidth,
                  height: 50.0,
                  text: "INGRESA CON FACEBOOK",
                  onPressed: (){
                    userBloc.signOut(); // esto es para forzar el cierre de sesion del usuario
                    userBloc.signIn().then((FirebaseUser user) {
                      userBloc.updateUserData(User(
                          uid: user.uid,
                          name: user.displayName,
                          email: user.email,
                          photoURL: user.photoUrl
                      ));
                    });
                  },
                  icon: "f",
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 60, left: 60, bottom: 10),
                child: FittedBox(alignment: Alignment.bottomCenter,
                  child: Text("Powered by Empresas Ciriaco", style: TextStyle(color: Color(0xffdbdbdb), fontSize: 12, fontFamily: "Lato"),),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

}