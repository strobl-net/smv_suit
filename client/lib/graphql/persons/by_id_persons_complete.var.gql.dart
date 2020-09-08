// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:client/serializers.gql.dart' as _i1;

part 'by_id_persons_complete.var.gql.g.dart';

abstract class GByIdPersonCompleteVars
    implements Built<GByIdPersonCompleteVars, GByIdPersonCompleteVarsBuilder> {
  GByIdPersonCompleteVars._();

  factory GByIdPersonCompleteVars(
          [Function(GByIdPersonCompleteVarsBuilder b) updates]) =
      _$GByIdPersonCompleteVars;

  int get id;
  static Serializer<GByIdPersonCompleteVars> get serializer =>
      _$gByIdPersonCompleteVarsSerializer;
  Map<String, dynamic> toJson() =>
      _i1.serializers.serializeWith(GByIdPersonCompleteVars.serializer, this);
  static GByIdPersonCompleteVars fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GByIdPersonCompleteVars.serializer, json);
}
