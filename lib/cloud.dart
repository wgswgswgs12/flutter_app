import 'package:cloud_firestore/cloud_firestore.dart';
import 'local.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'loginpage.dart';
import 'package:geolocator/geolocator.dart';
import 'package:getwidget/getwidget.dart';
FirebaseFirestore firestore = FirebaseFirestore.instance;
var id;
//Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
var Remarks;//備註
var reward;//獎勵
var content; //內容
var title;//標題

final TextEditingController titleController = new TextEditingController();
final TextEditingController contentController = new TextEditingController();
final TextEditingController rewardController = new TextEditingController();
final TextEditingController RemarksController = new TextEditingController();


class cloud extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:AppBar(
          title: Text(
            "發表任務",
            // widget.title,
            style: TextStyle(color: Colors.white),
          ),

        ),
        body: SingleChildScrollView(

          child: Column(

            children: <Widget>[
              TextField(
                controller:titleController,
                decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
              /*边角*/
              borderRadius: BorderRadius.all(
              Radius.circular(30), //边角为30
                ),
                borderSide: BorderSide(
                  color: Colors.amber, //边线颜色为黄色
                  width: 2, //边线宽度为2
                ),
              ),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.green, //边框颜色为绿色
                        width: 5, //宽度为5
                      ),
                ),
                border: OutlineInputBorder(),
                labelText: '輸入任務標題',

              ),

              ),




              TextField(
                controller:contentController,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    /*边角*/
                    borderRadius: BorderRadius.all(
                      Radius.circular(30), //边角为30
                    ),
                    borderSide: BorderSide(
                      color: Colors.amber, //边线颜色为黄色
                      width: 2, //边线宽度为2
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.green, //边框颜色为绿色
                      width: 5, //宽度为5
                    ),
                  ),
                  border: OutlineInputBorder(),
                  labelText: '內容',
                ),
              ),
              TextField(
                controller:rewardController,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    /*边角*/
                    borderRadius: BorderRadius.all(
                      Radius.circular(30), //边角为30
                    ),
                    borderSide: BorderSide(
                      color: Colors.amber, //边线颜色为黄色
                      width: 2, //边线宽度为2
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.green, //边框颜色为绿色
                      width: 5, //宽度为5
                    ),
                  ),
                  border: OutlineInputBorder(),
                  labelText: '輸入完成後給予的獎勵',
                ),
              ),
              TextField(
                controller:RemarksController,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    /*边角*/
                    borderRadius: BorderRadius.all(
                      Radius.circular(30), //边角为30
                    ),
                    borderSide: BorderSide(
                      color: Colors.amber, //边线颜色为黄色
                      width: 2, //边线宽度为2
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.green, //边框颜色为绿色
                      width: 5, //宽度为5
                    ),
                  ),
                  border: OutlineInputBorder(),
                  labelText: '備註',
                ),
              ),

              CupertinoButton(
                  color:Colors.blue,
                child: Text('createTask'),
            onPressed:  createTask,
            ),
              CupertinoButton(
                color:Colors.blue,
                child: Text('updateData'),
                   onPressed:  updateData,
    ),
              CupertinoButton(
                color:Colors.blue,
                child: Text('getData'),
                onPressed:  getData,
              ),
              CupertinoButton(
                color:Colors.blue,
                child: Text('delete'),
                onPressed:  delete,
              )

    ]
        )
        )
    );

  }
/*
  void dispose() {
    titleController.dispose();    // 釋放控制器
    RemarksController.dispose();  // 釋放控制器
    rewardController.dispose();  // 釋放控制器
   contentController.dispose();  // 釋放控制器
  }*/

  void getData() {
    try {
      firestore
          .collection("task")
          .get()
          .then((QuerySnapshot snapshot) {
        snapshot.docs.forEach((f) => print(f.data()['userName']));
      });

    } catch (e) {
      print(e.toString());
    }
  }

  void updateData() {

    try {
      firestore
          .collection("task")
          .doc(userName)
          .update({"latitude":lo.latitude,
                    "longitude":lo.longitude,
        'userName': userName
          });
    } catch (e) {
      print(e.toString());
    }
  }

  void delete() {
   // var firebaseUser =  firestore.instance.currentUser;
    firestore.collection("task").doc(userName).delete().then((_) {
      print("success!");
    });
  }


  void createTask() async {
    if(userName==null){
      print('請登入');
    }else {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      lo = position;
      await firestore.collection("task")
          .doc(userName)
          .set({
        'latitude': lo.latitude,
        'longitude':lo.longitude,
        'userName': userName,
        'Remarks':RemarksController.text,
      'reward':rewardController.text,
       'content':contentController.text,
      'title':titleController.text,

      });
    }
    //dispose();
/*
    DocumentReference ref = await firestore.collection("userId")
        .add({
      'latitude': 0.0,
      'longitude':0.0,
      'userName': userName
    });
    id=ref.id;
    print(ref.id);
    */
  }

}




class UserInformation extends StatelessWidget {

  CollectionReference users = FirebaseFirestore.instance.collection('task');
  static  CollectionReference nowtask = FirebaseFirestore.instance.collection('nowtask');
  static  bool enable_contrl =false;

  static void check() async{
    await nowtask.doc(userName).get().then((value){
      if(value.data()['TaskuserName']!=null){
        enable_contrl = true;
      }else{ enable_contrl = false;}
    });
    print("is chaeck and set enable_contrl to  $enable_contrl");
  }

  @override
   Widget build(BuildContext context) {



    //final List<DocumentSnapshot> documents = snapshot.data.docs.where((snapshot) => snapshot.data()["email"] !=userName);
    return StreamBuilder<QuerySnapshot> (

      stream: users.snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {

        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading");
        }
        if(lo==null){
          return new ListView(
            children: snapshot.data.docs.map((DocumentSnapshot document) {
              // var mm=Geolocator.distanceBetween(lo.latitude, lo.longitude, document.data()['latitude'], document.data()['longitude']).toInt().toString();
              return new ListTile(
                  title: new Text("發起人 : "+document.data()['userName'].toString()+"   任務 : "+document.data()['title'].toString()),


                  subtitle: new Text("距離: 請開啟定位後查看距離\r\n獎勵 : "+document.data()['reward']),

                  //subtitle: new Text(document.data()['latitude'].toString()+" "+document.data()['longitude'].toString()),
                  trailing: Icon(Icons.keyboard_arrow_right),
                  onTap: () {

                    Navigator.push(context,
                      MaterialPageRoute(builder: (context) => RegisterPage_nomapidex(document.data()['userName'],document.data()['Remarks'],document.data()['reward'],document.data()['content'],document.data()['title'],userName,document.data()['latitude'],document.data()['longitude'])),);
                    print(document.data()['userName']+" "+" "+document.data()['longitude'].toString());
                    // do something
                  },

                  enabled: document.data()['userName']==userName
                      ?false:true

              );
            }).toList(),
          );

        }else {
          return new ListView(
            children: snapshot.data.docs.map((DocumentSnapshot document) {
              // var mm=Geolocator.distanceBetween(lo.latitude, lo.longitude, document.data()['latitude'], document.data()['longitude']).toInt().toString();
              return new ListTile(
                  title: new Text(
                      "發起人 : " + document.data()['userName'].toString() +
                          "   任務 : " + document.data()['title'].toString()),


                  subtitle: new Text("距離" + Geolocator.distanceBetween(lo
                      .latitude, lo.longitude, document.data()['latitude'],
                      document.data()['longitude']).toInt().toString() +
                      "公尺\r\n獎勵 : " + document.data()['reward']),

                  //subtitle: new Text(document.data()['latitude'].toString()+" "+document.data()['longitude'].toString()),
                  trailing: Icon(Icons.keyboard_arrow_right),
                  onTap: () {
                    Navigator.push(context,
                      MaterialPageRoute(builder: (context) =>
                          RegisterPage(
                              document.data()['userName'],
                              Geolocator.distanceBetween(
                                  lo.latitude, lo.longitude,
                                  document.data()['latitude'],
                                  document.data()['longitude']).toInt(),
                              document.data()['Remarks'],
                              document.data()['reward'],
                              document.data()['content'],
                              document.data()['title'],
                              userName,document.data()['latitude'],document.data()['longitude'])),);
                    print(document.data()['userName'] + " " + document
                        .data()['latitude'].toString() + " " + document
                        .data()['longitude'].toString());
                    // do something
                  },

                  enabled:
                  document.data()['userName'] == userName || enable_contrl
                      ? false
                      : true

              );
            }).toList(),
          );
        }
      },
    );
  }
}

class RegisterPage extends StatelessWidget {
  var myuserName;
  var taskuserName;
  var m;
  var Remarks;
  var reward;
  var content;
  var title;
  var longitude;
  var latitude;
  void getTask() async {
    if (userName == null) {
      print('請登入');
    } else {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      lo = position;
      await firestore.collection("nowTask")
          .doc(myuserName)
          .set({
        'm': m,
        'TaskuserName': taskuserName,
        'Remarks': Remarks,
        'reward': reward,
        'content': content,
        'title': title,
        'longitude':longitude,
        'latitude':latitude,
      });
      firestore.collection("task").doc(taskuserName).delete().then((_) {
        print("success!");
      });
      UserInformation.check();
    }
  }
  RegisterPage(this.taskuserName, this.m, this.Remarks, this.reward,
      this.content, this.title, this.myuserName,this.latitude,this.longitude);

  @override
  Widget build(BuildContext context) {
    //var value=firestore.collection("task").doc(this.userName).get();
    // var latitude =value.data()['title'];
    return Scaffold(
        appBar: AppBar(
          title: Text('Register Page'),
        ),
        body: Center(
            child: Column(

                children: <Widget>[
                  GFListTile(
                      titleText:'$Title',
                      subtitleText:'$content\n$reward\n$Remarks\n$userName\n距離:$m 公尺\n',
                      icon: Icon(Icons.favorite)
                  ),
                 /* Text(title.toString()),
                  Text(content.toString()),
                  Text(reward.toString()),
                  Text(Remarks.toString()),
                  Text(userName.toString()),
                  Text("距離" + m.toString() + "公尺"),*/
                  RaisedButton(
                      child: Text('接受任務'),
                      onPressed: getTask
                  )
                ]
            )
        )
    );
  }
}

  class RegisterPage_nomapidex extends StatelessWidget {
    var myuserName;
    var taskuserName;
    var m;
    var Remarks;
    var reward;
    var content;
    var title;
    var longitude;
    var latitude;
    CollectionReference task_to_remove = FirebaseFirestore.instance.collection('task');

    RegisterPage_nomapidex(this.taskuserName, this.Remarks, this.reward,
        this.content, this.title, this.myuserName,this.latitude,this.longitude);

    @override
    Widget build(BuildContext context) {
      //var value=firestore.collection("task").doc(this.userName).get();
      // var latitude =value.data()['title'];
      return Scaffold(
          appBar: AppBar(
            title: Text('Register Page'),
          ),
          body: Center(
              child: Column(

                  children: <Widget>[
                         GFListTile(
                          titleText:'$title',
                          subtitleText:'任務內容說明:$content\n完成後的獎勵:$reward\n備註:$Remarks\n任務的發布者:$userName\n距離:請開啟定位後查看\n',
                           icon: Icon(Icons.favorite)
                        ),
                      /*
                    Text(title.toString()),
                    Text(content.toString()),
                    Text(reward.toString()),
                    Text(Remarks.toString()),
                    Text(userName.toString()),*/

                    RaisedButton(
                        child: Text('接受任務'),
                        onPressed: getTask
                    )
                  ]
              )
          )
      );
    }


    void getTask() async {
      if (userName == null) {
        print('請登入');
      } else {
        Position position = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high);
        lo = position;
        await firestore.collection("nowTask")
            .doc(myuserName)
            .set({
          'm': -1,
          'TaskuserName': taskuserName,
          'Remarks': Remarks,
          'reward': reward,
          'content': content,
          'title': title,
          'longitude':longitude,
          'latitude':latitude,
        });

        firestore.collection("task").doc(taskuserName).delete().then((_) {
          print("success!");
        });
        UserInformation.check();
      }
    }
  }