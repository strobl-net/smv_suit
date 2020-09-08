// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all_persons_complete.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GAllPersonsCompleteVars> _$gAllPersonsCompleteVarsSerializer =
    new _$GAllPersonsCompleteVarsSerializer();

class _$GAllPersonsCompleteVarsSerializer
    implements StructuredSerializer<GAllPersonsCompleteVars> {
  @override
  final Iterable<Type> types = const [
    GAllPersonsCompleteVars,
    _$GAllPersonsCompleteVars
  ];
  @override
  final String wireName = 'GAllPersonsCompleteVars';

  @override
  Iterable<Object> serialize(
      Serializers serializers, GAllPersonsCompleteVars object,
      {FullType specifiedType = FullType.unspecified}) {
    return <Object>[];
  }

  @override
  GAllPersonsCompleteVars deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    return new GAllPersonsCompleteVarsBuilder().build();
  }
}

class _$GAllPersonsCompleteVars extends GAllPersonsCompleteVars {
  factory _$GAllPersonsCompleteVars(
          [void Function(GAllPersonsCompleteVarsBuilder) updates]) =>
      (new GAllPersonsCompleteVarsBuilder()..update(updates)).build();

  _$GAllPersonsCompleteVars._() : super._();

  @override
  GAllPersonsCompleteVars rebuild(
          void Function(GAllPersonsCompleteVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GAllPersonsCompleteVarsBuilder toBuilder() =>
      new GAllPersonsCompleteVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GAllPersonsCompleteVars;
  }

  @override
  int get hashCode {
    return 174803978;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper('GAllPersonsCompleteVars').toString();
  }
}

class GAllPersonsCompleteVarsBuilder
    implements
        Builder<GAllPersonsCompleteVars, GAllPersonsCompleteVarsBuilder> {
  _$GAllPersonsCompleteVars _$v;

  GAllPersonsCompleteVarsBuilder();

  @override
  void replace(GAllPersonsCompleteVars other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$GAllPersonsCompleteVars;
  }

  @override
  void update(void Function(GAllPersonsCompleteVarsBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GAllPersonsCompleteVars build() {
    final _$result = _$v ?? new _$GAllPersonsCompleteVars._();
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
