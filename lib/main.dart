import 'package:app_recursos/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:splash_screen_view/SplashScreenView.dart';


void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
        Widget splashScreen = SplashScreenView(
      navigateRoute: HomeScreen(),
      duration: 3000,
      imageSize: 130,
      imageSrc: "assets/logo.png", 
      text: "Bem-vindo ao Meu App",
      textStyle: TextStyle(
        fontSize: 30.0,
      ),
      backgroundColor: Colors.white,
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'App com Splash e Drawer',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: splashScreen,
    );
  }
}
