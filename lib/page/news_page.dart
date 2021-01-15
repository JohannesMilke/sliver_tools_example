import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sliver_tools_example/model/news_section.dart';
import 'package:sliver_tools_example/provider/news_provider.dart';
import 'package:sliver_tools_example/widget/news_section_widget.dart';

class NewsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<NewsProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Sliver Tools'),
      ),
      body: CustomScrollView(
        slivers: buildNews(news: provider.newsSections),
      ),
    );
  }

  List<Widget> buildNews({@required List<NewsSection> news}) => news
      .map((newsSection) =>
          NewsSectionWidget(section: newsSection, news: newsSection.news))
      .toList();
}
