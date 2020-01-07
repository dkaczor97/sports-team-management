import 'package:flutter/material.dart';
import 'package:sports_team_management/data/models/news.dart';
import 'package:sports_team_management/ui/news/edit/news_edit.dart';

class NewsListItem extends StatelessWidget {
  final News news;
  NewsListItem(this.news);
  @override
  Widget build(BuildContext context) {
    return Card(
      //margin: EdgeInsets.all(10.0),

      child: ListTile(
        contentPadding: EdgeInsets.all(16.0),
        onTap: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>NewsEdit( news,  false)));
        },
        title: Text(news.title),


        subtitle: 
        Container(
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(
              color: Theme.of(context).accentColor
              )
            )
          ),
          padding: EdgeInsets.only(top: 5),
          margin: EdgeInsets.only(top: 5),
          child: Text(news.content),
        )
        
      ),
      
    );
  }
}