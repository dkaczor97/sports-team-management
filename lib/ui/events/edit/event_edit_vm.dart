library event_edit_vm;

import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:redux/redux.dart';
import 'package:sports_team_management/data/models/attendance.dart';
import 'package:sports_team_management/redux/app/app_state.dart';

part 'event_edit_vm.g.dart';

abstract class EventEditVM implements Built<EventEditVM, EventEditVMBuilder> {
  // fields go here
  Attendance get attendance;
  BuiltList get sections;
  EventEditVM._();

  factory EventEditVM([updates(EventEditVMBuilder b)]) = _$EventEditVM;

  static EventEditVM fromStore(Store<AppState> store){
    return EventEditVM((e)=>e
    ..attendance = store.state.eventState.userAttendance.toBuilder()
    ..sections = store.state.administrationState.sections
    );

  }
}
