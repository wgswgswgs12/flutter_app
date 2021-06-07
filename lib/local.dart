import 'package:geolocator/geolocator.dart';
import 'package:async/async.dart';
import 'package:flutter/material.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';

final iconList = <IconData>[
  Icons.brightness_5,
  Icons.brightness_4,
  Icons.brightness_6,
  Icons.brightness_7,
];
var _bottomNavIndex=0;


var lo;

class local extends StatefulWidget {
  _local createState() => _local();
}
class _local extends State<local> {

  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child:lo==null?RaisedButton(
              child: Text('getlocal'),
              onPressed: getLocal,
            ):Text(lo.toString())
        ),

    );
  }

  void getLocal() async {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      lo = position;
      setState((){
        if(lo!=null) {
          print(position.toString());
        }else{

          print("no open local");
        }
      });



  }
}