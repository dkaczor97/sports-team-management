import 'package:flutter/material.dart';
import 'package:sports_team_management/data/models/news.dart';
import 'package:sports_team_management/ui/news/news_list_item.dart';

class NewsList extends StatelessWidget {
  final List<News> newsList;

  const NewsList({Key key, this.newsList}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context,index){
        return NewsListItem(newsList[index]);
      },
      itemCount: newsList.length,
    );
  }
}