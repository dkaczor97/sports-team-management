library administration_state;

import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:sports_team_management/data/models/section.dart';
import 'package:sports_team_management/data/models/user.dart';

part 'administration_state.g.dart';

abstract class AdministrationState implements Built<AdministrationState, AdministrationStateBuilder> {
  // fields go here

  BuiltList<User> get users;
  BuiltList<Section> get sections;
  AdministrationState._();

  factory AdministrationState([updates(AdministrationStateBuilder b)]) = _$AdministrationState;

  factory AdministrationState.init() => AdministrationState((a)=>a
    ..users = ListBuilder()
  );
}