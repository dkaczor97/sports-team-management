import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'user.g.dart';

abstract class User implements Built<User, UserBuilder> {
  // fields go here
  String get uid;
  String get email;
  @nullable
  String get name;
  @nullable
  int get jerseyNumber;

  @nullable
  String get role;

  User._();

  factory User([updates(UserBuilder b)]) = _$User;
}