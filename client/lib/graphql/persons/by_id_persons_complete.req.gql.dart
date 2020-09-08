// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:client/graphql/persons/by_id_persons_complete.ast.gql.dart'
    as _i5;
import 'package:client/graphql/persons/by_id_persons_complete.data.gql.dart'
    as _i2;
import 'package:client/graphql/persons/by_id_persons_complete.var.gql.dart'
    as _i3;
import 'package:client/serializers.gql.dart' as _i7;
import 'package:ferry/ferry.dart' as _i1;
import 'package:gql_exec/gql_exec.dart' as _i4;
import 'package:uuid/uuid.dart' as _i6;

part 'by_id_persons_complete.req.gql.g.dart';

abstract class GByIdPersonCompleteReq
    implements
        Built<GByIdPersonCompleteReq, GByIdPersonCompleteReqBuilder>,
        _i1.OperationRequest<_i2.GByIdPersonCompleteData,
            _i3.GByIdPersonCompleteVars> {
  GByIdPersonCompleteReq._();

  factory GByIdPersonCompleteReq(
          [Function(GByIdPersonCompleteReqBuilder b) updates]) =
      _$GByIdPersonCompleteReq;

  static void _initializeBuilder(GByIdPersonCompleteReqBuilder b) => b
    ..operation = _i4.Operation(
        document: _i5.document, operationName: 'ByIdPersonComplete')
    ..requestId = _i6.Uuid().v1();
  _i3.GByIdPersonCompleteVars get vars;
  _i4.Operation get operation;
  _i4.Request get execRequest =>
      _i4.Request(operation: operation, variables: vars.toJson());
  @nullable
  String get requestId;
  @nullable
  @BuiltValueField(serialize: false)
  _i2.GByIdPersonCompleteData Function(
          _i2.GByIdPersonCompleteData, _i2.GByIdPersonCompleteData)
      get updateResult;
  @nullable
  _i2.GByIdPersonCompleteData get optimisticResponse;
  @nullable
  String get updateCacheHandlerKey;
  @nullable
  Map<String, dynamic> get updateCacheHandlerContext;
  @nullable
  _i1.FetchPolicy get fetchPolicy;
  @override
  _i2.GByIdPersonCompleteData parseData(Map<String, dynamic> json) =>
      _i2.GByIdPersonCompleteData.fromJson(json);
  static Serializer<GByIdPersonCompleteReq> get serializer =>
      _$gByIdPersonCompleteReqSerializer;
  Map<String, dynamic> toJson() =>
      _i7.serializers.serializeWith(GByIdPersonCompleteReq.serializer, this);
  static GByIdPersonCompleteReq fromJson(Map<String, dynamic> json) =>
      _i7.serializers.deserializeWith(GByIdPersonCompleteReq.serializer, json);
}
