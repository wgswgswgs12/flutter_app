import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/loginpage.dart';
import 'package:getwidget/getwidget.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_app/taskView.dart';


class userPersonalpage extends StatelessWidget{
  var taskuserName;
  var Remarks;
  var reward;
  var content;
  var title;
  var longitude;
  var latitude;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  void delete() async{
    print("完成0");
    // var firebaseUser =  firestore.instance.currentUser;
    await firestore.collection("nowTask").doc(userName).get().then((value) {
      taskuserName = value.data()['TaskuserName'];
      Remarks = value.data()['Remarks'];
      reward = value.data()['reward'];
      content = value.data()['content'];
      title = value.data()['title'];
      longitude= value.data()['longitude'];
     latitude= value.data()['latitude'];
    });
print("完成1");
    await firestore.collection("task").doc(taskuserName).set({
      'latitude': latitude,
      'longitude':longitude,
      'userName': taskuserName,
      'Remarks':Remarks,
      'reward':reward,
      'content':content,
      'title':title,
    });
    print("完成2");
    firestore.collection("nowTask").doc(userName).delete().then((_) {
      print("已放棄當前任務並將任務放回任務列表");
    });
  }
  String userNickname="";

  int userBirthYear=0;

  int userBirthMonth=0;

  int userBirthDay=0;

  String userIntroduction='';


  /*
    final snapShot =  FirebaseFirestore.instance.collection('userIformation').doc(userName).get();
    if (snapShot.exists){
      // Document already exists
      return snapShot.toString();
    }
    else{

      return "has NO Data Error";
      // Document doesn't exist
    }
*/


  @override
  Widget build(BuildContext context) {

    CollectionReference usersw = FirebaseFirestore.instance.collection(
        'userIformation');

    usersw.doc(userName).get().then((value) {
      userNickname = value.data()['userNickname'];
      userBirthYear = value.data()['userBirthYear'];
      userBirthMonth = value.data()['userBirthMonth'];
      userBirthDay = value.data()['userBirthDay'];
      userIntroduction = value.data()['userIntroduction'];
    });




    // TODO: implement build
    return Scaffold(appBar: AppBar(
        title: Text("個人頁面"),
         ),
          body: Container(
            alignment: Alignment.center,
              child: Column(
                children: <Widget>[
                //Text("使用者暱稱 :"+userNickname),Text("生日 :$userBirthYear/$userBirthMonth/$userBirthDay"),Text("使用者自我介紹 :"+userIntroduction),
                FutureBuilder(
                  future: FirebaseFirestore.instance.collection('userIformation').doc(userName).get(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting || snapshot.connectionState == ConnectionState.none) {
                      return Center(child: CircularProgressIndicator());
                    }
                    if (snapshot.hasError) {
                      return Center(
                        child: Text('Future error'),
                      );
                    }
                    if (snapshot.hasData) {
                      DocumentSnapshot ds=snapshot.data;
                      if(ds.exists) {

                        return  Expanded(
                            child:ListView(

                              children: <Widget>[
                              GFCard(
                              boxFit: BoxFit.cover,
                              titlePosition: GFPosition.start,
                              image: Image.asset('assets/images/1970-01-01 08.00.00 ___yu51316_profilepic.jpg'),
                              title: GFListTile(
                                avatar: GFAvatar(
                                  backgroundImage: AssetImage('assets/images/1970-01-01 08.00.00 ___yu51316_profilepic.jpg'),
                                ),
                                titleText: userName,
                                subtitleText: '出生年份:${ds['userBirthYear']}\r\n暱稱:${ds['userNickname']} ',
                              ),
                              content: Text("${ds['userIntroduction']}"),
                              buttonBar: GFButtonBar(
                                children: <Widget>[
                                  GFIconButton( icon:Icon(Icons.delete, color: Colors.white,),
                                      onPressed:()=>delete()
                                    //backgroundColor: GFColors.PRIMARY,

                                  ),
                                  GFIconButton( icon: Icon(Icons.search,color: Colors.white,) ,
                                      onPressed:()=> Navigator.push(context,
                                      MaterialPageRoute(builder: (context) => taskView()))),

                                  GFAvatar(
                                    backgroundColor: GFColors.SUCCESS,
                                    child: Icon(Icons.phone, color: Colors.white,),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ));
                          /*
                        return Center(

                          child: Text(
                              'Do something with your snapshot.data : \n ${ds['userIntroduction']}'),
                        );

                           */
                      }else{
                        return inputTable();

                          /*Center(
                            child: Text( '非常抱歉 您還未新增您的個人訊息 請至新增填寫:'),

                        );*/
                      }
                    }else{
                      return Center(

                        child: Text(
                            '為了達成null的部分'),
                      );
                    }
                  },
                ),
              ])

          )

    );
  }
}
class inputTable extends StatelessWidget {
  DateTime update;

  final maxLines = 5;
  final TextEditingController userNickname = new TextEditingController();
  final TextEditingController userIntroduction = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
        children: <Widget>[
          TextField(
            controller: userNickname,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                /*边角*/
                borderRadius: BorderRadius.all(
                  Radius.circular(30), //边角为30
                ),
                borderSide: BorderSide(
                  color: Colors.amber, //边线颜色为黄色
                  width: 0.5, //边线宽度为0.5
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.green, //边框颜色为绿色
                  width: 2, //宽度为5
                ),
              ),
              border: OutlineInputBorder(),
              labelText: '輸入暱稱',
              helperText: '您可以在之後變更暱稱',
              //counterText: '0 characters'
            ),

          ),
          TextField(
            controller: userIntroduction,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                /*边角*/
                borderRadius: BorderRadius.all(
                  Radius.circular(30), //边角为30
                ),
                borderSide: BorderSide(
                  color: Colors.amber, //边线颜色为黄色
                  width: 0.5, //边线宽度为0.5
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.green, //边框颜色为绿色
                  width: 2, //宽度为2
                ),
              ),
              border: OutlineInputBorder(),
              labelText: '輸入自我介紹',
              helperText: '清楚地介紹可以更快的認識您!',
              //counterText: '0 characters'
            ),

          ),

          TextButton(
              onPressed: () {
                DatePicker.showDatePicker(context,
                    showTitleActions: true,
                    minTime: DateTime(1950, 1, 1),
                    maxTime: DateTime(2020, 12, 31),
                    onChanged: (date) {
                      print('change $date');
                    },
                    onConfirm: (date) {
                      print('confirm $date');
                      update = date;
                    },
                    currentTime: DateTime.now(),
                    locale: LocaleType.zh);
              },
              child: Text(
                '選擇您的生日 ',
                style: TextStyle(color: Colors.blue),
              )),
          GFButton(
              shape:GFButtonShape.pills,

              onPressed: creat,
              text:"送出資料"
          ),
          GFToast(
            text: '您還沒有建立個人資料，請先填入您的基本資料!',
            animationDuration: Duration(hours: 0, minutes: 0, seconds: 3),
            autoDismiss: true,
          ),

        ]
    );
  }


  void creat() async {
    if (update == null) {
      print('請輸入時間');
    } else {
      FirebaseFirestore firestore = FirebaseFirestore.instance;

      await firestore.collection("userIformation")
          .doc(userName)
          .set({

        'userBirthYear': update.year,
        'userBirthMonth': update.month,
        'userBirthDay': update.day,
        'userIntroduction': userIntroduction.text,
        'userNickname': userNickname.text,

      });
    }
  }
}