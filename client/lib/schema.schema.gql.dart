// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:client/serializers.gql.dart' as _i1;
import 'package:gql_code_builder/src/serializers/default_scalar_serializer.dart'
    as _i2;

part 'schema.schema.gql.g.dart';

class GBranch extends EnumClass {
  const GBranch._(String name) : super(name);

  static const GBranch DIGITAL = _$gBranchDIGITAL;

  static const GBranch CASH = _$gBranchCASH;

  static Serializer<GBranch> get serializer => _$gBranchSerializer;
  static BuiltSet<GBranch> get values => _$gBranchValues;
  static GBranch valueOf(String name) => _$gBranchValueOf(name);
}

class GCurrency extends EnumClass {
  const GCurrency._(String name) : super(name);

  static const GCurrency EUR = _$gCurrencyEUR;

  static const GCurrency USD = _$gCurrencyUSD;

  static Serializer<GCurrency> get serializer => _$gCurrencySerializer;
  static BuiltSet<GCurrency> get values => _$gCurrencyValues;
  static GCurrency valueOf(String name) => _$gCurrencyValueOf(name);
}

abstract class GInputBill implements Built<GInputBill, GInputBillBuilder> {
  GInputBill._();

  factory GInputBill([Function(GInputBillBuilder b) updates]) = _$GInputBill;

  GNaiveDateTime get received;
  @nullable
  GNaiveDateTime get processed;
  BuiltList<int> get products;
  @nullable
  int get responsible;
  int get transaction;
  static Serializer<GInputBill> get serializer => _$gInputBillSerializer;
  Map<String, dynamic> toJson() =>
      _i1.serializers.serializeWith(GInputBill.serializer, this);
  static GInputBill fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GInputBill.serializer, json);
}

abstract class GInputDepodraw
    implements Built<GInputDepodraw, GInputDepodrawBuilder> {
  GInputDepodraw._();

  factory GInputDepodraw([Function(GInputDepodrawBuilder b) updates]) =
      _$GInputDepodraw;

  @nullable
  String get description;
  int get transactionUp;
  int get transactionDown;
  static Serializer<GInputDepodraw> get serializer =>
      _$gInputDepodrawSerializer;
  Map<String, dynamic> toJson() =>
      _i1.serializers.serializeWith(GInputDepodraw.serializer, this);
  static GInputDepodraw fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GInputDepodraw.serializer, json);
}

abstract class GInputMoneyNode
    implements Built<GInputMoneyNode, GInputMoneyNodeBuilder> {
  GInputMoneyNode._();

  factory GInputMoneyNode([Function(GInputMoneyNodeBuilder b) updates]) =
      _$GInputMoneyNode;

  GBranch get branch;
  int get change;
  GCurrency get currency;
  bool get processed;
  static Serializer<GInputMoneyNode> get serializer =>
      _$gInputMoneyNodeSerializer;
  Map<String, dynamic> toJson() =>
      _i1.serializers.serializeWith(GInputMoneyNode.serializer, this);
  static GInputMoneyNode fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GInputMoneyNode.serializer, json);
}

abstract class GInputOrganisation
    implements Built<GInputOrganisation, GInputOrganisationBuilder> {
  GInputOrganisation._();

  factory GInputOrganisation([Function(GInputOrganisationBuilder b) updates]) =
      _$GInputOrganisation;

  String get name;
  @nullable
  String get description;
  @nullable
  String get site;
  @nullable
  String get location;
  static Serializer<GInputOrganisation> get serializer =>
      _$gInputOrganisationSerializer;
  Map<String, dynamic> toJson() =>
      _i1.serializers.serializeWith(GInputOrganisation.serializer, this);
  static GInputOrganisation fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GInputOrganisation.serializer, json);
}

abstract class GInputPerson
    implements Built<GInputPerson, GInputPersonBuilder> {
  GInputPerson._();

  factory GInputPerson([Function(GInputPersonBuilder b) updates]) =
      _$GInputPerson;

  String get name;
  @nullable
  String get email;
  @nullable
  String get phone;
  BuiltList<String> get tags;
  static Serializer<GInputPerson> get serializer => _$gInputPersonSerializer;
  Map<String, dynamic> toJson() =>
      _i1.serializers.serializeWith(GInputPerson.serializer, this);
  static GInputPerson fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GInputPerson.serializer, json);
}

abstract class GInputProduct
    implements Built<GInputProduct, GInputProductBuilder> {
  GInputProduct._();

  factory GInputProduct([Function(GInputProductBuilder b) updates]) =
      _$GInputProduct;

  String get name;
  @nullable
  String get description;
  @nullable
  int get change;
  @nullable
  GCurrency get currency;
  @nullable
  int get provider;
  BuiltList<String> get tags;
  static Serializer<GInputProduct> get serializer => _$gInputProductSerializer;
  Map<String, dynamic> toJson() =>
      _i1.serializers.serializeWith(GInputProduct.serializer, this);
  static GInputProduct fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GInputProduct.serializer, json);
}

abstract class GInputStatementOfAccount
    implements
        Built<GInputStatementOfAccount, GInputStatementOfAccountBuilder> {
  GInputStatementOfAccount._();

  factory GInputStatementOfAccount(
          [Function(GInputStatementOfAccountBuilder b) updates]) =
      _$GInputStatementOfAccount;

  @nullable
  String get description;
  GNaiveDateTime get starting;
  GNaiveDateTime get ending;
  static Serializer<GInputStatementOfAccount> get serializer =>
      _$gInputStatementOfAccountSerializer;
  Map<String, dynamic> toJson() =>
      _i1.serializers.serializeWith(GInputStatementOfAccount.serializer, this);
  static GInputStatementOfAccount fromJson(Map<String, dynamic> json) =>
      _i1.serializers
          .deserializeWith(GInputStatementOfAccount.serializer, json);
}

abstract class GInputTransaction
    implements Built<GInputTransaction, GInputTransactionBuilder> {
  GInputTransaction._();

  factory GInputTransaction([Function(GInputTransactionBuilder b) updates]) =
      _$GInputTransaction;

  @nullable
  String get description;
  int get sender;
  bool get senderLocal;
  int get receiver;
  bool get receiverLocal;
  int get moneyNode;
  static Serializer<GInputTransaction> get serializer =>
      _$gInputTransactionSerializer;
  Map<String, dynamic> toJson() =>
      _i1.serializers.serializeWith(GInputTransaction.serializer, this);
  static GInputTransaction fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GInputTransaction.serializer, json);
}

abstract class GInputTransactionEntity
    implements Built<GInputTransactionEntity, GInputTransactionEntityBuilder> {
  GInputTransactionEntity._();

  factory GInputTransactionEntity(
          [Function(GInputTransactionEntityBuilder b) updates]) =
      _$GInputTransactionEntity;

  @nullable
  String get description;
  @nullable
  int get organisation;
  @nullable
  int get person;
  @nullable
  String get iban;
  @nullable
  String get bic;
  static Serializer<GInputTransactionEntity> get serializer =>
      _$gInputTransactionEntitySerializer;
  Map<String, dynamic> toJson() =>
      _i1.serializers.serializeWith(GInputTransactionEntity.serializer, this);
  static GInputTransactionEntity fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GInputTransactionEntity.serializer, json);
}

abstract class GNaiveDateTime
    implements Built<GNaiveDateTime, GNaiveDateTimeBuilder> {
  GNaiveDateTime._();

  factory GNaiveDateTime([String value]) =>
      _$GNaiveDateTime((b) => value != null ? (b..value = value) : b);

  String get value;
  @BuiltValueSerializer(custom: true)
  static Serializer<GNaiveDateTime> get serializer =>
      _i2.DefaultScalarSerializer<GNaiveDateTime>(
          (Object serialized) => GNaiveDateTime(serialized));
}

abstract class GUpdateBill implements Built<GUpdateBill, GUpdateBillBuilder> {
  GUpdateBill._();

  factory GUpdateBill([Function(GUpdateBillBuilder b) updates]) = _$GUpdateBill;

  @nullable
  GNaiveDateTime get received;
  @nullable
  GNaiveDateTime get processed;
  BuiltList<int> get products;
  @nullable
  int get responsible;
  @nullable
  int get transaction;
  static Serializer<GUpdateBill> get serializer => _$gUpdateBillSerializer;
  Map<String, dynamic> toJson() =>
      _i1.serializers.serializeWith(GUpdateBill.serializer, this);
  static GUpdateBill fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GUpdateBill.serializer, json);
}

abstract class GUpdateDepodraw
    implements Built<GUpdateDepodraw, GUpdateDepodrawBuilder> {
  GUpdateDepodraw._();

  factory GUpdateDepodraw([Function(GUpdateDepodrawBuilder b) updates]) =
      _$GUpdateDepodraw;

  @nullable
  String get description;
  @nullable
  int get transactionUp;
  @nullable
  int get transactionDown;
  static Serializer<GUpdateDepodraw> get serializer =>
      _$gUpdateDepodrawSerializer;
  Map<String, dynamic> toJson() =>
      _i1.serializers.serializeWith(GUpdateDepodraw.serializer, this);
  static GUpdateDepodraw fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GUpdateDepodraw.serializer, json);
}

abstract class GUpdateMoneyNode
    implements Built<GUpdateMoneyNode, GUpdateMoneyNodeBuilder> {
  GUpdateMoneyNode._();

  factory GUpdateMoneyNode([Function(GUpdateMoneyNodeBuilder b) updates]) =
      _$GUpdateMoneyNode;

  @nullable
  GBranch get branch;
  @nullable
  int get change;
  @nullable
  GCurrency get currency;
  @nullable
  bool get processed;
  static Serializer<GUpdateMoneyNode> get serializer =>
      _$gUpdateMoneyNodeSerializer;
  Map<String, dynamic> toJson() =>
      _i1.serializers.serializeWith(GUpdateMoneyNode.serializer, this);
  static GUpdateMoneyNode fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GUpdateMoneyNode.serializer, json);
}

abstract class GUpdateOrganisation
    implements Built<GUpdateOrganisation, GUpdateOrganisationBuilder> {
  GUpdateOrganisation._();

  factory GUpdateOrganisation(
      [Function(GUpdateOrganisationBuilder b) updates]) = _$GUpdateOrganisation;

  @nullable
  String get name;
  @nullable
  String get description;
  @nullable
  String get site;
  @nullable
  String get location;
  static Serializer<GUpdateOrganisation> get serializer =>
      _$gUpdateOrganisationSerializer;
  Map<String, dynamic> toJson() =>
      _i1.serializers.serializeWith(GUpdateOrganisation.serializer, this);
  static GUpdateOrganisation fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GUpdateOrganisation.serializer, json);
}

abstract class GUpdatePerson
    implements Built<GUpdatePerson, GUpdatePersonBuilder> {
  GUpdatePerson._();

  factory GUpdatePerson([Function(GUpdatePersonBuilder b) updates]) =
      _$GUpdatePerson;

  @nullable
  String get name;
  @nullable
  String get email;
  @nullable
  String get phone;
  BuiltList<String> get tags;
  static Serializer<GUpdatePerson> get serializer => _$gUpdatePersonSerializer;
  Map<String, dynamic> toJson() =>
      _i1.serializers.serializeWith(GUpdatePerson.serializer, this);
  static GUpdatePerson fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GUpdatePerson.serializer, json);
}

abstract class GUpdateProduct
    implements Built<GUpdateProduct, GUpdateProductBuilder> {
  GUpdateProduct._();

  factory GUpdateProduct([Function(GUpdateProductBuilder b) updates]) =
      _$GUpdateProduct;

  @nullable
  String get name;
  @nullable
  String get description;
  @nullable
  int get change;
  @nullable
  GCurrency get currency;
  @nullable
  int get provider;
  BuiltList<String> get tags;
  static Serializer<GUpdateProduct> get serializer =>
      _$gUpdateProductSerializer;
  Map<String, dynamic> toJson() =>
      _i1.serializers.serializeWith(GUpdateProduct.serializer, this);
  static GUpdateProduct fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GUpdateProduct.serializer, json);
}

abstract class GUpdateStatementOfAccount
    implements
        Built<GUpdateStatementOfAccount, GUpdateStatementOfAccountBuilder> {
  GUpdateStatementOfAccount._();

  factory GUpdateStatementOfAccount(
          [Function(GUpdateStatementOfAccountBuilder b) updates]) =
      _$GUpdateStatementOfAccount;

  @nullable
  String get description;
  @nullable
  GNaiveDateTime get starting;
  @nullable
  GNaiveDateTime get ending;
  static Serializer<GUpdateStatementOfAccount> get serializer =>
      _$gUpdateStatementOfAccountSerializer;
  Map<String, dynamic> toJson() =>
      _i1.serializers.serializeWith(GUpdateStatementOfAccount.serializer, this);
  static GUpdateStatementOfAccount fromJson(Map<String, dynamic> json) =>
      _i1.serializers
          .deserializeWith(GUpdateStatementOfAccount.serializer, json);
}

abstract class GUpdateTransaction
    implements Built<GUpdateTransaction, GUpdateTransactionBuilder> {
  GUpdateTransaction._();

  factory GUpdateTransaction([Function(GUpdateTransactionBuilder b) updates]) =
      _$GUpdateTransaction;

  @nullable
  String get description;
  @nullable
  int get sender;
  @nullable
  bool get senderLocal;
  @nullable
  int get receiver;
  @nullable
  bool get receiverLocal;
  @nullable
  int get moneyNode;
  static Serializer<GUpdateTransaction> get serializer =>
      _$gUpdateTransactionSerializer;
  Map<String, dynamic> toJson() =>
      _i1.serializers.serializeWith(GUpdateTransaction.serializer, this);
  static GUpdateTransaction fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GUpdateTransaction.serializer, json);
}

abstract class GUpdateTransactionEntity
    implements
        Built<GUpdateTransactionEntity, GUpdateTransactionEntityBuilder> {
  GUpdateTransactionEntity._();

  factory GUpdateTransactionEntity(
          [Function(GUpdateTransactionEntityBuilder b) updates]) =
      _$GUpdateTransactionEntity;

  @nullable
  String get description;
  @nullable
  int get organisation;
  @nullable
  int get person;
  @nullable
  String get iban;
  @nullable
  String get bic;
  static Serializer<GUpdateTransactionEntity> get serializer =>
      _$gUpdateTransactionEntitySerializer;
  Map<String, dynamic> toJson() =>
      _i1.serializers.serializeWith(GUpdateTransactionEntity.serializer, this);
  static GUpdateTransactionEntity fromJson(Map<String, dynamic> json) =>
      _i1.serializers
          .deserializeWith(GUpdateTransactionEntity.serializer, json);
}
