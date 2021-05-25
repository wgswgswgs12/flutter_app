
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'local.dart';
import 'loginpage.dart';
import 'cloud.dart';

class taskView extends StatefulWidget {


    _taskView createState()=>_taskView();
    //_taskView initState()=>_initState_taskView();

  }

  class _taskView extends State<taskView>{

  Future <String>_taskFuture;
  var a;
  var myuserName;
  var taskuserName;
  var m;
  var Remarks;
  var reward;
  var content;
  var title;
  var return_message="請按重整按鈕獲取任務訊息";



  void initState() {
    super.initState();
    _taskFuture = task_now_list();
    CollectionReference usersw = FirebaseFirestore.instance.collection('nowTask');
    usersw.doc(userName).get().then((value){
      taskuserName=value.data()['TaskuserName'];
      m=value.data()['m'];
      Remarks=value.data()['Remarks'];
      reward=value.data()['reward'];
      content=value.data()['content'];
      title=value.data()['title'];
      print('initstate 已完成');
    });

    setState((){
      _taskFuture = task_now_list();
      print('異步行為 setState完成');
    });

    }


  Future <String> task_now_list() async{

    await Future.delayed(Duration(seconds: 3));
    return await gettask();
  }
  Future <String>  gettask() async {
    CollectionReference usersw = FirebaseFirestore.instance.collection(
        'nowTask');
   usersw.doc(userName).get().then((value) {
      taskuserName = value.data()['TaskuserName'];
      m = value.data()['m'];
      Remarks = value.data()['Remarks'];
      reward = value.data()['reward'];
      content = value.data()['content'];
      title = value.data()['title'];
      print('成功完成gettask函式\r\n'+"任務對象: $taskuserName\r\n標題: $title\r\n距離: \r\n內容: $content\r\n獎勵: $reward\r\n備註: $Remarks");
      return_message="任務對象: $taskuserName\r\n標題: $title\r\n距離: \r\n內容: $content\r\n獎勵: $reward\r\n備註: $Remarks";

      return "任務對象: $taskuserName\r\n標題: $title\r\n距離: \r\n內容: $content\r\n獎勵: $reward\r\n備註: $Remarks";
    })
    ;
    /*
    CollectionReference usersw = FirebaseFirestore.instance.collection(
        'nowTask');
    usersw.doc(userName).get().then((value) {
      taskuserName = value.data()['TaskuserName'];
      m = value.data()['m'];
      Remarks = value.data()['Remarks'];
      reward = value.data()['reward'];
      content = value.data()['content'];
      title = value.data()['title'];
      print(taskuserName +" "+ m.toString());
      return "任務對象: $taskuserName\r\n標題: $title\r\n距離: \r\n內容: $content\r\n獎勵: $reward\r\n備註: $Remarks";
    });*/
  }



  Widget build(BuildContext context) {

  return  Scaffold (
      appBar: AppBar(
        title: Text("目前任務"),
      ),
       body: Center(

               child:Column(
                  children: <Widget>[
                      FutureBuilder(
                            future: FirebaseFirestore.instance.collection('nowTask').doc(userName).get(),
                            builder: (context,   snapshot){

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
                                            return Center(

                                                 child: Text('Do something with your snapshot.data : \n 備註:${ds['Remarks']}\n 發布人: ${ds['TaskuserName']} \n 標題: ${ds['content']}'),
                                                  );
                                                       }else{
                                               return Center(

                                                       child: Text( '非常抱歉 您還未新增您的個人訊息 請至新增填寫:'),
                                                             );
                                }
                              }

                              else if (snapshot.hasError)
                                return Text("ERROR: ${snapshot.error}");
                              else if(snapshot==null)
                                return Text('snapshot is null');
                              else if (!snapshot.hasData)
                                return Text("snapshot has no DATA");
                              else
                                return Text('None');

                                       }),
                    /*
                  FutureBuilder(
                      future: FirebaseFirestore.instance.collection('nowTask').doc(userName).get(),
                       builder: (BuildContext context,  snapshot) {
                                    if (snapshot.data!=null) {
                                      return_message = snapshot.data.doc(userName)['TaskuserName'];
                                      // return_message ="任務對象:"+ snapshot.data['TaskuserName']+"\r\n標題: "+snapshot.data()['title']+"\r\n距離: "+snapshot.data()['m'].toString()+"\r\n內容: "+snapshot.data()['content']+"\r\n獎勵: "+snapshot.data()['reward']+"\r\n備註: "+snapshot.data()['Remarks'];
                                       return Text(return_message);


                                      //return_message="任務對象: $taskuserName\r\n標題: $title\r\n距離: \r\n內容: $content\r\n獎勵: $reward\r\n備註: $Remarks";
                                    }else{
                                      return_message="error not get any message";
                                    return Text(return_message);
                                    }
                       } ),*/

                    Text(""),
                    RaisedButton(
                       child: Text('獲取任務訊息'),
                          onPressed: task_now_list,
                )
              ]
            )

       )
    );
/*

*/
  }
  }




/*
class taskView extends StatelessWidget {
  var a;
  var myuserName;
  var taskuserName;
  var m;
  var Remarks;
  var reward;
  var content;
  var title;

  Widget build(BuildContext context) {

    CollectionReference usersw = FirebaseFirestore.instance.collection('nowTask');
    usersw.doc(userName).get().then((value){
      taskuserName=value.data()['TaskuserName'];
      m=value.data()['m'];
      Remarks=value.data()['Remarks'];
      reward=value.data()['reward'];
      content=value.data()['content'];
      title=value.data()[' title'];
      print(taskuserName+m.toString());
    });
    return  Scaffold (
      body: Center(
          child:
          //Text(''),
         Text("任務對象$taskuserName/r/n標題$title/r/n距離/r/n內容$content/r/n獎勵$reward/r/n備註$Remarks"),
            //onPressed: getTask,
          )
      );
/*

*/
  }
}*/



