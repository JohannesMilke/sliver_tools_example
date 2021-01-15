import 'package:flutter/material.dart';
import 'package:sliver_tools_example/model/news.dart';

class NewsTileWidget extends StatelessWidget {
  final News news;

  const NewsTileWidget({
    Key key,
    @required this.news,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 150,
            width: double.infinity,
            child: Image.network(news.imageUrl, fit: BoxFit.cover),
          ),
          ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            title: Text(news.title),
            trailing: IconButton(
              icon: Icon(Icons.bookmark_border),
              onPressed: () {},
            ),
          ),
          Divider(height: 1),
        ],
      );
}
