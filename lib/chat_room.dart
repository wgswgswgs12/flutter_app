import 'package:flutter/material.dart';
import 'package:firebase_chat/firebase_chat.dart';

class MessageBox extends StatelessWidget {
  String text="";

  MessageBox({Key key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold (
      body:
      Container(
         margin: const EdgeInsets.symmetric(vertical: 10.0),
         child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Flexible(
                child: Container(
                 color: Colors.pink,
                 padding: EdgeInsets.all(10.0),
                     child: Text('123',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 5,
                  style: TextStyle(fontSize: 18.0, color: Colors.white)),
            ),
          ),
          Icon(Icons.person, size: 32)
        ],
      ),
    )
    );
  }
}
