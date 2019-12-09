// GENERATED CODE - DO NOT MODIFY BY HAND

part of home_screen_vm;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$HomeScreenVM extends HomeScreenVM {
  @override
  final String userRole;

  factory _$HomeScreenVM([void Function(HomeScreenVMBuilder) updates]) =>
      (new HomeScreenVMBuilder()..update(updates)).build();

  _$HomeScreenVM._({this.userRole}) : super._();

  @override
  HomeScreenVM rebuild(void Function(HomeScreenVMBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  HomeScreenVMBuilder toBuilder() => new HomeScreenVMBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is HomeScreenVM && userRole == other.userRole;
  }

  @override
  int get hashCode {
    return $jf($jc(0, userRole.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('HomeScreenVM')
          ..add('userRole', userRole))
        .toString();
  }
}

class HomeScreenVMBuilder
    implements Builder<HomeScreenVM, HomeScreenVMBuilder> {
  _$HomeScreenVM _$v;

  String _userRole;
  String get userRole => _$this._userRole;
  set userRole(String userRole) => _$this._userRole = userRole;

  HomeScreenVMBuilder();

  HomeScreenVMBuilder get _$this {
    if (_$v != null) {
      _userRole = _$v.userRole;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(HomeScreenVM other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$HomeScreenVM;
  }

  @override
  void update(void Function(HomeScreenVMBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$HomeScreenVM build() {
    final _$result = _$v ?? new _$HomeScreenVM._(userRole: userRole);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
