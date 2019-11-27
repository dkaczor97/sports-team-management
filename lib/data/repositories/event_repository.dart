import 'package:built_collection/built_collection.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sports_team_management/data/firestore_path.dart';
import 'package:sports_team_management/data/models/attendance.dart';
import 'package:sports_team_management/data/models/event.dart';
import 'package:sports_team_management/enums/attendance/attendance_status.dart';

class EventRepository{
  static const EVENT_NAME = 'name';
  static const EVENT_DATE = 'date';
  static const EVENT_DESCRIPTION = 'description';
  static const EVENT_LOCATION = 'location';

  static const ATTENDANCE_NAME = 'name';
  static const ATTENDANCE_UID = 'uid';
  static const ATTENDANCE_STATUS = 'status';
  static const ATTENDANCE_REASON = 'reason';

static const String path = 'events';

  Firestore firestore;
  EventRepository(this.firestore);

  Future<List<Event>> loadEvents() async {
    final snapshot = await firestore
      .collection(FirestorePaths.PATH_EVENTS)
      .orderBy(EVENT_DATE, descending: true)
      .getDocuments();
    final events = snapshot.documents.map((d)=>_eventFromDoc(d)).toList();
    final eventsToReturn = List<Event>();
    for (var event in events) {
      final attendance = await getEventAttendance(event.id);
      eventsToReturn.add(event.rebuild((e)=>e..attendance = ListBuilder<Attendance>(attendance)));
    }
    return eventsToReturn;
  }

  Future<List<Attendance>> getEventAttendance(String eventId) async{
    final eventAttendance = await firestore
      .document(FirestorePaths.eventPath(eventId))
      .collection(FirestorePaths.PATH_ATTENDANTS)
      .getDocuments();
      
    return eventAttendance.documents.map((d)=>_attendanceFromDoc(d)).toList();
  }

  Future<void> addEvent(Event event) async{
    await firestore.collection(FirestorePaths.PATH_EVENTS).add(toMap(event));
  }

    Future<void> editEvent(Event event) async{
    await firestore.document(FirestorePaths.eventPath(event.id)).updateData(toMap(event));
  }

  Future<void> saveAttendance(String eventId, Attendance attendance) async{
    // final eventAttendance = await firestore
    //   .document(FirestorePaths.eventPath(eventId))
    //   .collection(FirestorePaths.PATH_ATTENDANTS);
    if(attendance.id == null || attendance.id == ""){
      await firestore
      .document(FirestorePaths.eventPath(eventId))
      .collection(FirestorePaths.PATH_ATTENDANTS)
      .add(_attendanceToMap(attendance));
    }
    else{
      await firestore
      .document(FirestorePaths.attendancePath(eventId, attendance.id))
      .updateData(_attendanceToMap(attendance));
    }  
  }

  Future<Attendance> getUserAttendance(String eventId, String uid) async{
    final eventAttendance = await firestore
      .document(FirestorePaths.eventPath(eventId))
      .collection(FirestorePaths.PATH_ATTENDANTS)
      .getDocuments();
      
    final attendanceList = eventAttendance.documents.map((d)=>_attendanceFromDoc(d)).toList();
    if(attendanceList != null && attendanceList.length > 0){
      return attendanceList.firstWhere((test)=> test.uid.contains((uid)));
    }
    else{
      return Attendance((a)=>a
      ..uid = uid
      ..status = AttendanceStatus.none);
    }
  }


  static Event _eventFromDoc(DocumentSnapshot doc){

    return Event((event)=>event
      ..name = doc[EVENT_NAME]
      ..date = doc[EVENT_DATE]
      ..description = doc[EVENT_DESCRIPTION]
      ..location = doc[EVENT_LOCATION]
      ..id = doc.documentID
    );
  }

  static Attendance _attendanceFromDoc(DocumentSnapshot doc){
    return Attendance((a)=>a
      ..id = doc.documentID
      ..name = doc[ATTENDANCE_NAME]
      ..uid = doc[ATTENDANCE_UID]
      ..status = AttendanceStatus.values[doc[ATTENDANCE_STATUS]]
      ..reason = doc[ATTENDANCE_REASON]
    );
  }
  static Map<String, dynamic> toMap(Event event){
    return{
      EVENT_NAME: event.name,
      EVENT_DATE: event.date,
      EVENT_DESCRIPTION: event.description,
      EVENT_LOCATION: event.location
    };
  }

  static Map<String, dynamic> _attendanceToMap(Attendance attendance){
    return{
      ATTENDANCE_NAME: attendance.name,
      ATTENDANCE_UID: attendance.uid,
      ATTENDANCE_REASON: attendance.reason,
      ATTENDANCE_STATUS: attendance.status.index,
    };
  }

}