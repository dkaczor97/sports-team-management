// GENERATED CODE - DO NOT MODIFY BY HAND

part of administration_screen_vm;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AdministrationScreenVM extends AdministrationScreenVM {
  @override
  final BuiltList<User> users;
  @override
  final BuiltList<Section> sections;

  factory _$AdministrationScreenVM(
          [void Function(AdministrationScreenVMBuilder) updates]) =>
      (new AdministrationScreenVMBuilder()..update(updates)).build();

  _$AdministrationScreenVM._({this.users, this.sections}) : super._() {
    if (users == null) {
      throw new BuiltValueNullFieldError('AdministrationScreenVM', 'users');
    }
    if (sections == null) {
      throw new BuiltValueNullFieldError('AdministrationScreenVM', 'sections');
    }
  }

  @override
  AdministrationScreenVM rebuild(
          void Function(AdministrationScreenVMBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AdministrationScreenVMBuilder toBuilder() =>
      new AdministrationScreenVMBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AdministrationScreenVM &&
        users == other.users &&
        sections == other.sections;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, users.hashCode), sections.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('AdministrationScreenVM')
          ..add('users', users)
          ..add('sections', sections))
        .toString();
  }
}

class AdministrationScreenVMBuilder
    implements Builder<AdministrationScreenVM, AdministrationScreenVMBuilder> {
  _$AdministrationScreenVM _$v;

  ListBuilder<User> _users;
  ListBuilder<User> get users => _$this._users ??= new ListBuilder<User>();
  set users(ListBuilder<User> users) => _$this._users = users;

  ListBuilder<Section> _sections;
  ListBuilder<Section> get sections =>
      _$this._sections ??= new ListBuilder<Section>();
  set sections(ListBuilder<Section> sections) => _$this._sections = sections;

  AdministrationScreenVMBuilder();

  AdministrationScreenVMBuilder get _$this {
    if (_$v != null) {
      _users = _$v.users?.toBuilder();
      _sections = _$v.sections?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AdministrationScreenVM other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$AdministrationScreenVM;
  }

  @override
  void update(void Function(AdministrationScreenVMBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$AdministrationScreenVM build() {
    _$AdministrationScreenVM _$result;
    try {
      _$result = _$v ??
          new _$AdministrationScreenVM._(
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
            'AdministrationScreenVM', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
