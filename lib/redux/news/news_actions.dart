import 'package:sports_team_management/data/models/news.dart';
import 'package:sports_team_management/data/models/section.dart';

class LoadNewsList{

}

class LoadNewsListResult{
  final List<News> newsList;
  LoadNewsListResult(this.newsList);
}

class AddNews{
  final News news;
  AddNews({this.news});
}

class AddSectionToNews{
  final String newsId;
  final Section section;
  AddSectionToNews({this.newsId, this.section});
}
class RemoveSectionFromNews{
  final String newsId;
  final String sectionId;
  RemoveSectionFromNews({this.newsId, this.sectionId});

}