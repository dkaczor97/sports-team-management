import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:intl/intl.dart';
import 'package:redux/redux.dart';
import 'package:sports_team_management/data/models/event.dart';
import 'package:sports_team_management/enums/attendance/attendance_status.dart';
import 'package:sports_team_management/enums/role/roles.dart';
import 'package:sports_team_management/redux/app/app_state.dart';
import 'package:sports_team_management/redux/event/event_actions.dart';
import 'package:sports_team_management/ui/enums/screen_state.dart';
import 'package:sports_team_management/ui/events/attendance/attendance_list.dart';
import 'package:sports_team_management/ui/events/edit/event_edit_vm.dart';

class EventEdit extends StatefulWidget {
  final Event event;
  final bool isNew;
  EventEdit({this.event, this.isNew});

  @override
  _EventEditState createState() => _EventEditState();
}

class _EventEditState extends State<EventEdit> {
  final _nameFieldController = TextEditingController();
  final _descriptionFieldController = TextEditingController();
  final _locationFieldController = TextEditingController();
  final _dateFieldController = TextEditingController();

  ScreenStatus _status;
  @override
  void initState() {
    super.initState();

    if (!widget.isNew) {
      _status = ScreenStatus.VIEW;
      _nameFieldController.text = widget.event.name;
      _descriptionFieldController.text = widget.event.description;
      _locationFieldController.text = widget.event.location;
      _dateFieldController.text = widget.event.date.toDate().toString();
    }
    else{
      _status = ScreenStatus.EDIT;
    }
  }

  @override
  Widget build(BuildContext context) {
    return new StoreConnector(
        onInit: (Store<AppState> store) {
          store.dispatch(LoadUserAttendance(
              eventId: widget.event.id, uid: store.state.user.uid));
        },
        converter: EventEditVM.fromStore,
        builder: (context, vm) {
          return DefaultTabController(
            length: 2,
            child: new Scaffold(
              appBar: new AppBar(
                title: new Text("Wydarzenie"),
                bottom: new TabBar(
                  tabs: <Widget>[
                    new Tab(
                      text: "Szczegóły",
                    ),
                    new Tab(
                      text: "Zapisani",
                    )
                  ],
                ),
              ),
              body: new TabBarView(
                children: <Widget>[
                  showForm(vm),
                  AttendanceList(
                    attendanceList: widget.event.attendance.toList(),
                  )
                ],
              ),
            ),
          );
        });
  }

  Widget showForm(EventEditVM vm) {
    return new Container(
      padding: EdgeInsets.all(16.0),
      child: new Form(
        child: new ListView(
          shrinkWrap: true,
          children: <Widget>[
            showEventNameInput(),
            showEventDescriptionInput(),
            showEventLocationInput(),
            showEventDateInput(),
            showAttendanceStatus(vm),
            _showButton()
          ],
        ),
      ),
    );
  }
  Widget _showButton(){
    final userRole = StoreProvider.of<AppState>(context).state.user.role;
    if(userRole == Roles.admin || userRole == Roles.coach){
     return _status == ScreenStatus.EDIT ? showSaveButton() : showEditButton();

    }
    else{
      return Container();
    }

  }
  Widget showEventNameInput() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
      child: new TextFormField(
        enabled: _status == ScreenStatus.EDIT,
        controller: _nameFieldController,
        maxLines: 1,
        keyboardType: TextInputType.text,
        autofocus: false,
        decoration: new InputDecoration(
            labelText: 'Nazwa', hasFloatingPlaceholder: true),
      ),
    );
  }

  Widget showEventDescriptionInput() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
      child: new TextFormField(
        enabled: _status == ScreenStatus.EDIT,
        controller: _descriptionFieldController,
        maxLines: 2,
        keyboardType: TextInputType.text,
        autofocus: false,
        decoration: new InputDecoration(
            labelText: 'Szczegóły', hasFloatingPlaceholder: true),
      ),
    );
  }

  Widget showEventLocationInput() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
      child: new TextFormField(
        enabled: _status == ScreenStatus.EDIT,
        controller: _locationFieldController,
        maxLines: 1,
        keyboardType: TextInputType.text,
        autofocus: false,
        decoration: new InputDecoration(
            labelText: 'Lokalizacja', hasFloatingPlaceholder: true),
      ),
    );
  }

  Widget showAttendanceStatus(EventEditVM vm) {
    if (vm.attendance == null || _status == ScreenStatus.EDIT) return Container();
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          RaisedButton(
            onPressed: () {
              setState(() {
                final curentUser =
                    StoreProvider.of<AppState>(context).state.user;

                final newAttendance = vm.attendance.rebuild((a) => a
                  ..status = AttendanceStatus.present
                  ..uid = curentUser.uid
                  ..name = curentUser.name);
                StoreProvider.of<AppState>(context).dispatch(SaveAttendance(
                    eventId: widget.event.id, attendance: newAttendance));
              });
            },
            child: Icon(Icons.check),
            color: vm.attendance.status == AttendanceStatus.present
                ? Color(Colors.green.value)
                : Color(Colors.grey.value),
          ),
          RaisedButton(
            onPressed: () {
              final curentUser = StoreProvider.of<AppState>(context).state.user;

              final newAttendance = vm.attendance.rebuild((a) => a
                ..status = AttendanceStatus.none
                ..uid = curentUser.uid
                ..name = curentUser.name);
              StoreProvider.of<AppState>(context).dispatch(SaveAttendance(
                  eventId: widget.event.id, attendance: newAttendance));
            },
            child: Icon(Icons.help),
            color: vm.attendance.status == AttendanceStatus.none
                ? Color(Colors.yellow[800].value)
                : Color(Colors.grey.value),
          ),
          RaisedButton(
            onPressed: () {
              final curentUser = StoreProvider.of<AppState>(context).state.user;

              final newAttendance = vm.attendance.rebuild((a) => a
                ..status = AttendanceStatus.absent
                ..uid = curentUser.uid
                ..name = curentUser.name);
              StoreProvider.of<AppState>(context).dispatch(SaveAttendance(
                  eventId: widget.event.id, attendance: newAttendance));
            },
            child: Icon(Icons.close),
            color: vm.attendance.status == AttendanceStatus.absent
                ? Color(Colors.red.value)
                : Color(Colors.grey.value),
          ),
        ],
      ),
    );
  }

  Widget showEventDateInput() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
      child: DateTimeField(
        enabled: _status == ScreenStatus.EDIT,
        resetIcon: null,
        controller: _dateFieldController,
        readOnly: true,
        decoration: new InputDecoration(
            labelText: 'Data', hasFloatingPlaceholder: true),
        format: DateFormat("yyy-MM-dd HH:mm"),
        onShowPicker: (context, currentValue) async {
          final date = await showDatePicker(
              context: context,
              firstDate: DateTime(2000),
              initialDate: DateTime.now(),
              lastDate: DateTime(2100));
          if (date != null) {
            final time = await showTimePicker(
                context: context,
                initialTime: TimeOfDay.fromDateTime(DateTime.now()));
            return DateTimeField.combine(date, time);
          } else {
            return DateTime.now();
          }
        },
      ),
    );
  }

  Widget showSaveButton() {
    return new Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
      child: SizedBox(
        height: 40.0,
        child: new RaisedButton(
            elevation: 5.0,
            shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(30.0)),
            color: Colors.black26,
            child: new Text(
              "Zapisz",
              style: new TextStyle(fontSize: 20.0, color: Colors.white),
            ),
            onPressed: () {
              if (widget.isNew) {
                Event newEvent = Event((event) => event
                  ..name = _nameFieldController.text.trim()
                  ..date = Timestamp.fromDate(
                      DateTime.parse(_dateFieldController.text))
                  ..description = _descriptionFieldController.text.trim()
                  ..location = _locationFieldController.text.trim());
                StoreProvider.of<AppState>(context)
                    .dispatch(AddEvent(event: newEvent));
              } else {
                Event eventToUpdate = widget.event.rebuild((e) => e
                  ..name = _nameFieldController.text
                  ..description = _descriptionFieldController.text
                  ..location = _locationFieldController.text
                  ..date = Timestamp.fromDate(
                      DateTime.parse(_dateFieldController.text)));
                StoreProvider.of<AppState>(context)
                    .dispatch(EditEvent(event: eventToUpdate));
              }
              Navigator.of(context).pop();
            }),
      ),
    );
  }

    Widget showEditButton() {
    return new Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
      child: SizedBox(
        height: 40.0,
        child: new RaisedButton(
            elevation: 5.0,
            shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(30.0)),
            color: Colors.black26,
            child: new Text(
              "Edytuj",
              style: new TextStyle(fontSize: 20.0, color: Colors.white),
            ),
            onPressed: () {
              setState(() {
                _status = ScreenStatus.EDIT;
              });
            }),
      ),
    );
  }

}
