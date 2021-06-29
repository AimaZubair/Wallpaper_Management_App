import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_downloader/image_downloader.dart';
import 'package:wallpaper_management_app/components/utilities.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:wallpaper_management_app/components/models/wallpaper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'models/wallpaper.dart';

class DeleteGallery extends StatefulWidget {
  final List<Wallpaper> wallpaperList;
  final int initialPage;

  DeleteGallery(
      {Key key, @required this.wallpaperList, @required this.initialPage})
      : super(key: key);

  @override
  _DeleteGalleryState createState() => _DeleteGalleryState();
}

class _DeleteGalleryState extends State<DeleteGallery> {
  PageController _pageController;
  int _currentIndex;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: widget.initialPage);
    _currentIndex = widget.initialPage;
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(
        builder: (BuildContext context) {
          return Stack(children: [
            PhotoViewGallery.builder(
              pageController: _pageController,
              itemCount: widget.wallpaperList.length,
              builder: (BuildContext context, int index) {
                return PhotoViewGalleryPageOptions(
                  imageProvider: CachedNetworkImageProvider(
                    widget.wallpaperList.elementAt(index).url,
                  ),
                );
              },
              onPageChanged: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: FloatingActionButton(
                onPressed: () async {
                  int index;
                  _currentIndex = index;
                  if (widget.wallpaperList.isNotEmpty) {
                    StorageReference storage = await FirebaseStorage.instance
                        .getReferenceFromUrl(
                            widget.wallpaperList.elementAt(index).id);

                    await storage.delete();
                    print('image delete');
                  }
                  await Firestore.instance
                      .collection('wallpapers')
                      .document(widget.wallpaperList.elementAt(index).id)
                      .delete();
                },
                child: Icon(Icons.delete),
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
              ),
            ),
          ]);
        },
      ),
    );
  }
}
