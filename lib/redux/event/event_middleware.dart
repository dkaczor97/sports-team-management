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
