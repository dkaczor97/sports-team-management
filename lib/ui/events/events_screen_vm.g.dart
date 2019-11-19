// GENERATED CODE - DO NOT MODIFY BY HAND

part of events_screen_vm;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$EventsScreenViewModel extends EventsScreenViewModel {
  @override
  final BuiltList<Event> events;

  factory _$EventsScreenViewModel(
          [void Function(EventsScreenViewModelBuilder) updates]) =>
      (new EventsScreenViewModelBuilder()..update(updates)).build();

  _$EventsScreenViewModel._({this.events}) : super._() {
    if (events == null) {
      throw new BuiltValueNullFieldError('EventsScreenViewModel', 'events');
    }
  }

  @override
  EventsScreenViewModel rebuild(
          void Function(EventsScreenViewModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  EventsScreenViewModelBuilder toBuilder() =>
      new EventsScreenViewModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is EventsScreenViewModel && events == other.events;
  }

  @override
  int get hashCode {
    return $jf($jc(0, events.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('EventsScreenViewModel')
          ..add('events', events))
        .toString();
  }
}

class EventsScreenViewModelBuilder
    implements Builder<EventsScreenViewModel, EventsScreenViewModelBuilder> {
  _$EventsScreenViewModel _$v;

  ListBuilder<Event> _events;
  ListBuilder<Event> get events => _$this._events ??= new ListBuilder<Event>();
  set events(ListBuilder<Event> events) => _$this._events = events;

  EventsScreenViewModelBuilder();

  EventsScreenViewModelBuilder get _$this {
    if (_$v != null) {
      _events = _$v.events?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(EventsScreenViewModel other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$EventsScreenViewModel;
  }

  @override
  void update(void Function(EventsScreenViewModelBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$EventsScreenViewModel build() {
    _$EventsScreenViewModel _$result;
    try {
      _$result = _$v ?? new _$EventsScreenViewModel._(events: events.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'events';
        events.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'EventsScreenViewModel', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
