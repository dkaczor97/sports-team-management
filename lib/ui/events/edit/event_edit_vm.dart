// import 'package:flutter/material.dart';
// import 'package:flutter_redux/flutter_redux.dart';
// import 'package:redux/redux.dart';
// import 'package:sports_team_management/data/models/event_model.dart';
// import 'package:sports_team_management/redux/app/app_state.dart';
// import 'package:sports_team_management/ui/events/edit/event_edit.dart';

// class EventEditScreen extends StatelessWidget{
//   static const String route = '/event/edit';

//   @override
//   Widget build(BuildContext context){
//     return StoreConnector<AppState, EventEditVM>(
//       converter: (Store<AppState> store){
//         return EventEditVM.fromStore(store);
//       },
//       builder: (context,viewModel){
//         return EventEdit(
//           viewModel: viewModel
//         );
//       },
//     );
//   }
// }

// class EventEditVM{
//   EventEditVM({this.event});
//   final EventEntity event;

//   static EventEditVM fromStore(Store<AppState> store){
//     return EventEditVM(
//       event: null
//     );
//   }
// }