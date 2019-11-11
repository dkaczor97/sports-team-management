import 'package:sports_team_management/data/models/event_model.dart';

class EventState{
  final List<EventEntity> list;
  EventState({this.list});

  EventState copyWith({List<EventEntity> list}){
    return new EventState(
      list: list ?? this.list
    );
  }
}