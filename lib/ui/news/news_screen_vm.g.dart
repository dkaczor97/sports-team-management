// GENERATED CODE - DO NOT MODIFY BY HAND

part of news_screen_vm;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$NewsScreenVM extends NewsScreenVM {
  @override
  final BuiltList<News> newsList;

  factory _$NewsScreenVM([void Function(NewsScreenVMBuilder) updates]) =>
      (new NewsScreenVMBuilder()..update(updates)).build();

  _$NewsScreenVM._({this.newsList}) : super._() {
    if (newsList == null) {
      throw new BuiltValueNullFieldError('NewsScreenVM', 'newsList');
    }
  }

  @override
  NewsScreenVM rebuild(void Function(NewsScreenVMBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NewsScreenVMBuilder toBuilder() => new NewsScreenVMBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NewsScreenVM && newsList == other.newsList;
  }

  @override
  int get hashCode {
    return $jf($jc(0, newsList.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('NewsScreenVM')
          ..add('newsList', newsList))
        .toString();
  }
}

class NewsScreenVMBuilder
    implements Builder<NewsScreenVM, NewsScreenVMBuilder> {
  _$NewsScreenVM _$v;

  ListBuilder<News> _newsList;
  ListBuilder<News> get newsList =>
      _$this._newsList ??= new ListBuilder<News>();
  set newsList(ListBuilder<News> newsList) => _$this._newsList = newsList;

  NewsScreenVMBuilder();

  NewsScreenVMBuilder get _$this {
    if (_$v != null) {
      _newsList = _$v.newsList?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NewsScreenVM other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$NewsScreenVM;
  }

  @override
  void update(void Function(NewsScreenVMBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$NewsScreenVM build() {
    _$NewsScreenVM _$result;
    try {
      _$result = _$v ?? new _$NewsScreenVM._(newsList: newsList.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'newsList';
        newsList.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'NewsScreenVM', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
