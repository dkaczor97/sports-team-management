import 'package:built_collection/built_collection.dart';
import 'package:redux/redux.dart';
import 'package:sports_team_management/redux/app/app_state.dart';
import 'package:sports_team_management/redux/news/news_actions.dart';

final newsReducers = <AppState Function(AppState, dynamic)>[
    TypedReducer<AppState,LoadNewsListResult>(loadNewsListResultReducer),
  ];

AppState loadNewsListResultReducer(AppState appState, LoadNewsListResult action){
  return appState.rebuild((state)=>
   state..newsState.update((e) => e..newsList = ListBuilder(action.newsList)));
}
