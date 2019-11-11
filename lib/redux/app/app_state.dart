import 'package:sports_team_management/redux/auth/auth_state.dart';
import 'package:sports_team_management/redux/event/event_state.dart';
import 'package:sports_team_management/redux/user/user_state.dart';
import 'package:sports_team_management/routes/routes.dart';

class AppState{
  final bool isLoading;
  //final FirebaseUser currentUser;
  AuthState authState;
  EventState eventState;
  UserState userState;

  final List<String> route;

  AppState({this.isLoading = false, this.route = const[Routes.home],}){

    authState = AuthState();
    eventState = EventState();
    userState = UserState();
  }

  AppState copyWith({
      bool isLoading, 
      AuthState authState, 
      EventState eventState,
      UserState userState, 
      List<String> route
    }){
    AppState state = AppState(
      isLoading: isLoading ?? this.isLoading,
      route: route ?? this.route
    );
    state.authState = authState;
    state.eventState = eventState;
    state.userState = userState;
    return state;
  }
}