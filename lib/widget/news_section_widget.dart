import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sliver_tools/sliver_tools.dart';
import 'package:sliver_tools_example/model/news.dart';
import 'package:sliver_tools_example/model/news_section.dart';
import 'package:sliver_tools_example/provider/news_provider.dart';

import 'card_background_widget.dart';
import 'card_header_widget.dart';
import 'load_more_button_widget.dart';
import 'news_tile_widget.dart';

class NewsSectionWidget extends StatelessWidget {
  final NewsSection section;
  final List<News> news;

  const NewsSectionWidget({
    Key key,
    @required this.section,
    @required this.news,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => SliverPadding(
        padding: EdgeInsets.all(CardHeaderWidget.padding).copyWith(top: 0),
        sliver: MultiSliver(
          pushPinnedChildren: true,
          children: [
            SliverStack(
              insetOnOverlap: true,
              children: [
                SliverPositioned.fill(
                  top: CardHeaderWidget.padding,
                  child: CardBackgroundWidget(),
                ),
                buildCard(context),
              ],
            ),
          ],
        ),
      );

  Widget buildCard(BuildContext context) => MultiSliver(
        children: <Widget>[
          SliverPinnedHeader(child: CardHeaderWidget(title: section.title)),
          SliverClip(
            child: MultiSliver(
              children: <Widget>[
                buildNews(),
                SliverToBoxAdapter(child: buildLoadMore(context)),
              ],
            ),
          ),
        ],
      );

  Widget buildNews() => SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index) => NewsTileWidget(news: news[index]),
          childCount: news.length,
        ),
      );

  Widget buildLoadMore(BuildContext context) {
    if (section.isCompletelyFetched) return Container();

    return LoadMoreButtonWidget(
      loading: section.isLoading,
      nextPage: () {
        final provider = Provider.of<NewsProvider>(context, listen: false);

        provider.fetchMoreStories(section.newsType);
      },
    );
  }
}
