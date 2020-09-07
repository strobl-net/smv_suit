import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart' show StandardJsonPlugin;
import 'package:client/schema.schema.gql.dart'
    show
        GBranch,
        GCurrency,
        GInputBill,
        GInputDepodraw,
        GInputMoneyNode,
        GInputOrganisation,
        GInputPerson,
        GInputProduct,
        GInputStatementOfAccount,
        GInputTransaction,
        GInputTransactionEntity,
        GNaiveDateTime,
        GUpdateBill,
        GUpdateDepodraw,
        GUpdateMoneyNode,
        GUpdateOrganisation,
        GUpdatePerson,
        GUpdateProduct,
        GUpdateStatementOfAccount,
        GUpdateTransaction,
        GUpdateTransactionEntity;
import 'package:gql_code_builder/src/serializers/operation_serializer.dart'
    show OperationSerializer;

part 'serializers.gql.g.dart';

final SerializersBuilder _serializersBuilder = _$serializers.toBuilder()
  ..add(OperationSerializer())
  ..addPlugin(StandardJsonPlugin());
@SerializersFor([
  GBranch,
  GCurrency,
  GInputBill,
  GInputDepodraw,
  GInputMoneyNode,
  GInputOrganisation,
  GInputPerson,
  GInputProduct,
  GInputStatementOfAccount,
  GInputTransaction,
  GInputTransactionEntity,
  GNaiveDateTime,
  GUpdateBill,
  GUpdateDepodraw,
  GUpdateMoneyNode,
  GUpdateOrganisation,
  GUpdatePerson,
  GUpdateProduct,
  GUpdateStatementOfAccount,
  GUpdateTransaction,
  GUpdateTransactionEntity
])
final Serializers serializers = _serializersBuilder.build();
