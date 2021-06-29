import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:wallpaper_management_app/components/wallpaper_gallery.dart';
import 'package:wallpaper_management_app/components/models/wallpaper.dart';

class Images extends StatefulWidget {
  final List<Wallpaper> wallpapersList;
  Images({Key key, this.wallpapersList}) : super(key: key);

  @override
  _ImagesState createState() => _ImagesState();
}

class _ImagesState extends State<Images> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: widget.wallpapersList.length,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.all(1.0),
          child: GridTile(
            child: InkResponse(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return WallpaperGallery(
                        wallpaperList: widget.wallpapersList,
                        initialPage: index,
                      );
                    },
                  ),
                );
              },
              child: CachedNetworkImage(
                imageUrl: widget.wallpapersList.elementAt(index).url,
                fit: BoxFit.cover,
              ),
            ),
          ),
        );
      },
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
      ),
    );
  }
}
