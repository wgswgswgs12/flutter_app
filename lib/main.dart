import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_app/conet.dart';
import 'package:flutter_app/loginpage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import "PageView.dart";
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';

final iconList = <IconData>[
  Icons.brightness_5,
  Icons.brightness_4,
  Icons.brightness_6,
  Icons.brightness_7,
];
var _bottomNavIndex=0;

int _page=0;
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner:false,
        theme: ThemeData(
          primaryColorBrightness: Brightness.light,
          primarySwatch: Colors.blue,
        ),

      home :Scaffold(
        /*
       // backgroundColor: Theme.of(context).primaryColor,
         bottomNavigationBar: CurvedNavigationBar(
            //buttonBackgroundColor :Colors.blueAccent,
            backgroundColor: Colors.blueAccent,
            height:60.0,
            items: <Widget>[
              Icon(Icons.add, size: 30),
              Icon(Icons.list, size: 30),
              Icon(Icons.compare_arrows, size: 30),
            ],
          ),
*/
          body:pageView(),

      )



      );
    //);
  }
}




