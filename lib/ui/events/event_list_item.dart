import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sports_team_management/data/models/event.dart';
import 'package:sports_team_management/ui/events/edit/event_edit.dart';

class EventListItem extends StatelessWidget {
  EventListItem({this.event});
  final Event event;

  @override
  Widget build(BuildContext context) {
    return Card(
        child: ListTile(
      onTap: ()=>_navigateToEventEdit(context),
      leading: Container(
        decoration: BoxDecoration(
            border: Border(
                right: BorderSide(color: Theme.of(context).accentColor))),
        padding: EdgeInsets.only(right: 10),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                DateFormat.EEEE("pl_PL")
                    .format(event.date.toDate())
                    .toUpperCase(),
                style: TextStyle(
                    fontSize: 9,
                    color: Theme.of(context).textTheme.caption.color),
              ),
              Text(
                event.date.toDate().day.toString(),
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                DateFormat("MMM y", "pl_PL")
                    .format(event.date.toDate())
                    .toUpperCase(),
                style: TextStyle(
                    fontSize: 10,
                    color: Theme.of(context).textTheme.caption.color),
              )
            ]),
      ),
      title: Text(
        event.name,
        maxLines: 1,
      ),
      subtitle: Text(
        event.description,
        maxLines: 1,
        softWrap: true,
      ),
    ));
  }

  void _navigateToEventEdit(BuildContext context){
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => EventEdit(
                  isNew: false,
                  event: event,
                )));

  }
}
