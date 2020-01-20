import 'package:flutter/cupertino.dart';
import 'package:redux/redux.dart';
import 'package:sports_team_management/data/repositories/auth_repository.dart';
import 'package:sports_team_management/redux/app/app_state.dart';
import 'package:sports_team_management/redux/auth/auth_actions.dart';
import 'package:sports_team_management/redux/navigation/navigation_actions.dart';
import 'package:sports_team_management/routes/routes.dart';

List<Middleware<AppState>> createAuthMiddleware(
    AuthRepository authRepository, GlobalKey<NavigatorState> navigatorKey) {
  return [
    TypedMiddleware<AppState, VerifyAuthenticationState>(_verifyAuthState(authRepository, navigatorKey)),
    TypedMiddleware<AppState, UserLogin>(_authLogin(authRepository, navigatorKey)),
    TypedMiddleware<AppState, UserLogout>(_authLogout(authRepository,navigatorKey)),
    TypedMiddleware<AppState, EditUser>(_editUser(authRepository)),
    TypedMiddleware<AppState, LoadUsers>(_loadUsers(authRepository)),
    TypedMiddleware<AppState, UserSignup>(_authSignup(authRepository, navigatorKey))
  ];
}

void Function(
  Store<AppState> store,
  LoadUsers action,
  NextDispatcher next,
) _loadUsers(
  AuthRepository repository,
) {
  return (store, action, next) async {
    next(action);
    
    await repository.loadUsers().then((result){
      store.dispatch(LoadUsersResult(users: result));
    });
  };
}

void Function(
  Store<AppState> store,
  EditUser action,
  NextDispatcher next,
) _editUser(
  AuthRepository repository,
) {
  return (store, action, next) async {
    next(action);
    
    await repository.editUser(action.user).then((result){
      if(action.isCurrentUser){
        store.dispatch(VerifyAuthenticationState());
      }
      else{
        store.dispatch(LoadUsers());
      }
    });
  };
}

void Function(Store<AppState> store, VerifyAuthenticationState action,
        NextDispatcher next)
    _verifyAuthState(
        AuthRepository authRepository, GlobalKey<NavigatorState> navigatorKey) {
  return (store, action, next) {
    next(action);
    authRepository.getAuthenticationStateChange().listen((user) {
      if (user == null) {
        navigatorKey.currentState.pushReplacementNamed(Routes.login);
      } else {
        store.dispatch(OnAuthenticated(user: user));
        navigatorKey.currentState.pushReplacementNamed(Routes.home);
      }
    });
  };
}

void Function(
  Store<AppState> store,
  dynamic action,
  NextDispatcher next,
) _authLogin(
  AuthRepository authRepository,
  GlobalKey<NavigatorState> navigatorKey,
) {
  return (store, action, next) async {
    next(action);
    try {
      final user = await authRepository.login(action.email, action.password);
      store.dispatch(OnAuthenticated(user: user));

      await navigatorKey.currentState.pushReplacementNamed(Routes.home);
      action.completer.complete();
    } catch (e) {
      action.completer.completeError(e);
    }
  };
}

void Function(
  Store<AppState> store,
  UserSignup action,
  NextDispatcher next,
) _authSignup(
  AuthRepository authRepository,
  GlobalKey<NavigatorState> navigatorKey,
) {
  return (store, action, next) async {
    next(action);
    try {
      final user = await authRepository.signUp(action.email, action.password);
      store.dispatch(OnAuthenticated(user: user));

      await navigatorKey.currentState.pushReplacementNamed(Routes.home);
      action.completer.complete();
    } catch (e) {
      action.completer.completeError(e);
    }
  };
}

void Function(
  Store<AppState> store,
  dynamic action,
  NextDispatcher next,
) _authLogout(
  AuthRepository authRepository,
  GlobalKey<NavigatorState> navigatorKey,
) {
  return (store, action, next) async {
    next(action);
    try {
      await authRepository.logout();
      store.dispatch(OnLogoutSuccess());
      await navigatorKey.currentState.pushReplacementNamed(Routes.login);
    } catch (e) {
      store.dispatch(OnLogoutFail(e));
    }
  };
}
