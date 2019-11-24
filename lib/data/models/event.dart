import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

part 'event.g.dart';

abstract class Event implements Built<Event, EventBuilder> {
  // fields go here
  @nullable
  String get id;
  @nullable
  String get name;
  @nullable
  Timestamp get date;
  @nullable
  String get description;
  @nullable
  String get location;

  Event._();

  factory Event([updates(EventBuilder b)]) = _$Event;
}