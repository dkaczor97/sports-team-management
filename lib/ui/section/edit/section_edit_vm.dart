library section_edit_vm;

import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:redux/redux.dart';
import 'package:sports_team_management/data/models/user.dart';
import 'package:sports_team_management/redux/app/app_state.dart';

part 'section_edit_vm.g.dart';

abstract class SectionEditVM implements Built<SectionEditVM, SectionEditVMBuilder> {
  // fields go here
  BuiltList<User> get users;
  SectionEditVM._();

  factory SectionEditVM([updates(SectionEditVMBuilder b)]) = _$SectionEditVM;

  static SectionEditVM fromStore(Store<AppState> store){
    return SectionEditVM((s)=>s
    ..users = store.state.administrationState.users.toBuilder());
  }
}