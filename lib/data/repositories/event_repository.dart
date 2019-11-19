import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sports_team_management/data/firestore_path.dart';
import 'package:sports_team_management/data/models/event.dart';
import 'package:sports_team_management/data/models/event_model.dart';

class EventRepository{
  static const NAME = 'name';
  static const DATE = 'date';
  static const DESCRIPTION = 'description';
  static const LOCATION = 'location';

static const String path = 'events';

  Firestore firestore;
  EventRepository(this.firestore);

  Future<List<Event>> loadEvents() async {
    final snapshot = await firestore
      .collection(FirestorePaths.PATH_EVENTS)
      .orderBy(DATE, descending: true)
      .getDocuments();
    return snapshot.documents.map((d)=>_fromDoc(d)).toList();
    // return firestore.collection(path).snapshots().map((snapshot){
    //   return snapshot.documents.map((event){
    //     return EventEntity(
    //       id: event.documentID,
    //       date: event[EventFields.date],
    //       name: event[EventFields.name],
    //       description: event[EventFields.description],
    //       location: event[EventFields.location]
    //     );
    //   }).toList();
    // });
  }

  static Event _fromDoc(DocumentSnapshot doc){
    return Event((event)=>event
      ..name = doc[NAME]
      ..date = doc[DATE]
      ..description = doc[DESCRIPTION]
      ..location = doc[LOCATION]
      ..id = doc.documentID
    );
  }


}