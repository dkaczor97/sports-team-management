// GENERATED CODE - DO NOT MODIFY BY HAND

part of section;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$Section extends Section {
  @override
  final String id;
  @override
  final String name;
  @override
  final BuiltList<UserSection> users;

  factory _$Section([void Function(SectionBuilder) updates]) =>
      (new SectionBuilder()..update(updates)).build();

  _$Section._({this.id, this.name, this.users}) : super._();

  @override
  Section rebuild(void Function(SectionBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SectionBuilder toBuilder() => new SectionBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Section &&
        id == other.id &&
        name == other.name &&
        users == other.users;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc(0, id.hashCode), name.hashCode), users.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Section')
          ..add('id', id)
          ..add('name', name)
          ..add('users', users))
        .toString();
  }
}

class SectionBuilder implements Builder<Section, SectionBuilder> {
  _$Section _$v;

  String _id;
  String get id => _$this._id;
  set id(String id) => _$this._id = id;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  ListBuilder<UserSection> _users;
  ListBuilder<UserSection> get users =>
      _$this._users ??= new ListBuilder<UserSection>();
  set users(ListBuilder<UserSection> users) => _$this._users = users;

  SectionBuilder();

  SectionBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _name = _$v.name;
      _users = _$v.users?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Section other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Section;
  }

  @override
  void update(void Function(SectionBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Section build() {
    _$Section _$result;
    try {
      _$result =
          _$v ?? new _$Section._(id: id, name: name, users: _users?.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'users';
        _users?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'Section', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
