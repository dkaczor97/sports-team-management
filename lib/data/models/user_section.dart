library user_section;

import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'user_section.g.dart';
abstract class UserSection implements Built<UserSection, UserSectionBuilder> {
  // fields go here
  @nullable 
  String get id;

  @nullable
  String get uid;

  @nullable
  String get userName;

  @nullable
  String get sectionId;

  @nullable 
  String get sectionName;
  
  UserSection._();

  factory UserSection([updates(UserSectionBuilder b)]) = _$UserSection;
}