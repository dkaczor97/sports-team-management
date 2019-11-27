// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AppState extends AppState {
  @override
  final User user;
  @override
  final EventState eventState;
  @override
  final AdministrationState administrationState;

  factory _$AppState([void Function(AppStateBuilder) updates]) =>
      (new AppStateBuilder()..update(updates)).build();

  _$AppState._({this.user, this.eventState, this.administrationState})
      : super._() {
    if (eventState == null) {
      throw new BuiltValueNullFieldError('AppState', 'eventState');
    }
    if (administrationState == null) {
      throw new BuiltValueNullFieldError('AppState', 'administrationState');
    }
  }

  @override
  AppState rebuild(void Function(AppStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AppStateBuilder toBuilder() => new AppStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AppState &&
        user == other.user &&
        eventState == other.eventState &&
        administrationState == other.administrationState;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc(0, user.hashCode), eventState.hashCode),
        administrationState.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('AppState')
          ..add('user', user)
          ..add('eventState', eventState)
          ..add('administrationState', administrationState))
        .toString();
  }
}

class AppStateBuilder implements Builder<AppState, AppStateBuilder> {
  _$AppState _$v;

  UserBuilder _user;
  UserBuilder get user => _$this._user ??= new UserBuilder();
  set user(UserBuilder user) => _$this._user = user;

  EventStateBuilder _eventState;
  EventStateBuilder get eventState =>
      _$this._eventState ??= new EventStateBuilder();
  set eventState(EventStateBuilder eventState) =>
      _$this._eventState = eventState;

  AdministrationStateBuilder _administrationState;
  AdministrationStateBuilder get administrationState =>
      _$this._administrationState ??= new AdministrationStateBuilder();
  set administrationState(AdministrationStateBuilder administrationState) =>
      _$this._administrationState = administrationState;

  AppStateBuilder();

  AppStateBuilder get _$this {
    if (_$v != null) {
      _user = _$v.user?.toBuilder();
      _eventState = _$v.eventState?.toBuilder();
      _administrationState = _$v.administrationState?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AppState other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$AppState;
  }

  @override
  void update(void Function(AppStateBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$AppState build() {
    _$AppState _$result;
    try {
      _$result = _$v ??
          new _$AppState._(
              user: _user?.build(),
              eventState: eventState.build(),
              administrationState: administrationState.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'user';
        _user?.build();
        _$failedField = 'eventState';
        eventState.build();
        _$failedField = 'administrationState';
        administrationState.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'AppState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
