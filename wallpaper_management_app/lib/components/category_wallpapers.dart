import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'models/wallpaper.dart';
import 'package:wallpaper_management_app/components/wallpaper_gallery.dart';

class CategoryWallpapers extends StatefulWidget {
  final String category;

  CategoryWallpapers({Key key, @required this.category}) : super(key: key);

  @override
  _CategoryWallpapersState createState() => _CategoryWallpapersState();
}

class _CategoryWallpapersState extends State<CategoryWallpapers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Center(
          child: Text(
            'Wallpaper Management App',
            style: TextStyle(
              fontSize: 15.0,
              fontWeight: FontWeight.bold,
              fontFamily: 'FredokaOne',
            ),
          ),
        ),
      ),
      body: StreamBuilder(
        stream: Firestore.instance.collection('wallpapers').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasData) {
            // Get all wallpapers of widget.category.
            var wallpapers =
                _getWallpapersOfCurrentCategory(snapshot.data.documents);

            return ListView.builder(
              itemCount: wallpapers.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: InkResponse(
                    onTap: () async {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => WallpaperGallery(
                              wallpaperList: wallpapers, initialPage: index),
                        ),
                      );
                    },
                    child: Container(
                      clipBehavior: Clip.hardEdge,
                      height: 200.0,
                      decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: CachedNetworkImageProvider(
                              wallpapers.elementAt(index).url),
                        ),
                      ),
                    ),
                  ),
                );
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

  List<Wallpaper> _getWallpapersOfCurrentCategory(
      List<DocumentSnapshot> documents) {
    var list = List<Wallpaper>();

    documents.forEach((document) {
      var wallpaper = Wallpaper.fromDocumentSnapshot(document);

      if (wallpaper.category == widget.category) {
        list.add(wallpaper);
      }
    });

    return list;
  }
}
