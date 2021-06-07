import 'package:story/story_page_view/story_page_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Story_UI extends StatelessWidget{
  Widget build(BuildContext context){
    return Scaffold(
      body:
        StoryPageView(
          itemBuilder:(context,pageIndex,storyIndex){

          return Center(
            child: Text("限時動態測試"),
            );
        },
          storyLength:(pageIndex){
          return 6;
          },
          pageLength: 2,

        )

    );

  }
}