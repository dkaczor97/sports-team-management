library events_screen_vm;

import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:redux/redux.dart';
import 'package:sports_team_management/data/models/event.dart';
import 'package:sports_team_management/data/models/section.dart';
import 'package:sports_team_management/data/models/user.dart';
import 'package:sports_team_management/redux/app/app_state.dart';

part 'events_screen_vm.g.dart';

abstract class EventsScreenViewModel implements Built<EventsScreenViewModel, EventsScreenViewModelBuilder> {
  // fields go here
  BuiltList<Event> get events;

  EventsScreenViewModel._();

  factory EventsScreenViewModel([updates(EventsScreenViewModelBuilder b)]) = _$EventsScreenViewModel;

  static EventsScreenViewModel fromStore(Store<AppState> store){
    User currentUser=store.state.user;
    List<Section> userSections = store.state.administrationState.sections.where((test)=>test.users.any((us)=>us.uid == currentUser.uid)).toList();
    List<Event> sectionEvents = store.state.eventState.events.where((event)=> userSections.any((us)=> event.sections.any((s)=>s.id == us.id))).toList();
    return EventsScreenViewModel((e)=>e
    ..events.addAll(sectionEvents));
  }
}