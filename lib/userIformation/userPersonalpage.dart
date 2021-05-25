import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/loginpage.dart';
import 'package:getwidget/getwidget.dart';

class userPersonalpage extends StatelessWidget{
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
                        ));
                          /*
                        return Center(

                          child: Text(
                              'Do something with your snapshot.data : \n ${ds['userIntroduction']}'),
                        );

                           */
                      }else{
                        return Center(
                            child: Text( '非常抱歉 您還未新增您的個人訊息 請至新增填寫:'),
                        );
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

class inputTable extends StatelessWidget{







  final TextEditingController userBirthYear= new TextEditingController();
  final TextEditingController userBirthMonth = new TextEditingController();
  final TextEditingController rewardController = new TextEditingController();
  final TextEditingController userIntroduction = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return TextField(
      controller:userBirthYear,
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

    );
  }

}