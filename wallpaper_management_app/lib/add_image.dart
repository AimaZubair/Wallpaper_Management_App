import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:wallpaper_management_app/components/AppBar.dart';
import 'package:wallpaper_management_app/components/Drawer.dart';

class Wallpaper extends StatefulWidget {
  @override
  _WallpaperState createState() => _WallpaperState();
}

class _WallpaperState extends State<Wallpaper> {
  final formkey = GlobalKey<FormState>();
  TextEditingController tag = TextEditingController();
  File image;
  String imgUrl;

  sendData() async {
    if (formkey.currentState.validate()) {
      var storageImage = FirebaseStorage.instance.ref().child(image.path);
      var task = storageImage.putFile(image);
      imgUrl = await (await task.onComplete).ref.getDownloadURL();
      await Firestore.instance
          .collection('wallpapers')
          .add({'tag': tag.text, 'url': imgUrl.toString()});
    }
  }

  Future getImage() async {
    var img = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      image = img;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: appBar(context),
      drawer: MyDrawer(),
      body: ListView(
        children: <Widget>[
          Form(
            key: formkey,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(25.0),
                  child: InkWell(
                    onTap: () => getImage(),
                    child: CircleAvatar(
                      radius: 100,
                      backgroundImage: image != null
                          ? FileImage(image)
                          : NetworkImage('null'),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(25.0),
                  child: TextFormField(
                    controller: tag,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'It is Empty';
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                      labelText: 'Write the Category',
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(25.0),
                  child: RaisedButton(
                      child: Text(
                        'Upload',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      color: Colors.red,
                      onPressed: () {
                        sendData();
                      }),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
