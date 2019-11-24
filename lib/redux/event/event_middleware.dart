import 'package:redux/redux.dart';
import 'package:sports_team_management/data/repositories/event_repository.dart';
import 'package:sports_team_management/redux/app/app_state.dart';
import 'package:sports_team_management/redux/event/event_actions.dart';

List<Middleware<AppState>> createStoreEventsMiddleware(
  EventRepository repository
){
  return [
    TypedMiddleware<AppState, LoadEvents>(_loadEvents(repository)),
    TypedMiddleware<AppState, AddEvent>(_addEvent(repository)),
    TypedMiddleware<AppState, EditEvent>(_editEvent(repository)),
    TypedMiddleware<AppState, LoadUserAttendance>(_loadUserAttendance(repository)),
    TypedMiddleware<AppState, SaveAttendance>(_saveAttendance(repository))
  ];
}

void Function(
  Store<AppState> store,
  LoadEvents action,
  NextDispatcher next,
) _loadEvents(
  EventRepository repository,
) {
  return (store, action, next) async {
    next(action);
    
    final events = await repository.loadEvents();
    store.dispatch(LoadEventsResult(events));
  };
}

void Function(
  Store<AppState> store,
  LoadUserAttendance action,
  NextDispatcher next,
) _loadUserAttendance(
  EventRepository repository,
) {
  return (store, action, next) async {
    next(action);
    
    final attendance = await repository.getUserAttendance(action.eventId, action.uid);
    store.dispatch(LoadUserAttendanceResult(attendance: attendance));
  };
}

void Function(
  Store<AppState> store,
  SaveAttendance action,
  NextDispatcher next,
) _saveAttendance(
  EventRepository repository,
) {
  return (store, action, next) async {
    next(action);
    
    await repository.saveAttendance(action.eventId, action.attendance).then((result){
      store.dispatch(LoadUserAttendance(eventId: action.eventId, uid: action.attendance.uid));
    });
  };
}


void Function(
  Store<AppState> store,
  AddEvent action,
  NextDispatcher next,
) _addEvent(
  EventRepository repository,
) {
  return (store, action, next) async {
    next(action);
    
    await repository.addEvent(action.event).then((result){
      store.dispatch(LoadEvents());
    });
  };
}

void Function(
  Store<AppState> store,
  EditEvent action,
  NextDispatcher next,
) _editEvent(
  EventRepository repository,
) {
  return (store, action, next) async {
    next(action);
    
    await repository.editEvent(action.event).then((result){
      store.dispatch(LoadEvents());
    });
  };
}