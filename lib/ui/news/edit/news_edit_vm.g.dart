// GENERATED CODE - DO NOT MODIFY BY HAND

part of news_edit_vm;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$NewsEditVM extends NewsEditVM {
  @override
  final BuiltList<Section> sections;

  factory _$NewsEditVM([void Function(NewsEditVMBuilder) updates]) =>
      (new NewsEditVMBuilder()..update(updates)).build();

  _$NewsEditVM._({this.sections}) : super._() {
    if (sections == null) {
      throw new BuiltValueNullFieldError('NewsEditVM', 'sections');
    }
  }

  @override
  NewsEditVM rebuild(void Function(NewsEditVMBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NewsEditVMBuilder toBuilder() => new NewsEditVMBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NewsEditVM && sections == other.sections;
  }

  @override
  int get hashCode {
    return $jf($jc(0, sections.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('NewsEditVM')
          ..add('sections', sections))
        .toString();
  }
}

class NewsEditVMBuilder implements Builder<NewsEditVM, NewsEditVMBuilder> {
  _$NewsEditVM _$v;

  ListBuilder<Section> _sections;
  ListBuilder<Section> get sections =>
      _$this._sections ??= new ListBuilder<Section>();
  set sections(ListBuilder<Section> sections) => _$this._sections = sections;

  NewsEditVMBuilder();

  NewsEditVMBuilder get _$this {
    if (_$v != null) {
      _sections = _$v.sections?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NewsEditVM other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$NewsEditVM;
  }

  @override
  void update(void Function(NewsEditVMBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$NewsEditVM build() {
    _$NewsEditVM _$result;
    try {
      _$result = _$v ?? new _$NewsEditVM._(sections: sections.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'sections';
        sections.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'NewsEditVM', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
