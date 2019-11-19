// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$EventState extends EventState {
  @override
  final BuiltList<Event> events;

  factory _$EventState([void Function(EventStateBuilder) updates]) =>
      (new EventStateBuilder()..update(updates)).build();

  _$EventState._({this.events}) : super._() {
    if (events == null) {
      throw new BuiltValueNullFieldError('EventState', 'events');
    }
  }

  @override
  EventState rebuild(void Function(EventStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  EventStateBuilder toBuilder() => new EventStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is EventState && events == other.events;
  }

  @override
  int get hashCode {
    return $jf($jc(0, events.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('EventState')..add('events', events))
        .toString();
  }
}

class EventStateBuilder implements Builder<EventState, EventStateBuilder> {
  _$EventState _$v;

  ListBuilder<Event> _events;
  ListBuilder<Event> get events => _$this._events ??= new ListBuilder<Event>();
  set events(ListBuilder<Event> events) => _$this._events = events;

  EventStateBuilder();

  EventStateBuilder get _$this {
    if (_$v != null) {
      _events = _$v.events?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(EventState other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$EventState;
  }

  @override
  void update(void Function(EventStateBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$EventState build() {
    _$EventState _$result;
    try {
      _$result = _$v ?? new _$EventState._(events: events.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'events';
        events.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'EventState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
