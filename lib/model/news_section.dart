import 'package:meta/meta.dart';
import 'package:sliver_tools_example/provider/news_provider.dart';

import 'news.dart';

class NewsSection {
  final String title;
  final List<News> news;
  final NewsType newsType;
  bool isLoading = false;
  bool isCompletelyFetched = false;

  NewsSection({
    @required this.newsType,
    @required this.title,
    @required this.news,
  });
}
