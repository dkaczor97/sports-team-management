import 'package:sports_team_management/redux/app/counter_actions.dart';

int counterReducer(int currentCount, action){
  if(action is IncrementCountAction){
    currentCount++;
    return currentCount;
  } else if(action is DecrementCountAction){
    currentCount--;
    return currentCount;
  }
  else{
    return currentCount;
  }
}