// import 'package:redux/redux.dart';
// import 'package:sports_team_management/redux/navigation/navigation_actions.dart';

// final navigationReducer = combineReducers<List<String>>([
//   TypedReducer<List<String>,NavigateReplaceAction>(_navigateReplace),
// ]);

// List<String> _navigateReplace(
//   List<String> route, NavigateReplaceAction action) => [action.routeName];

//   List<String> _navigatePush(List<String> route, NavigatePushAction action){
//     var result = List<String>.from(route);
//     result.add(action.routeName);
//     return result;
//   }

//   List<String> _navigatePop(List<String> route, NavigatePopAction action){
//     var result = List<String>.from(route);
//     if(result.isNotEmpty){
//       result.removeLast();
//     }
//     return result;
//   }
