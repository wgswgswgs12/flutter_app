import 'package:flutter/cupertino.dart';
import 'package:flutter_app/conet.dart';
import 'package:flutter_app/loginpage.dart';
import 'package:flutter_app/test_for_ui/getwidget_testpage.dart';
import 'chat_room.dart';
import 'local.dart';
import 'cloud.dart';
import 'nb.dart';
import 'taskView.dart';
import 'package:flutter_app/userIformation/userPersonalpage.dart';
import 'package:flutter_app/test_for_ui/Glassmorphism_UI.dart';
import 'package:flutter_app/test_for_ui/Story_UI.dart';

final pageView1=PageView(
//controller: controller,
children: [
  loginpage(),
  conet(),
  local(),
  cloud(),
  UserInformation(),
  //taskView(),//此頁顯示當前使用的任務
  userPersonalpage(),
  MyHomePage(),
  getwidget_testpage(),
  Glass_UI(),
  Story_UI()
],
);   //此處PageView做為一個陣列可以容納許多頁面支持左右滑動

class pageView extends StatelessWidget{ //此處把pageView包成一頁，讓main可以載入
  Widget build(BuildContext context){
      return pageView1;
  }
}