import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sports_team_management/data/models/event_model.dart';

class EventRepository{
static const String path = 'events';

  Firestore firestore;
  EventRepository(this.firestore);

  Stream<List<EventEntity>> loadEvents(){
    return firestore.collection(path).snapshots().map((snapshot){
      return snapshot.documents.map((event){
        return EventEntity(
          id: event.documentID,
          date: event[EventFields.date],
          name: event[EventFields.name]
        );
      }).toList();
    });
  }


}