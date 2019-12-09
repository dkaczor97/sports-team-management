library section;

import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:sports_team_management/data/models/user_section.dart';

part 'section.g.dart';

abstract class Section implements Built<Section, SectionBuilder> {
  // fields go here
  @nullable
  String get id;

  @nullable
  String get name;

  @nullable
  BuiltList<UserSection> get users;
  Section._();

  factory Section([updates(SectionBuilder b)]) = _$Section;

  factory Section.init()=>Section((s)=>s
  ..users= ListBuilder());
}