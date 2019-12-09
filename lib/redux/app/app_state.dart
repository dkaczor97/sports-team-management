import 'package:built_value/built_value.dart';
import 'package:sports_team_management/data/models/user.dart';
import 'package:sports_team_management/redux/administration/administration_state.dart';
import 'package:sports_team_management/redux/event/event_state.dart';
import 'package:sports_team_management/redux/news/news_state.dart';
import 'package:sports_team_management/routes/routes.dart';

part 'app_state.g.dart';

abstract class AppState implements Built<AppState, AppStateBuilder>{

  @nullable 
  User get user;
  EventState get eventState;
  AdministrationState get administrationState;
  NewsState get newsState;
  //do poprawy
  // EventState get eventState;
  // UserState get userState;
  // EventUIState get eventUIState;

  AppState._();
  factory AppState([void Function(AppStateBuilder) updates]) = _$AppState;

  factory AppState.init()=>AppState((a)=> a
    ..eventState = EventState.init().toBuilder()
    ..administrationState = AdministrationState.init().toBuilder()
    ..newsState = NewsState.init().toBuilder()
  );

  AppState clear(){
    return AppState.init();
  }
  // final bool isLoading;
  // //final FirebaseUser currentUser;
  // AuthState authState;
  // EventState eventState;
  // UserState userState;
  // EventUIState eventUIState;

  // final List<String> route;

  // AppState({this.isLoading = false, this.route = const[Routes.home],}){

  //   authState = AuthState();
  //   eventState = EventState();
  //   userState = UserState();
  //   eventUIState = EventUIState();
  // }

  // AppState copyWith({
  //     bool isLoading, 
  //     AuthState authState, 
  //     EventState eventState,
  //     EventUIState eventUIState,
  //     UserState userState, 
  //     List<String> route
  //   }){
  //   AppState state = AppState(
  //     isLoading: isLoading ?? this.isLoading,
  //     route: route ?? this.route
  //   );
  //   state.authState = authState;
  //   state.eventState = eventState;
  //   state.userState = userState;
  //   state.eventUIState = eventUIState;
  //   return state;
  // }
}