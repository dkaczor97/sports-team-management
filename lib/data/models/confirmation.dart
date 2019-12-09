library confirmation;

import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'confirmation.g.dart';

abstract class Confirmation implements Built<Confirmation, ConfirmationBuilder> {
  // fields go here

  @nullable
  String get uid;
  
  @nullable
  String get userName;
  Confirmation._();

  factory Confirmation([updates(ConfirmationBuilder b)]) = _$Confirmation;
}