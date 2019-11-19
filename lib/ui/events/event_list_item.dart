import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sports_team_management/data/models/event.dart';
import 'package:sports_team_management/data/models/event_model.dart';

class EventListItem extends StatelessWidget {
  EventListItem({this.event});
  final Event event;
  @override
  Widget build(BuildContext context) {
    return Card(
        child: ListTile(
            leading: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                  DateFormat.EEEE("pl_PL").format(event.date.toDate()).toUpperCase(),
                  style: TextStyle(fontSize: 9),
            ),
                  Text(
                    event.date.toDate().day.toString(),
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                  ),
                  Text(
                      DateFormat("MMM y","pl_PL").format(event.date.toDate()).toUpperCase(),
                      style: TextStyle(fontSize: 10),)
                ]),
            title: Text(event.name),
            subtitle: Text(event.description),
            ));
  }
}
