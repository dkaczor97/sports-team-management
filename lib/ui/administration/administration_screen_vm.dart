library administration_screen_vm;

import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:redux/redux.dart';
import 'package:sports_team_management/data/models/section.dart';
import 'package:sports_team_management/data/models/user.dart';
import 'package:sports_team_management/redux/app/app_state.dart';

part 'administration_screen_vm.g.dart';

abstract class AdministrationScreenVM implements Built<AdministrationScreenVM, AdministrationScreenVMBuilder> {
  // fields go here
  BuiltList<User> get users;
  BuiltList<Section> get sections;
  AdministrationScreenVM._();

  factory AdministrationScreenVM([updates(AdministrationScreenVMBuilder b)]) = _$AdministrationScreenVM;

  static AdministrationScreenVM fromStore(Store<AppState> store){
    return AdministrationScreenVM((a)=>a
    ..users.addAll(store.state.administrationState.users)
    ..sections.addAll(store.state.administrationState.sections)
    );
  }
}