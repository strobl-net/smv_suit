// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:client/serializers.gql.dart' as _i1;

part 'all_persons_complete.var.gql.g.dart';

abstract class GAllPersonsCompleteVars
    implements Built<GAllPersonsCompleteVars, GAllPersonsCompleteVarsBuilder> {
  GAllPersonsCompleteVars._();

  factory GAllPersonsCompleteVars(
          [Function(GAllPersonsCompleteVarsBuilder b) updates]) =
      _$GAllPersonsCompleteVars;

  static Serializer<GAllPersonsCompleteVars> get serializer =>
      _$gAllPersonsCompleteVarsSerializer;
  Map<String, dynamic> toJson() =>
      _i1.serializers.serializeWith(GAllPersonsCompleteVars.serializer, this);
  static GAllPersonsCompleteVars fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GAllPersonsCompleteVars.serializer, json);
}
