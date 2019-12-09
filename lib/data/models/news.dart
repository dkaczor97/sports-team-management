library news;

import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:sports_team_management/data/models/confirmation.dart';
import 'package:sports_team_management/data/models/section.dart';

part 'news.g.dart';
abstract class News implements Built<News, NewsBuilder> {
  // fields go here
  @nullable
  String get id;
  
  @nullable
  String get title;

  @nullable
  String get content;

  @nullable
  BuiltList<Confirmation> get confirmations;

  @nullable
  BuiltList<Section> get sections;
  News._();

  factory News([updates(NewsBuilder b)]) = _$News;

  factory News.init()=>News((s)=>s
  ..confirmations = ListBuilder()
  ..sections = ListBuilder()
  );

}