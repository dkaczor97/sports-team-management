import 'package:firebase_auth/firebase_auth.dart';
import 'package:sports_team_management/redux/auth/auth_state.dart';
import 'package:sports_team_management/routes/routes.dart';

class AppState{
  final bool isLoading;
  //final FirebaseUser currentUser;
  AuthState authState;

  final List<String> route;

  AppState({this.isLoading = false, this.route = const[Routes.home],}){

    authState = AuthState();
  }

  AppState copyWith({bool isLoading, AuthState authState, List<String> route}){
    AppState state = AppState(
      isLoading: isLoading ?? this.isLoading,
      route: route ?? this.route
    );
    state.authState = authState;
    return state;
  }
}