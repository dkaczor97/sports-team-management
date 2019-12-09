library news_edit_vm;

import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:redux/redux.dart';
import 'package:sports_team_management/data/models/section.dart';
import 'package:sports_team_management/redux/app/app_state.dart';

part 'news_edit_vm.g.dart';

abstract class NewsEditVM implements Built<NewsEditVM, NewsEditVMBuilder> {
  // fields go here

BuiltList<Section> get sections;
  NewsEditVM._();

  factory NewsEditVM([updates(NewsEditVMBuilder b)]) = _$NewsEditVM;

  static NewsEditVM fromStore(Store<AppState> store){
    return NewsEditVM((n)=>n
    ..sections.addAll(store.state.administrationState.sections)
    );
  }
}