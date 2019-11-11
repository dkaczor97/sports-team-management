import 'package:redux/redux.dart';
import 'package:sports_team_management/data/repositories/event_repository.dart';
import 'package:sports_team_management/redux/app/app_state.dart';
import 'package:sports_team_management/redux/event/event_actions.dart';

List<Middleware<AppState>> createStoreEventsMiddleware(
  EventRepository repository
){
  return [
    TypedMiddleware<AppState, LoadEvents>(_loadEvents(repository))
  ];
}

Middleware<AppState> _loadEvents(EventRepository repository){
  return (Store<AppState> store, dynamic dynamicAction, NextDispatcher next){
    final action = dynamicAction as LoadEvents;
    final AppState state = store.state;

    if(state.isLoading){
      next(action);
      return;
    }

    repository.loadEvents().listen((events){
      store.dispatch(LoadEventsResult(events));
    });
  };
}