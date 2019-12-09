// GENERATED CODE - DO NOT MODIFY BY HAND

part of administration_state;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AdministrationState extends AdministrationState {
  @override
  final BuiltList<User> users;
  @override
  final BuiltList<Section> sections;

  factory _$AdministrationState(
          [void Function(AdministrationStateBuilder) updates]) =>
      (new AdministrationStateBuilder()..update(updates)).build();

  _$AdministrationState._({this.users, this.sections}) : super._() {
    if (users == null) {
      throw new BuiltValueNullFieldError('AdministrationState', 'users');
    }
    if (sections == null) {
      throw new BuiltValueNullFieldError('AdministrationState', 'sections');
    }
  }

  @override
  AdministrationState rebuild(
          void Function(AdministrationStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AdministrationStateBuilder toBuilder() =>
      new AdministrationStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AdministrationState &&
        users == other.users &&
        sections == other.sections;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, users.hashCode), sections.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('AdministrationState')
          ..add('users', users)
          ..add('sections', sections))
        .toString();
  }
}

class AdministrationStateBuilder
    implements Builder<AdministrationState, AdministrationStateBuilder> {
  _$AdministrationState _$v;

  ListBuilder<User> _users;
  ListBuilder<User> get users => _$this._users ??= new ListBuilder<User>();
  set users(ListBuilder<User> users) => _$this._users = users;

  ListBuilder<Section> _sections;
  ListBuilder<Section> get sections =>
      _$this._sections ??= new ListBuilder<Section>();
  set sections(ListBuilder<Section> sections) => _$this._sections = sections;

  AdministrationStateBuilder();

  AdministrationStateBuilder get _$this {
    if (_$v != null) {
      _users = _$v.users?.toBuilder();
      _sections = _$v.sections?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AdministrationState other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$AdministrationState;
  }

  @override
  void update(void Function(AdministrationStateBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$AdministrationState build() {
    _$AdministrationState _$result;
    try {
      _$result = _$v ??
          new _$AdministrationState._(
              users: users.build(), sections: sections.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'users';
        users.build();
        _$failedField = 'sections';
        sections.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'AdministrationState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
