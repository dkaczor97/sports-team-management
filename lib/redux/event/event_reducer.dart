
import 'package:built_collection/built_collection.dart';
import 'package:redux/redux.dart';
import 'package:sports_team_management/redux/app/app_state.dart';
import 'package:sports_team_management/redux/event/event_actions.dart';
import 'package:sports_team_management/redux/event/event_state.dart';

final eventReducers = <AppState Function(AppState, dynamic)>[
    TypedReducer<AppState,LoadEventsResult>(loadEventsResultReducer),
    TypedReducer<AppState,LoadUserAttendanceResult>(loadUserAttendanceResultReducer),
  ];

AppState loadEventsResultReducer(AppState appState, LoadEventsResult action){
  return appState.rebuild((state)=>
   state..eventState.update((e) => e..events = ListBuilder(action.events)));
}

AppState loadUserAttendanceResultReducer(AppState appState, LoadUserAttendanceResult action){
  return appState.rebuild((state)=>
   state..eventState.update((e) => e..userAttendance = action.attendance.toBuilder()));
}

