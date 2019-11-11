import 'package:redux/redux.dart';
import 'package:sports_team_management/redux/event/event_actions.dart';
import 'package:sports_team_management/redux/event/event_state.dart';

Reducer<EventState> eventReducer = combineReducers(
  [
    TypedReducer<EventState,LoadEvents>(loadEventsReducer),
    TypedReducer<EventState,LoadEventsResult>(loadEventsResultReducer),
  ]
);

EventState loadEventsReducer(EventState eventState, LoadEvents action){
  return eventState.copyWith();
}

EventState loadEventsResultReducer(EventState eventState, LoadEventsResult action){
  return eventState.copyWith(list: action.events);
}

