import 'package:cloud_firestore/cloud_firestore.dart';

class Wallpaper {
  final String url;
  final String category;

  Wallpaper.fromDocumentSnapshot(DocumentSnapshot snapshot)
      : this.url = snapshot['url'],
        this.category = snapshot['tag'];
}
