import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:sports_team_management/data/models/event_model.dart';
import 'package:sports_team_management/redux/app/app_state.dart';
import 'package:sports_team_management/ui/events/events-page.dart';

class EventsScreen extends StatelessWidget{
  static const String route='/events';
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: StoreConnector<AppState,EventsViewModel>(
        converter: EventsViewModel.fromStore,
        builder: (context, viewModel){
          return EventsView(viewModel);
        },
      ),
    );
  }
}

class EventsViewModel{
  List<EventEntity> events;
  EventsViewModel(this.events);

  static EventsViewModel fromStore(Store<AppState> store){
    return EventsViewModel(
      store.state.eventState.list
    );
  }
}