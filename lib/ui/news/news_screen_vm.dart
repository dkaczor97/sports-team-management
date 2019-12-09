library news_screen_vm;

import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:redux/redux.dart';
import 'package:sports_team_management/data/models/news.dart';
import 'package:sports_team_management/redux/app/app_state.dart';

part 'news_screen_vm.g.dart';

abstract class NewsScreenVM implements Built<NewsScreenVM, NewsScreenVMBuilder> {
  // fields go here

  BuiltList<News> get newsList;
  NewsScreenVM._();

  factory NewsScreenVM([updates(NewsScreenVMBuilder b)]) = _$NewsScreenVM;

  static NewsScreenVM fromStore(Store<AppState> store){
    return NewsScreenVM((n)=>n
    ..newsList.addAll(store.state.newsState.newsList));
  }
}