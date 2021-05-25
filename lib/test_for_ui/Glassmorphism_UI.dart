import 'package:glassmorphism/glassmorphism.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/cloud.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';

class Glass_UI extends StatelessWidget{

  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text(
      "發表任務",
      // widget.title,
      style: TextStyle(color: Colors.white),
        ),
      ),
          body:Container(

                height: double.infinity,
                  width: double.infinity,
                 child: Stack(
                    children: [
                    /*
                  Image.network(
                       "https://github.com/RitickSaha/glassmophism/blob/master/example/assets/bg.png?raw=true",
                          fit: BoxFit.cover,
                       height: double.infinity,
                      width: double.infinity,
                            scale: 1,
                      ),
                          */
                         SafeArea(
                           child: Center(
                             child:GlassmorphicContainer(
                               width: 350,
                               height: 350,
                               borderRadius: 20,
                               blur: 20,
                               alignment: Alignment.bottomCenter,
                               border: 2,
                               //linearGradient: LinearGradient(),
                               //borderGradient: LinearGradient(),
                               child: UserInformation(),
                                )




    ),
    )
    ])),
        bottomNavigationBar:GNav(
            rippleColor: Colors.grey[800], // tab button ripple color when pressed
            hoverColor: Colors.grey[700], // tab button hover color
            haptic: true, // haptic feedback
            tabBorderRadius: 15,
            tabActiveBorder: Border.all(color: Colors.black, width: 1), // tab button border
            tabBorder: Border.all(color: Colors.grey, width: 1), // tab button border
            tabShadow: [BoxShadow(color: Colors.grey.withOpacity(0.5), blurRadius: 8)], // tab button shadow
            curve: Curves.easeOutExpo, // tab animation curves
            duration: Duration(milliseconds: 900), // tab animation duration
            gap: 8, // the tab button gap between icon and text
            color: Colors.grey[800], // unselected icon color
            activeColor: Colors.black, // selected icon and text color
            iconSize: 24, // tab button icon size
            tabBackgroundColor: Colors.purple.withOpacity(0.1), // selected tab background color
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5), // navigation bar padding
            tabs: [
              GButton(
                icon: LineIcons.home,
                text: 'Home',
              ),
              GButton(
                icon: LineIcons.heart,
                text: 'Likes',
              ),
              GButton(
                icon: LineIcons.search,
                text: 'Search',
              ),
              GButton(
                icon: LineIcons.user,
                text: 'Profile',
              )
            ]
        )

    );
  }


}