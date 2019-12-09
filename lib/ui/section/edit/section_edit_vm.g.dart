// GENERATED CODE - DO NOT MODIFY BY HAND

part of section_edit_vm;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$SectionEditVM extends SectionEditVM {
  @override
  final BuiltList<User> users;

  factory _$SectionEditVM([void Function(SectionEditVMBuilder) updates]) =>
      (new SectionEditVMBuilder()..update(updates)).build();

  _$SectionEditVM._({this.users}) : super._() {
    if (users == null) {
      throw new BuiltValueNullFieldError('SectionEditVM', 'users');
    }
  }

  @override
  SectionEditVM rebuild(void Function(SectionEditVMBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SectionEditVMBuilder toBuilder() => new SectionEditVMBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SectionEditVM && users == other.users;
  }

  @override
  int get hashCode {
    return $jf($jc(0, users.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('SectionEditVM')..add('users', users))
        .toString();
  }
}

class SectionEditVMBuilder
    implements Builder<SectionEditVM, SectionEditVMBuilder> {
  _$SectionEditVM _$v;

  ListBuilder<User> _users;
  ListBuilder<User> get users => _$this._users ??= new ListBuilder<User>();
  set users(ListBuilder<User> users) => _$this._users = users;

  SectionEditVMBuilder();

  SectionEditVMBuilder get _$this {
    if (_$v != null) {
      _users = _$v.users?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SectionEditVM other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$SectionEditVM;
  }

  @override
  void update(void Function(SectionEditVMBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$SectionEditVM build() {
    _$SectionEditVM _$result;
    try {
      _$result = _$v ?? new _$SectionEditVM._(users: users.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'users';
        users.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'SectionEditVM', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
