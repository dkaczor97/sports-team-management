library events_screen_vm;

import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:redux/redux.dart';
import 'package:sports_team_management/data/models/event.dart';
import 'package:sports_team_management/redux/app/app_state.dart';

part 'events_screen_vm.g.dart';

abstract class EventsScreenViewModel implements Built<EventsScreenViewModel, EventsScreenViewModelBuilder> {
  // fields go here
  BuiltList<Event> get events;

  EventsScreenViewModel._();

  factory EventsScreenViewModel([updates(EventsScreenViewModelBuilder b)]) = _$EventsScreenViewModel;

  static EventsScreenViewModel fromStore(Store<AppState> store){
    return EventsScreenViewModel((e)=>e
    ..events.addAll(store.state.eventState.events));
  }
}