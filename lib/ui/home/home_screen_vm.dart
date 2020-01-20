library home_screen_vm;

import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:redux/redux.dart';
import 'package:sports_team_management/enums/role/roles.dart';
import 'package:sports_team_management/redux/app/app_state.dart';

part 'home_screen_vm.g.dart';

abstract class HomeScreenVM implements Built<HomeScreenVM, HomeScreenVMBuilder> {
  // fields go here
  @nullable
  String get userRole;
  HomeScreenVM._();

  factory HomeScreenVM([updates(HomeScreenVMBuilder b)]) = _$HomeScreenVM;

    static HomeScreenVM fromStore(Store<AppState> store){
    return HomeScreenVM((n)=>n
    ..userRole = store.state.user != null ? store.state.user.role : Roles.player
    );
  }

}