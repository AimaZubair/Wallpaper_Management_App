import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'models/wallpaper.dart';
import 'package:wallpaper_management_app/components/category_wallpapers.dart';

class Categories extends StatefulWidget {
  final List<Wallpaper> wallpapersList;
  Categories({Key key, this.wallpapersList}) : super(key: key);

  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  final categories = List<String>();
  final categoryImages = List<String>();

  @override
  void initState() {
    super.initState();

    widget.wallpapersList.forEach(
      (wallpaper) {
        var category = wallpaper.category;

        if (!categories.contains(category)) {
          categories.add(category);
          categoryImages.add(wallpaper.url);
        }
      },
    );
  }

  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemCount: categories.length,
      itemBuilder: (BuildContext context, int index) {
        return InkResponse(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return CategoryWallpapers(
                    category: categories.elementAt(index),
                  );
                },
              ),
            );
          },
          child: Container(
            margin: EdgeInsets.all(5.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50.0),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: CachedNetworkImageProvider(
                  categoryImages.elementAt(index),
                ),
              ),
            ),
            alignment: Alignment.center,
            child: Text(
              categories.elementAt(index).toUpperCase(),
              style: TextStyle(
                fontSize: 30.0,
                color: Colors.white,
                decoration: TextDecoration.combine(
                  [
                    TextDecoration.underline,
                    TextDecoration.overline,
                  ],
                ),
                decorationStyle: TextDecorationStyle.double,
              ),
            ),
          ),
        );
      },
    );
  }
}
