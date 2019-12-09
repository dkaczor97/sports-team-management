import 'package:built_collection/built_collection.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sports_team_management/data/firestore_path.dart';
import 'package:sports_team_management/data/models/news.dart';
import 'package:sports_team_management/data/models/section.dart';
import 'package:sports_team_management/data/repositories/section_repository.dart';

class NewsRepository{
  static const TITLE = 'title';
  static const CONTENT = 'content';

  static const UID = 'uid';
  static const USER_NAME = 'userName';

  final Firestore firestore;
  NewsRepository(this.firestore);

  Future<List<News>> loadNewsList() async{
    final snapshot = await firestore.collection(FirestorePaths.PATH_NEWS).getDocuments();
    final newsList = snapshot.documents.map((f)=>_fromDocument(f)).toList();
    final returnNewsList = List<News>();
    for(var news in newsList){
      final sections = await getNewsSections(news.id);
      returnNewsList.add(news.rebuild((n)=>n..sections = ListBuilder<Section>(sections)));
    }
    return returnNewsList;
  }

  Future<void> addSectionToNews(String newsId, Section section) async {
    return firestore.document(FirestorePaths.newsSectionPath(newsId, section.id)).setData(SectionRepository.sectionToMap(section));
  }

  Future<void> deleteSectionFromNews(String newsId, String sectionId) async {
    return firestore.document(FirestorePaths.newsSectionPath(newsId, sectionId)).delete();
  }

  Future<List<Section>> getNewsSections(String newsId) async{
    final newsSection = await firestore
      .document(FirestorePaths.newsPath(newsId))
      .collection(FirestorePaths.PATH_SECTIONS)
      .getDocuments();

      return newsSection.documents.map((d)=> sectionFromDoc(d)).toList();
  }

  Future<News> addNews(News news) async{
    final reference = await firestore.collection(FirestorePaths.PATH_NEWS).add(newsToMap(news));
    return _fromDocument(await reference.get());
  }

  static Map<String, dynamic> newsToMap(News news){
    return{
      TITLE: news.title,
      CONTENT: news.content
    };
  }

  News _fromDocument(DocumentSnapshot doc){
    return News((n)=>n
    ..title = doc[TITLE]
    ..content = doc[CONTENT]
    ..id = doc.documentID);
  }

  static Section sectionFromDoc(DocumentSnapshot document){
    return Section((s)=>s
    ..id = document[SectionRepository.SECTION_ID]
    ..name = document[SectionRepository.SECTION_NAME]);
  }

}