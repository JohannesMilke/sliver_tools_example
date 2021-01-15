import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:sliver_tools_example/data/news.dart';
import 'package:sliver_tools_example/model/news.dart';
import 'package:sliver_tools_example/model/news_section.dart';

enum NewsType { top, latest }

class NewsProvider extends ChangeNotifier {
  final _newsSections = [
    NewsSection(title: 'Top News', newsType: NewsType.top, news: []),
    NewsSection(title: 'Latest News', newsType: NewsType.latest, news: []),
  ];

  NewsProvider() {
    fetchInitialStories(NewsType.latest);
    fetchInitialStories(NewsType.top);
  }

  List<NewsSection> get newsSections => _newsSections;

  List<News> get _topStories => _newsSections
      .where((element) => element.newsType == NewsType.top)
      .first
      .news;

  List<News> get _latestStories => _newsSections
      .where((element) => element.newsType == NewsType.latest)
      .first
      .news;

  Future fetchInitialStories(NewsType type) async {
    final news1 =
        _newsSections.where((element) => element.newsType == type).first;
    news1.isLoading = true;
    notifyListeners();

    await Future.delayed(Duration(seconds: 1));
    switch (type) {
      case NewsType.top:
        {
          _topStories.addAll(topStories.sublist(0, 5));
          notifyListeners();
          break;
        }
      case NewsType.latest:
        {
          _latestStories.addAll(newStories.sublist(0, 5));
          notifyListeners();
          break;
        }
      default:
        break;
    }

    final news2 =
        _newsSections.where((element) => element.newsType == type).first;
    news2.isLoading = false;
    notifyListeners();
  }

  Future fetchMoreStories(NewsType type) async {
    final news1 =
        _newsSections.where((element) => element.newsType == type).first;
    news1.isLoading = true;
    notifyListeners();

    await Future.delayed(Duration(milliseconds: 600));
    switch (type) {
      case NewsType.top:
        {
          _topStories.addAll(topStories.sublist(5));
          notifyListeners();
          break;
        }
      case NewsType.latest:
        {
          _latestStories.addAll(newStories.sublist(5));
          notifyListeners();
          break;
        }
      default:
        break;
    }

    final news2 =
        _newsSections.where((element) => element.newsType == type).first;
    news2.isCompletelyFetched = true;
    news2.isLoading = false;
    notifyListeners();
  }
}
