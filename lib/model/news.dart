import 'package:flutter/cupertino.dart';

class News {
  final String title;
  final String imageUrl;
  bool isSaved = false;

  News({
    @required this.title,
    @required this.imageUrl,
  });
}
