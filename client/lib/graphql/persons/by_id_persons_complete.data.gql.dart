// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:client/schema.schema.gql.dart' as _i2;
import 'package:client/serializers.gql.dart' as _i1;

part 'by_id_persons_complete.data.gql.g.dart';

abstract class GByIdPersonCompleteData
    implements Built<GByIdPersonCompleteData, GByIdPersonCompleteDataBuilder> {
  GByIdPersonCompleteData._();

  factory GByIdPersonCompleteData(
          [Function(GByIdPersonCompleteDataBuilder b) updates]) =
      _$GByIdPersonCompleteData;

  static void _initializeBuilder(GByIdPersonCompleteDataBuilder b) =>
      b..G__typename = 'Query';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @nullable
  GByIdPersonCompleteData_personById get personById;
  static Serializer<GByIdPersonCompleteData> get serializer =>
      _$gByIdPersonCompleteDataSerializer;
  Map<String, dynamic> toJson() =>
      _i1.serializers.serializeWith(GByIdPersonCompleteData.serializer, this);
  static GByIdPersonCompleteData fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GByIdPersonCompleteData.serializer, json);
}

abstract class GByIdPersonCompleteData_personById
    implements
        Built<GByIdPersonCompleteData_personById,
            GByIdPersonCompleteData_personByIdBuilder> {
  GByIdPersonCompleteData_personById._();

  factory GByIdPersonCompleteData_personById(
          [Function(GByIdPersonCompleteData_personByIdBuilder b) updates]) =
      _$GByIdPersonCompleteData_personById;

  static void _initializeBuilder(GByIdPersonCompleteData_personByIdBuilder b) =>
      b..G__typename = 'Person';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  int get id;
  String get name;
  @nullable
  String get email;
  @nullable
  String get phone;
  BuiltList<String> get tags;
  _i2.GNaiveDateTime get added;
  @nullable
  _i2.GNaiveDateTime get changed;
  static Serializer<GByIdPersonCompleteData_personById> get serializer =>
      _$gByIdPersonCompleteDataPersonByIdSerializer;
  Map<String, dynamic> toJson() => _i1.serializers
      .serializeWith(GByIdPersonCompleteData_personById.serializer, this);
  static GByIdPersonCompleteData_personById fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers
          .deserializeWith(GByIdPersonCompleteData_personById.serializer, json);
}
