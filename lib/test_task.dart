import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'local.dart';
import 'loginpage.dart';
import 'cloud.dart';

class test_task extends StatelessWidget {

  var return_message="請按重整按鈕獲取任務訊息";
  Widget build(BuildContext context){
    return  Scaffold(
      body: Center(

             child:Column(
                children: <Widget>[
                   FutureBuilder(
                                 future: FirebaseFirestore.instance.collection('nowTask').doc(userName).get(),
                                  builder: (BuildContext context,  snapshot) {
                                     if (snapshot.data()['TaskuserName']!=null) {
                                         return_message = snapshot.data['TaskuserName'];
                                        // return_message ="任務對象:"+ snapshot.data['TaskuserName']+"\r\n標題: "+snapshot.data()['title']+"\r\n距離: "+snapshot.data()['m'].toString()+"\r\n內容: "+snapshot.data()['content']+"\r\n獎勵: "+snapshot.data()['reward']+"\r\n備註: "+snapshot.data()['Remarks'];
                                           return Text(return_message);


                                                //return_message="任務對象: $taskuserName\r\n標題: $title\r\n距離: \r\n內容: $content\r\n獎勵: $reward\r\n備註: $Remarks";
                                              }else{
                                                return_message="error not get any message";
                                                  return Text(return_message);
                                                  }
                                                      } )
                                              ]))
                                              );
  }
}