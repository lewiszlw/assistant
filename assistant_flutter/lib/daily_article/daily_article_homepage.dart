import 'package:assistant_flutter/daily_article/daily_article_model.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'daily_article_helper.dart';

final categories = [
  "工程",
  "算法",
  "前端",
  "移动端",
  "TODO",
  "TODO",
  "TODO",
  "TODO",
  "TODO",
  "TODO"
];

class DailyArticleHomepage extends StatefulWidget {
  const DailyArticleHomepage({super.key});

  @override
  State<StatefulWidget> createState() => _DailyArticleHomepageState();
}

class _DailyArticleHomepageState extends State<DailyArticleHomepage>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  int tabIndex = 0;
  List<ArticleInfo> articleInfos = [];
  ArticleHelper _articleHelper = ArticleHelper();

  @override
  void initState() {
    fetchArticles();
    _tabController =
        TabController(initialIndex: 0, length: categories.length, vsync: this);
    _tabController!.addListener(() {
      setState(() {
        tabIndex = _tabController!.index;
      });
    });
    super.initState();
  }

  void fetchArticles() {
    // http请求后端
    _articleHelper.fetchArticleInfos().then((result) {
      setState(() {
        articleInfos.addAll(result);
      });
    });
  }

  List<ArticleInfo> filterArticleInfos(String category) {
    List<ArticleInfo> result = [];
    for (var item in articleInfos) {
      if (item.category == category) {
        result.add(item);
      }
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("每日看点"),
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            for (final category in categories)
              Tab(
                text: category,
              )
          ],
          isScrollable: true,
        ),
      ),
      body: TabBarView(controller: _tabController, children: [
        for (final category in categories)
          TabContentWidget(
            articleInfos: filterArticleInfos(category),
          )
      ]),
    );
  }
}

class TabContentWidget extends StatelessWidget {
  TabContentWidget({super.key, required this.articleInfos});

  List<ArticleInfo?> articleInfos;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        for (var item in articleInfos) ArticleItemWidget(articleInfo: item!)
      ],
    );
  }
}

class ArticleItemWidget extends StatelessWidget {
  ArticleItemWidget({required this.articleInfo});

  ArticleInfo articleInfo;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          articleInfo.title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(fontSize: 20),
        ),
        Text(
          articleInfo.abstract,
          maxLines: 5,
          overflow: TextOverflow.ellipsis,
        ),
        Row(
          children: [
            Padding(padding: EdgeInsets.only(left: 5)),
            TextButton.icon(
                onPressed: (() {
                  launchUrlString(articleInfo.link);
                }),
                icon: Icon(Icons.share),
                label: Text("link"))
          ],
        )
      ]),
    );
  }
}
