// import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:sports_team_management/ui/events/edit/event_edit_vm.dart';

// class EventEdit extends StatefulWidget{
//   final EventEditVM viewModel;
//   EventEdit({this.viewModel});

//   @override
// _EventEditState createState() => _EventEditState();
// }

// class _EventEditState extends State<EventEdit>{
//   String _name;
//   String _description;
//   String _location;
//   DateTime _date;

//   @override
//   Widget build(BuildContext context){
//     return new Scaffold(
//       appBar: new AppBar(
//         title: new Text("Wydarzenie"),
//       ),
//       body: Stack(
//         children: <Widget>[showForm()],
//       ),
//     );
//   }

//   Widget showForm(){
//     return new Container(
//       padding: EdgeInsets.all(16.0),
//       child: new Form(
//         child: new ListView(
//           shrinkWrap: true,
//           children: <Widget>[
//             showEventNameInput(),
//             showEventDescriptionInput(),
//             showEventLocationInput(),
//             showEventDateInput()
//           ],
//         ),
//       ),
//     );
//   }

//   Widget showEventNameInput() {
//     return Padding(
//       padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
//       child: new TextFormField(
//         maxLines: 1,
//         keyboardType: TextInputType.text,
//         autofocus: false,
//         decoration: new InputDecoration(
//             labelText: 'Imię i nazwisko', hasFloatingPlaceholder: true),
//         onChanged:(value){
//            _name = value.trim();
//            },
//         initialValue: widget.viewModel.event.name,
//       ),
//     );
//   }

//   Widget showEventDescriptionInput() {
//     return Padding(
//       padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
//       child: new TextFormField(
//         maxLines: 2,
//         keyboardType: TextInputType.text,
//         autofocus: false,
//         decoration: new InputDecoration(
//             labelText: 'Imię i nazwisko', hasFloatingPlaceholder: true),
//         onChanged:(value){
//            _description = value.trim();
//            },
//         initialValue: widget.viewModel.event.description,
//       ),
//     );
//   }

//   Widget showEventLocationInput() {
//     return Padding(
//       padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
//       child: new TextFormField(
//         maxLines: 1,
//         keyboardType: TextInputType.text,
//         autofocus: false,
//         decoration: new InputDecoration(
//             labelText: 'Lokalizacja', hasFloatingPlaceholder: true),
//         onChanged:(value){
//            _location = value.trim();
//            },
//         initialValue: widget.viewModel.event.location,
//       ),
//     );
//   }

//   Widget showEventDateInput() {
//     return Padding(
//       padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
//       child: DateTimeField(
//         decoration: new InputDecoration(
//           labelText: 'Data', hasFloatingPlaceholder: true
//         ),
//         format: DateFormat("yyy-MM-dd HH:mm"),
//         onShowPicker: (context, currentValue) async {
//           final date = await showDatePicker(
//             context: context,
//             firstDate: DateTime(2000),
//             initialDate: DateTime.now(),
//             lastDate: DateTime(2100)
//           );
//           if(date != null){
//             final time = await showTimePicker(
//               context: context,
//               initialTime: TimeOfDay.fromDateTime(DateTime.now())
//             );
//             return DateTimeField.combine(date, time);
//           }
//           else{
//             return DateTime.now();
//           }
//         },
//         onChanged: (value){
//           _date = value;
//         },
//         initialValue: widget.viewModel.event.date.toDate(),
//       ),
//     );
//   }
// }