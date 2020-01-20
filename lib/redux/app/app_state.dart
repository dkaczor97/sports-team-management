import 'package:built_value/built_value.dart';
import 'package:sports_team_management/data/models/user.dart';
import 'package:sports_team_management/redux/administration/administration_state.dart';
import 'package:sports_team_management/redux/event/event_state.dart';
import 'package:sports_team_management/redux/news/news_state.dart';
import 'package:sports_team_management/routes/routes.dart';

part 'app_state.g.dart';

abstract class AppState implements Built<AppState, AppStateBuilder>{

  @nullable 
  User get user;
  EventState get eventState;
  AdministrationState get administrationState;
  NewsState get newsState;

  AppState._();
  factory AppState([void Function(AppStateBuilder) updates]) = _$AppState;

  factory AppState.init()=>AppState((a)=> a
    ..eventState = EventState.init().toBuilder()
    ..administrationState = AdministrationState.init().toBuilder()
    ..newsState = NewsState.init().toBuilder()
  );

  AppState clear(){
    return AppState.init();
  }
}