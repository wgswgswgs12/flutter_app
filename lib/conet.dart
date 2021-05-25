import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_app/loginpage.dart';



class conet extends StatefulWidget {
_conet createState() => _conet();
}

class _conet extends State<conet>{
  File sampleImage ;
  final _picker = ImagePicker();
  Future getImage()async{
    //PickedFile
    var  image = await _picker.getImage(source: ImageSource.gallery);
    print(image.path);
    setState(() {
      if (image != null) {

        sampleImage = File(image.path);

        print(' image selected!!!!!!!!!!!!!!.');
      } else {
        print('No image selected.');
      }
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('上傳個人相片'),
      ),
      body: Center(
        child: sampleImage == null
            ? Text('No image selected.')
            : Column(
          children: <Widget>[
            Image.file(sampleImage,height: 300.0,width: 300.0,),RaisedButton(
              child: Text('upload'),
              onPressed: upload,
            )
          ],
        )


      ),
      floatingActionButton: FloatingActionButton(
        onPressed: getImage,
        tooltip: 'Pick Image',
        child: Icon(Icons.add_a_photo),
      ),
    );
  }


  Future upload() async{

    FirebaseStorage storage = FirebaseStorage.instance;
    Reference ref = storage.ref().child(userName+""+ DateTime.now().toString());
    UploadTask uploadTask = ref.putFile(sampleImage);
    uploadTask.then((res) {
      res.ref.getDownloadURL();
    });
    print('upload!!!');
  }

}

//fucking task





