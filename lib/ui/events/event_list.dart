import 'package:flutter/material.dart';
import 'package:sports_team_management/data/models/event.dart';
import 'package:sports_team_management/ui/events/event_list_item.dart';

class EventList extends StatelessWidget{
  EventList({this.events}){
    events.sort((a,b)=> a.date.compareTo(b.date));
  }
  final List<Event> events;
  @override
  Widget build(BuildContext context){
    return ListView.builder(itemBuilder: (context, index){
      return EventListItem(event: events[index],);
    },
    itemCount: events.length,
    );
  }
}