import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:wallpaper_management_app/components/all_images.dart';
import 'package:wallpaper_management_app/components/delete_file.dart';
import 'package:wallpaper_management_app/components/Drawer.dart';
import 'package:wallpaper_management_app/components/models/wallpaper.dart';

class Admin_view extends StatefulWidget {
  final String title;
  Admin_view({Key key, this.title}) : super(key: key);

  @override
  _Admin_viewState createState() => _Admin_viewState();
}

class _Admin_viewState extends State<Admin_view> {
  final pageController = PageController(initialPage: 0);
  int currentSelected = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Center(
          child: Text(
            widget.title,
            style: TextStyle(
              fontSize: 15.0,
              fontWeight: FontWeight.bold,
              fontFamily: 'FredokaOne',
            ),
          ),
        ),
        actions: [],
      ),
      drawer: MyDrawer(),
      body: StreamBuilder(
        stream: Firestore.instance.collection('wallpapers').snapshots(),
        builder:
            // ignore: missing_return
            (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasData && snapshot.data.documents.isNotEmpty) {
            var wallpapersList = List<Wallpaper>();
            snapshot.data.documents.forEach((documentSnapshot) {
              var wallpaper = Wallpaper.fromDocumentSnapshot(documentSnapshot);
              wallpapersList.add(wallpaper);
            });
            return PageView.builder(
              controller: pageController,
              itemCount: 1,
              itemBuilder: (BuildContext context, int index) {
                return _getPageAtIndex(index, wallpapersList);
              },
              onPageChanged: (int index) {
                setState(() {
                  currentSelected = index;
                });
              },
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}

Widget _getPageAtIndex(int index, List<Wallpaper> wallpaperList) {
  switch (index) {
    case 0:
      return Delete(
        wallpapersList: wallpaperList,
      );
      break;
    default:
      // Should never get hit.
      return CircularProgressIndicator();
      break;
  }
}
