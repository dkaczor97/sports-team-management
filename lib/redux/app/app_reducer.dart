import 'package:redux/redux.dart';
import 'package:sports_team_management/redux/app/app_state.dart';
import 'package:sports_team_management/redux/auth/auth_reducer.dart';
import 'package:sports_team_management/redux/event/event_reducer.dart';
import 'package:sports_team_management/redux/news/news_reducer.dart';
import 'package:sports_team_management/redux/section/section_reducer.dart';

final appReducer= combineReducers<AppState>([
  ...authReducers,
  ...eventReducers,
  ...sectionReducers,
  ...newsReducers
]);
