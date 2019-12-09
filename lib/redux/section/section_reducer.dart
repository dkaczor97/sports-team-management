import 'package:built_collection/built_collection.dart';
import 'package:redux/redux.dart';
import 'package:sports_team_management/redux/app/app_state.dart';
import 'package:sports_team_management/redux/section/section_actions.dart';

final sectionReducers = <AppState Function(AppState, dynamic)>[
  TypedReducer<AppState,LoadSectionsResult>(_loadSectionsResultReducer)
];

AppState _loadSectionsResultReducer(AppState appState, LoadSectionsResult action){
  return appState.rebuild((state)=> state
  ..administrationState.update((s)=>s..sections = ListBuilder(action.sections)));
}