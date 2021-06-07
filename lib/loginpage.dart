import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_app/conet.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import "PageView.dart";
import 'taskView.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:flutter_app/userIformation/userPersonalpage.dart';
import 'cloud.dart';
var userName;


class loginpage extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = new GoogleSignIn();

  Future<User> _signIn() async {
    GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
    GoogleSignInAuthentication gSA = await googleSignInAccount.authentication;
    final GoogleAuthCredential credential = await GoogleAuthProvider.credential(
        idToken: gSA.idToken,
        accessToken: gSA.accessToken
    );
    final UserCredential authResult = await _auth.signInWithCredential(credential);

    User user = authResult.user;
    userName = user.displayName;
    print("user name: ${user.displayName}");
    return user;
  }

  void _signOut() {
    googleSignIn.signOut();
    print("signout!");
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      appBar: AppBar(
          title: Text("登入"),
    ),
      body:Container(
          alignment: Alignment.center,

        child: Column(
          children: <Widget>[
            SignInButton(
            Buttons.GoogleDark,
            text: "Sign up with Google",
            onPressed: () {
                _signIn().then((User user) => print(user)).catchError((e) => print(e));
                Navigator.pushReplacement(context, MaterialPageRoute<void>(
                  builder: (BuildContext context) => pageView(),
                  fullscreenDialog: true,
                ));
            }

          ),
          RaisedButton(child: Text('login'),
            onPressed: () =>
                _signIn().then((User user) => print(user)).catchError((e) =>
                    print(e)),),
          RaisedButton(child: Text("logout"), onPressed: _signOut,),
          RaisedButton(
              child: Text("查看當前任務"),
              onPressed:()=> Navigator.push(context,
                  MaterialPageRoute(builder: (context) => taskView())))],
      ),
     )
    );
  }
}