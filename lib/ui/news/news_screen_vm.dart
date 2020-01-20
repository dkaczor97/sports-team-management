library news_screen_vm;

import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:redux/redux.dart';
import 'package:sports_team_management/data/models/news.dart';
import 'package:sports_team_management/data/models/section.dart';
import 'package:sports_team_management/data/models/user.dart';
import 'package:sports_team_management/redux/app/app_state.dart';

part 'news_screen_vm.g.dart';

abstract class NewsScreenVM implements Built<NewsScreenVM, NewsScreenVMBuilder> {
  // fields go here

  BuiltList<News> get newsList;
  NewsScreenVM._();

  factory NewsScreenVM([updates(NewsScreenVMBuilder b)]) = _$NewsScreenVM;

  static NewsScreenVM fromStore(Store<AppState> store){
    User currentUser=store.state.user;
    List<Section> userSections = store.state.administrationState.sections.where((test)=>test.users.any((us)=>us.uid == currentUser.uid)).toList();
    List<News> sectionNews = store.state.newsState.newsList.where((news)=> userSections.any((us)=> news.sections.any((s)=>s.id == us.id))).toList();

    return NewsScreenVM((n)=>n
    ..newsList.addAll(sectionNews));
  }
}