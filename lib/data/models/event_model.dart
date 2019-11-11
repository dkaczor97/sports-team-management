import 'package:cloud_firestore/cloud_firestore.dart';

class EventEntity{
  final String id;
  final String name;
  final Timestamp date;
  final String description;
  final String location;

  EventEntity({this.id, this.name, this.date, this.description, this.location});
}

class EventFields{
  static const String name = 'name';
  static const String date = 'date';
}