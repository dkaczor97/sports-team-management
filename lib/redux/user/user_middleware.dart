import 'package:redux/redux.dart';
import 'package:sports_team_management/data/repositories/user_repository.dart';
import 'package:sports_team_management/redux/app/app_state.dart';
import 'package:sports_team_management/redux/user/user_actions.dart';

List<Middleware<AppState>> createStoreUserMiddleware(
  UserRepository repository 
){
  return[
    TypedMiddleware<AppState, LoadUserData>(_loadUserData(repository)),
    TypedMiddleware<AppState, UpdateUserData>(_updateUserData(repository))
  ];
}

Middleware<AppState> _loadUserData(UserRepository repository){
  return (Store<AppState> store, dynamic dynamicAction, NextDispatcher next){
    final action = dynamicAction as LoadUserData;
    repository.loadUserData(action.uid).then((user){
      store.dispatch(LoadUserDataResult(user: user));
    });
  };
}

Middleware<AppState> _updateUserData(UserRepository repository){
  return (Store<AppState> store, dynamic dynamicAction, NextDispatcher next){
    final action = dynamicAction as UpdateUserData;
    repository.updateUserData(action.user);
  };
}