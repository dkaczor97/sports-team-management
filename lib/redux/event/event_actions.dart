
import 'package:sports_team_management/data/models/attendance.dart';
import 'package:sports_team_management/data/models/event.dart';
import 'package:sports_team_management/data/models/section.dart';

class LoadEvents{

}

class LoadEventsResult{
  final List<Event> events;
  LoadEventsResult(this.events);
}

class AddEvent{
  final Event event;
  AddEvent({this.event});
}

class EditEvent{
  final Event event;
  EditEvent({this.event});
}

class LoadUserAttendance{
  final String eventId;
  final String uid;
  LoadUserAttendance({this.eventId, this.uid});
}

class LoadUserAttendanceResult{
  final Attendance attendance;
  LoadUserAttendanceResult({this.attendance});
}

class SaveAttendance{
  final String eventId;
  final Attendance attendance;
  SaveAttendance({this.eventId, this.attendance});
}

class RemoveEvent{
  final String eventId;
  RemoveEvent({this.eventId});
}

class AddSectionToEvent{
  final String eventId;
  final Section section;
  AddSectionToEvent({this.eventId, this.section});
}

class DeleteSectionFromEvent{
  final String eventId;
  final String sectionId;
  DeleteSectionFromEvent({this.eventId, this.sectionId});
}
