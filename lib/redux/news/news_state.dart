library news_state;

import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:sports_team_management/data/models/news.dart';

part 'news_state.g.dart';
abstract class NewsState implements Built<NewsState, NewsStateBuilder> {
  // fields go here
  BuiltList<News> get newsList;
  NewsState._();

  factory NewsState([updates(NewsStateBuilder b)]) = _$NewsState;
    factory NewsState.init() => NewsState((e)=> e
  ..newsList = ListBuilder()
  );

}