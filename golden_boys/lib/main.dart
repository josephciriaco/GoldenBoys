import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:goldenboys/user/ui/screens/sign_in_screen.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:goldenboys/user/bloc/bloc_user.dart';


void main(){
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarBrightness: Brightness.light
      )
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        child: MaterialApp(
            title: 'Flutter Demo',
            //home: GoldenBoysCupertino(), //MyHomePage(title: 'Flutter Demo Home Page'),
            home: SignInScreen(),
            theme: ThemeData(
              scaffoldBackgroundColor: Color(0xffdbdbdb)
            ),
        ),
        bloc: UserBloc());
  }
}

