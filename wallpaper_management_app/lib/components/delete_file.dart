import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:wallpaper_management_app/components/delete_gallery.dart';
import 'package:wallpaper_management_app/components/models/wallpaper.dart';

class Delete extends StatefulWidget {
  final List<Wallpaper> wallpapersList;
  Delete({Key key, this.wallpapersList}) : super(key: key);

  @override
  _DeleteState createState() => _DeleteState();
}

class _DeleteState extends State<Delete> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: widget.wallpapersList.length,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.all(2.0),
          child: GridTile(
            child: InkResponse(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return DeleteGallery(
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
