// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$Event extends Event {
  @override
  final String id;
  @override
  final String name;
  @override
  final Timestamp date;
  @override
  final String description;
  @override
  final String location;

  factory _$Event([void Function(EventBuilder) updates]) =>
      (new EventBuilder()..update(updates)).build();

  _$Event._({this.id, this.name, this.date, this.description, this.location})
      : super._();

  @override
  Event rebuild(void Function(EventBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  EventBuilder toBuilder() => new EventBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Event &&
        id == other.id &&
        name == other.name &&
        date == other.date &&
        description == other.description &&
        location == other.location;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc($jc(0, id.hashCode), name.hashCode), date.hashCode),
            description.hashCode),
        location.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Event')
          ..add('id', id)
          ..add('name', name)
          ..add('date', date)
          ..add('description', description)
          ..add('location', location))
        .toString();
  }
}

class EventBuilder implements Builder<Event, EventBuilder> {
  _$Event _$v;

  String _id;
  String get id => _$this._id;
  set id(String id) => _$this._id = id;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  Timestamp _date;
  Timestamp get date => _$this._date;
  set date(Timestamp date) => _$this._date = date;

  String _description;
  String get description => _$this._description;
  set description(String description) => _$this._description = description;

  String _location;
  String get location => _$this._location;
  set location(String location) => _$this._location = location;

  EventBuilder();

  EventBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _name = _$v.name;
      _date = _$v.date;
      _description = _$v.description;
      _location = _$v.location;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Event other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Event;
  }

  @override
  void update(void Function(EventBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Event build() {
    final _$result = _$v ??
        new _$Event._(
            id: id,
            name: name,
            date: date,
            description: description,
            location: location);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
