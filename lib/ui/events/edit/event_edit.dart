import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:intl/intl.dart';
import 'package:redux/redux.dart';
import 'package:sports_team_management/data/models/event.dart';
import 'package:sports_team_management/data/models/section.dart';
import 'package:sports_team_management/enums/attendance/attendance_status.dart';
import 'package:sports_team_management/enums/role/roles.dart';
import 'package:sports_team_management/redux/app/app_state.dart';
import 'package:sports_team_management/redux/event/event_actions.dart';
import 'package:sports_team_management/redux/news/news_actions.dart';
import 'package:sports_team_management/ui/enums/screen_state.dart';
import 'package:sports_team_management/ui/events/attendance/attendance_list.dart';
import 'package:sports_team_management/ui/events/edit/event_edit_vm.dart';
import 'package:sports_team_management/ui/multiselect/multiselect_dialog.dart';

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
  List<Section> _currentSectionList = new List<Section>();

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
      _currentSectionList = widget.event.sections.toList();
    } else {
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
                children: <Widget>[showForm(vm), showAttendanceList()],
              ),
            ),
          );
        });
  }

  Widget showAttendanceList() {
    if (!widget.isNew) {
      return AttendanceList(
        attendanceList: widget.event.attendance.toList(),
      );
    } else {
      return Container();
    }
  }

  Widget showForm(EventEditVM vm) {
    return new Container(
      padding: EdgeInsets.fromLTRB(6, 10, 6, 10),
      child: new Form(
        child: new ListView(
          shrinkWrap: true,
          children: <Widget>[
            showEventNameInput(),
            showEventDescriptionInput(),
            showEventLocationInput(),
            showEventDateInput(),
            showAttendanceStatus(vm),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  _showButton(vm),
                  _showRemoveButton(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _showButton(EventEditVM vm) {
    final userRole = StoreProvider.of<AppState>(context).state.user.role;
    if (userRole == Roles.admin || userRole == Roles.coach) {
      if (_status == ScreenStatus.EDIT) {
        return Row(
          children: <Widget>[showSectionsButton(vm), showSaveButton()],
        );
      } else {
        showEditButton();
      }
      return _status == ScreenStatus.EDIT ? showSaveButton() : showEditButton();
    } else {
      return Container();
    }
  }

  Widget _showRemoveButton() {
    final userRole = StoreProvider.of<AppState>(context).state.user.role;
    if (userRole == Roles.admin || userRole == Roles.coach) {
      return _status == ScreenStatus.EDIT ? Container() : showRemoveButton();
    } else {
      return Container();
    }
  }

  Widget showEventNameInput() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
      child: new TextFormField(
        enabled: _status == ScreenStatus.EDIT,
        controller: _nameFieldController,
        maxLines: 1,
        keyboardType: TextInputType.text,
        autofocus: false,
        decoration: new InputDecoration(
            labelText: 'Nazwa',
            hasFloatingPlaceholder: true,
            fillColor: Theme.of(context).cardColor,
            filled: true),
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
            labelText: 'Szczegóły',
            hasFloatingPlaceholder: true,
            fillColor: Theme.of(context).cardColor,
            filled: true),
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
            labelText: 'Lokalizacja',
            hasFloatingPlaceholder: true,
            fillColor: Theme.of(context).cardColor,
            filled: true),
      ),
    );
  }

  Widget showAttendanceStatus(EventEditVM vm) {
    if (vm.attendance == null || _status == ScreenStatus.EDIT)
      return Container();
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
                StoreProvider.of<AppState>(context).dispatch(LoadEvents());
                if(widget.event.attendance.any((test)=>test.uid == curentUser.uid)){
                  widget.event.attendance.firstWhere((test)=>test.uid == curentUser.uid).rebuild((a)=>a..status = AttendanceStatus.present); 
                }
                else{
                  widget.event.attendance.toBuilder().add(newAttendance);

                  // widget.event.rebuild((b)=> b
                  // ..attendance.add(newAttendance));
                  //widget.event.attendance.rebuild((a)=>a.add(newAttendance));
                }
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
            labelText: 'Data',
            hasFloatingPlaceholder: true,
            fillColor: Theme.of(context).cardColor,
            filled: true),
        format: DateFormat("yyy-MM-dd HH:mm"),
        onShowPicker: (context, currentValue) async {
          DateTime initialDate =
              widget.isNew ? DateTime.now() : widget.event.date.toDate();
          final date = await showDatePicker(
              context: context,
              firstDate: DateTime(2000),
              initialDate: initialDate,
              lastDate: DateTime(2100));
          if (date != null) {
            TimeOfDay initialTime = TimeOfDay.fromDateTime(
                widget.isNew ? DateTime.now() : widget.event.date.toDate());
            final time = await showTimePicker(
                context: context, initialTime: initialTime);
            return DateTimeField.combine(date, time ?? initialTime);
          } else {
            return initialDate;
          }
        },
      ),
    );
  }

  Widget showSectionsButton(EventEditVM vm) {
    return new FlatButton.icon(
        icon: Icon(Icons.list),
        label: new Text(
          "Sekcje".toUpperCase(),
        ),
        textColor: Theme.of(context).buttonColor,
        onPressed: () async {
          editSections(vm);
        });
  }

  void editSections(EventEditVM vm) async {
    final items = vm.sections.map((section) {
      return MultiselectDialogItem<Section>(
          value: section, label: section.name);
    }).toList();

    final selectedValues = await showDialog<List<Section>>(
        context: context,
        builder: (BuildContext context) {
          return MultiselectDialog<Section>(
            items: items,
            initialSelectedValues: vm.sections
                .where(
                    (test) =>_currentSectionList.any((s) => s.id == test.id))
                .toList(),
          );
        });
    if (selectedValues == null) {
      return;
    }
    setState(() {
      _currentSectionList = selectedValues;
    });
  }

  Widget showSaveButton() {
    return new RaisedButton(
        child: new Text(
          "Zapisz".toUpperCase(),
        ),
        onPressed: () {
          if (widget.isNew) {
            Event newEvent = Event((event) => event
              ..name = _nameFieldController.text.trim()
              ..date =
                  Timestamp.fromDate(DateTime.parse(_dateFieldController.text))
              ..description = _descriptionFieldController.text.trim()
              ..location = _locationFieldController.text.trim()
              ..sections.addAll(_currentSectionList));
            StoreProvider.of<AppState>(context)
                .dispatch(AddEvent(event: newEvent));
          } else {
            final List<Section> newElements = new List<Section>();
            final List<Section> elementsToRemove = new List<Section>();
            for(var us in widget.event.sections){
              if(!_currentSectionList.any((test)=>test.id == us.id)){
                elementsToRemove.add(us);
              }
              else{
                _currentSectionList.removeWhere((test)=>test.id == us.id);
              }
            }
            newElements.addAll(_currentSectionList);
            for(var item in newElements){
              StoreProvider.of<AppState>(context)
                .dispatch(AddSectionToEvent(section: item, eventId: widget.event.id));
            }
            for(var item in elementsToRemove){
              StoreProvider.of<AppState>(context)
                .dispatch(DeleteSectionFromEvent(sectionId: item.id, eventId: widget.event.id));
            }



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
        });
  }

  Widget showEditButton() {
    return FlatButton.icon(
      icon: Icon(Icons.edit),
      textColor: Theme.of(context).buttonColor,
      label: Text("Edytuj".toUpperCase()),
      onPressed: () {
        setState(() {
          _status = ScreenStatus.EDIT;
        });
      },
    );
  }

  Widget showRemoveButton() {
    return new FlatButton.icon(
        icon: Icon(Icons.delete),
        label: new Text("Usuń".toUpperCase()),
        textColor: Theme.of(context).buttonColor,
        onPressed: () {
          StoreProvider.of<AppState>(context)
              .dispatch(RemoveEvent(eventId: widget.event.id));
          Navigator.of(context).pop();
        });
  }
}
