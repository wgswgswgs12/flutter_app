import 'package:getwidget/getwidget.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/cloud.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';


class getwidget_testpage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar:AppBar( title :Text("getwidget_test"),),
      body:
       ListView(
         children: <Widget>[
           GFCard(
             boxFit: BoxFit.cover,
             titlePosition: GFPosition.start,
             image: Image.asset('assets/images/1970-01-01 08.00.00 ___yu51316_profilepic.jpg'),
             title: GFListTile(
               avatar: GFAvatar(
                 backgroundImage: AssetImage('assets/images/1970-01-01 08.00.00 ___yu51316_profilepic.jpg'),
               ),
               titleText: '___yu51316',
               subtitleText: '沙灘',
             ),
             content: Text( "Some quick example text to build on the card"),
             buttonBar: GFButtonBar(
               children: <Widget>[
                 GFAvatar(
                   backgroundColor: GFColors.PRIMARY,
                   child: Icon(Icons.share, color: Colors.white,),
                 ),
                 GFAvatar(
                   backgroundColor: GFColors.SECONDARY,
                   child: Icon(Icons.search, color: Colors.white,),
                 ),
                 GFAvatar(
                   backgroundColor: GFColors.SUCCESS,
                   child: Icon(Icons.phone, color: Colors.white,),
                 ),
               ],
             ),
           ),
         ],
       )
      /*
      Column(
          children: <Widget>[
            GFCard(
              boxFit: BoxFit.cover,
              titlePosition: GFPosition.start,
              image: Image.asset('your asset image'),
              title: GFListTile(
                avatar: GFAvatar(
                  backgroundImage: AssetImage('your asset image'),
                ),
                titleText: 'Game Controllers',
                subtitleText: 'PlayStation 4',
              ),
              content: Text( "Some quick example text to build on the card"),
              buttonBar: GFButtonBar(
                children: <Widget>[
                  GFAvatar(
                    backgroundColor: GFColors.PRIMARY,
                    child: Icon(Icons.share, color: Colors.white,),
                  ),
                  GFAvatar(
                    backgroundColor: GFColors.SECONDARY,
                    child: Icon(Icons.search, color: Colors.white,),
                  ),
                  GFAvatar(
                    backgroundColor: GFColors.SUCCESS,
                    child: Icon(Icons.phone, color: Colors.white,),
                  ),
                ],
              ),
            ),

            GFCard(

              boxFit: BoxFit.cover,
              image: Image.asset('assets/images/flutter-logo-round.png'),
              title: GFListTile(
                avatar: GFAvatar(
                  backgroundImage: AssetImage('assets/images/flutter-logo-round.png'),
                ),
                title: Text('Card Title'),
                subtitle: Text('Card Sub Title'),
              ),
              content: Text("Some quick example text to build on the card"),

              buttonBar: GFButtonBar(
                children: <Widget>[
                  GFButton(
                    onPressed: () {},
                    text: 'Buy',
                  ),
                  GFButton(
                    onPressed: () {},
                    text: 'Cancel',
                  ),
                ],
              ),
            ),
          ],

      )*/
    );
  }
}