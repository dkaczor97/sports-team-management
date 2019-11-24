// import 'package:sports_team_management/data/models/event_model.dart';

// class EventState{
//   final List<EventEntity> list;
//   EventState({this.list});

//   EventState copyWith({List<EventEntity> list}){
//     return new EventState(
//       list: list ?? this.list
//     );
//   }
// }

// class EventUIState{
//   final EventEntity editing;
//   EventUIState({this.editing});

//   EventUIState copyWith({EventEntity entity}){
//     return new EventUIState(editing: entity);
//   }
// }

import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:sports_team_management/data/models/attendance.dart';
import 'package:sports_team_management/data/models/event.dart';

part 'event_state.g.dart';

abstract class EventState implements Built<EventState, EventStateBuilder> {
  // fields go here
  BuiltList<Event> get events;
  @nullable
  Attendance get userAttendance;
  EventState._();

  factory EventState([updates(EventStateBuilder b)]) = _$EventState;

  factory EventState.init() => EventState((e)=> e
  ..events = ListBuilder()
  ..userAttendance = Attendance().toBuilder()
  );
}