library attendance;

import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:sports_team_management/enums/attendance/attendance_status.dart';

part 'attendance.g.dart';

abstract class Attendance implements Built<Attendance, AttendanceBuilder> {
  // fields go here
  @nullable
  String get id;

  @nullable 
  String get uid;

  @nullable
  String get name;

  @nullable
  AttendanceStatus get status;

  @nullable
  String get reason;
  Attendance._();

  factory Attendance([updates(AttendanceBuilder b)]) = _$Attendance;
}