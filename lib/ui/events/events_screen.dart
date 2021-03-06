import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:sports_team_management/redux/app/app_state.dart';
import 'package:sports_team_management/redux/event/event_actions.dart';
import 'package:sports_team_management/ui/events/event_list.dart';
import 'package:sports_team_management/ui/events/events_screen_vm.dart';

class EventsScreen extends StatelessWidget{
    static const String route='/events';

  @override
  Widget build(BuildContext context){
    return StoreConnector<AppState, EventsScreenViewModel>(
      onInit: (store){
        //store.dispatch(LoadEvents());
      },
      converter: EventsScreenViewModel.fromStore,
      builder: (context, vm){
        return DefaultTabController(
          length: 2,
          child: new Scaffold(
            appBar: new AppBar(
              actions: <Widget>[],
              title: new TabBar(
                tabs: <Widget>[
                  new Tab(text: "Przyszłe",),
                  new Tab(text: "Przeszłe",),
                ],
              ),
            ),
            body: new TabBarView(
              children: <Widget>[
                EventList(events: vm.events.where((i)=>i.date.toDate().isAfter(DateTime.now())).toList()),
                EventList(events: vm.events.where((i)=> !i.date.toDate().isAfter(DateTime.now())).toList()),
              ],
            ),
          ),
        );
      },
    );
  }
}