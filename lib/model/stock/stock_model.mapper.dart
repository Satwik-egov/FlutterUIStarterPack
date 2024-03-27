// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'stock_model.dart';

class HcmStockSearchModelMapper extends ClassMapperBase<HcmStockSearchModel> {
  HcmStockSearchModelMapper._();

  static HcmStockSearchModelMapper? _instance;
  static HcmStockSearchModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = HcmStockSearchModelMapper._());
      StockSearchModelMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'HcmStockSearchModel';

  static StockSearchModel? _$stock(HcmStockSearchModel v) => v.stock;
  static const Field<HcmStockSearchModel, StockSearchModel> _f$stock =
      Field('stock', _$stock);

  @override
  final MappableFields<HcmStockSearchModel> fields = const {
    #stock: _f$stock,
  };
  @override
  final bool ignoreNull = true;

  static HcmStockSearchModel _instantiate(DecodingData data) {
    return HcmStockSearchModel.ignoreDeleted(data.dec(_f$stock));
  }

  @override
  final Function instantiate = _instantiate;

  static HcmStockSearchModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<HcmStockSearchModel>(map);
  }

  static HcmStockSearchModel fromJson(String json) {
    return ensureInitialized().decodeJson<HcmStockSearchModel>(json);
  }
}

mixin HcmStockSearchModelMappable {
  String toJson() {
    return HcmStockSearchModelMapper.ensureInitialized()
        .encodeJson<HcmStockSearchModel>(this as HcmStockSearchModel);
  }

  Map<String, dynamic> toMap() {
    return HcmStockSearchModelMapper.ensureInitialized()
        .encodeMap<HcmStockSearchModel>(this as HcmStockSearchModel);
  }

  HcmStockSearchModelCopyWith<HcmStockSearchModel, HcmStockSearchModel,
          HcmStockSearchModel>
      get copyWith => _HcmStockSearchModelCopyWithImpl(
          this as HcmStockSearchModel, $identity, $identity);
  @override
  String toString() {
    return HcmStockSearchModelMapper.ensureInitialized()
        .stringifyValue(this as HcmStockSearchModel);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            HcmStockSearchModelMapper.ensureInitialized()
                .isValueEqual(this as HcmStockSearchModel, other));
  }

  @override
  int get hashCode {
    return HcmStockSearchModelMapper.ensureInitialized()
        .hashValue(this as HcmStockSearchModel);
  }
}

extension HcmStockSearchModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, HcmStockSearchModel, $Out> {
  HcmStockSearchModelCopyWith<$R, HcmStockSearchModel, $Out>
      get $asHcmStockSearchModel =>
          $base.as((v, t, t2) => _HcmStockSearchModelCopyWithImpl(v, t, t2));
}

abstract class HcmStockSearchModelCopyWith<$R, $In extends HcmStockSearchModel,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  StockSearchModelCopyWith<$R, StockSearchModel, StockSearchModel>? get stock;
  $R call({StockSearchModel? stock});
  HcmStockSearchModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _HcmStockSearchModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, HcmStockSearchModel, $Out>
    implements HcmStockSearchModelCopyWith<$R, HcmStockSearchModel, $Out> {
  _HcmStockSearchModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<HcmStockSearchModel> $mapper =
      HcmStockSearchModelMapper.ensureInitialized();
  @override
  StockSearchModelCopyWith<$R, StockSearchModel, StockSearchModel>? get stock =>
      $value.stock?.copyWith.$chain((v) => call(stock: v));
  @override
  $R call({Object? stock = $none}) =>
      $apply(FieldCopyWithData({if (stock != $none) #stock: stock}));
  @override
  HcmStockSearchModel $make(CopyWithData data) =>
      HcmStockSearchModel.ignoreDeleted(data.get(#stock, or: $value.stock));

  @override
  HcmStockSearchModelCopyWith<$R2, HcmStockSearchModel, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _HcmStockSearchModelCopyWithImpl($value, $cast, t);
}

class HcmStockModelMapper extends ClassMapperBase<HcmStockModel> {
  HcmStockModelMapper._();

  static HcmStockModelMapper? _instance;
  static HcmStockModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = HcmStockModelMapper._());
      HcmStockModelAdditionalFieldsMapper.ensureInitialized();
      StockModelMapper.ensureInitialized();
      AuditDetailsMapper.ensureInitialized();
      ClientAuditDetailsMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'HcmStockModel';

  static HcmStockModelAdditionalFields _$additionalFields(HcmStockModel v) =>
      v.additionalFields;
  static const Field<HcmStockModel, HcmStockModelAdditionalFields>
      _f$additionalFields = Field('additionalFields', _$additionalFields);
  static StockModel? _$stock(HcmStockModel v) => v.stock;
  static const Field<HcmStockModel, StockModel> _f$stock =
      Field('stock', _$stock, opt: true);
  static AuditDetails? _$auditDetails(HcmStockModel v) => v.auditDetails;
  static const Field<HcmStockModel, AuditDetails> _f$auditDetails =
      Field('auditDetails', _$auditDetails, opt: true);
  static ClientAuditDetails? _$clientAuditDetails(HcmStockModel v) =>
      v.clientAuditDetails;
  static const Field<HcmStockModel, ClientAuditDetails> _f$clientAuditDetails =
      Field('clientAuditDetails', _$clientAuditDetails, opt: true);

  @override
  final MappableFields<HcmStockModel> fields = const {
    #additionalFields: _f$additionalFields,
    #stock: _f$stock,
    #auditDetails: _f$auditDetails,
    #clientAuditDetails: _f$clientAuditDetails,
  };
  @override
  final bool ignoreNull = true;

  static HcmStockModel _instantiate(DecodingData data) {
    return HcmStockModel(
        additionalFields: data.dec(_f$additionalFields),
        stock: data.dec(_f$stock),
        auditDetails: data.dec(_f$auditDetails),
        clientAuditDetails: data.dec(_f$clientAuditDetails));
  }

  @override
  final Function instantiate = _instantiate;

  static HcmStockModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<HcmStockModel>(map);
  }

  static HcmStockModel fromJson(String json) {
    return ensureInitialized().decodeJson<HcmStockModel>(json);
  }
}

mixin HcmStockModelMappable {
  String toJson() {
    return HcmStockModelMapper.ensureInitialized()
        .encodeJson<HcmStockModel>(this as HcmStockModel);
  }

  Map<String, dynamic> toMap() {
    return HcmStockModelMapper.ensureInitialized()
        .encodeMap<HcmStockModel>(this as HcmStockModel);
  }

  HcmStockModelCopyWith<HcmStockModel, HcmStockModel, HcmStockModel>
      get copyWith => _HcmStockModelCopyWithImpl(
          this as HcmStockModel, $identity, $identity);
  @override
  String toString() {
    return HcmStockModelMapper.ensureInitialized()
        .stringifyValue(this as HcmStockModel);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            HcmStockModelMapper.ensureInitialized()
                .isValueEqual(this as HcmStockModel, other));
  }

  @override
  int get hashCode {
    return HcmStockModelMapper.ensureInitialized()
        .hashValue(this as HcmStockModel);
  }
}

extension HcmStockModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, HcmStockModel, $Out> {
  HcmStockModelCopyWith<$R, HcmStockModel, $Out> get $asHcmStockModel =>
      $base.as((v, t, t2) => _HcmStockModelCopyWithImpl(v, t, t2));
}

abstract class HcmStockModelCopyWith<$R, $In extends HcmStockModel, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  HcmStockModelAdditionalFieldsCopyWith<$R, HcmStockModelAdditionalFields,
      HcmStockModelAdditionalFields> get additionalFields;
  StockModelCopyWith<$R, StockModel, StockModel>? get stock;
  AuditDetailsCopyWith<$R, AuditDetails, AuditDetails>? get auditDetails;
  ClientAuditDetailsCopyWith<$R, ClientAuditDetails, ClientAuditDetails>?
      get clientAuditDetails;
  $R call(
      {HcmStockModelAdditionalFields? additionalFields,
      StockModel? stock,
      AuditDetails? auditDetails,
      ClientAuditDetails? clientAuditDetails});
  HcmStockModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _HcmStockModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, HcmStockModel, $Out>
    implements HcmStockModelCopyWith<$R, HcmStockModel, $Out> {
  _HcmStockModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<HcmStockModel> $mapper =
      HcmStockModelMapper.ensureInitialized();
  @override
  HcmStockModelAdditionalFieldsCopyWith<$R, HcmStockModelAdditionalFields,
          HcmStockModelAdditionalFields>
      get additionalFields => $value.additionalFields.copyWith
          .$chain((v) => call(additionalFields: v));
  @override
  StockModelCopyWith<$R, StockModel, StockModel>? get stock =>
      $value.stock?.copyWith.$chain((v) => call(stock: v));
  @override
  AuditDetailsCopyWith<$R, AuditDetails, AuditDetails>? get auditDetails =>
      $value.auditDetails?.copyWith.$chain((v) => call(auditDetails: v));
  @override
  ClientAuditDetailsCopyWith<$R, ClientAuditDetails, ClientAuditDetails>?
      get clientAuditDetails => $value.clientAuditDetails?.copyWith
          .$chain((v) => call(clientAuditDetails: v));
  @override
  $R call(
          {HcmStockModelAdditionalFields? additionalFields,
          Object? stock = $none,
          Object? auditDetails = $none,
          Object? clientAuditDetails = $none}) =>
      $apply(FieldCopyWithData({
        if (additionalFields != null) #additionalFields: additionalFields,
        if (stock != $none) #stock: stock,
        if (auditDetails != $none) #auditDetails: auditDetails,
        if (clientAuditDetails != $none) #clientAuditDetails: clientAuditDetails
      }));
  @override
  HcmStockModel $make(CopyWithData data) => HcmStockModel(
      additionalFields:
          data.get(#additionalFields, or: $value.additionalFields),
      stock: data.get(#stock, or: $value.stock),
      auditDetails: data.get(#auditDetails, or: $value.auditDetails),
      clientAuditDetails:
          data.get(#clientAuditDetails, or: $value.clientAuditDetails));

  @override
  HcmStockModelCopyWith<$R2, HcmStockModel, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _HcmStockModelCopyWithImpl($value, $cast, t);
}

class HcmStockModelAdditionalFieldsMapper
    extends SubClassMapperBase<HcmStockModelAdditionalFields> {
  HcmStockModelAdditionalFieldsMapper._();

  static HcmStockModelAdditionalFieldsMapper? _instance;
  static HcmStockModelAdditionalFieldsMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = HcmStockModelAdditionalFieldsMapper._());
      AdditionalFieldsMapper.ensureInitialized().addSubMapper(_instance!);
      AdditionalFieldMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'HcmStockModelAdditionalFields';

  static String _$schema(HcmStockModelAdditionalFields v) => v.schema;
  static const Field<HcmStockModelAdditionalFields, String> _f$schema =
      Field('schema', _$schema, opt: true, def: 'StockReconciliation');
  static int _$version(HcmStockModelAdditionalFields v) => v.version;
  static const Field<HcmStockModelAdditionalFields, int> _f$version =
      Field('version', _$version);
  static List<AdditionalField> _$fields(HcmStockModelAdditionalFields v) =>
      v.fields;
  static const Field<HcmStockModelAdditionalFields, List<AdditionalField>>
      _f$fields = Field('fields', _$fields, opt: true, def: const []);

  @override
  final MappableFields<HcmStockModelAdditionalFields> fields = const {
    #schema: _f$schema,
    #version: _f$version,
    #fields: _f$fields,
  };
  @override
  final bool ignoreNull = true;

  @override
  final String discriminatorKey = 'type';
  @override
  final dynamic discriminatorValue = MappableClass.useAsDefault;
  @override
  late final ClassMapperBase superMapper =
      AdditionalFieldsMapper.ensureInitialized();

  static HcmStockModelAdditionalFields _instantiate(DecodingData data) {
    return HcmStockModelAdditionalFields(
        schema: data.dec(_f$schema),
        version: data.dec(_f$version),
        fields: data.dec(_f$fields));
  }

  @override
  final Function instantiate = _instantiate;

  static HcmStockModelAdditionalFields fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<HcmStockModelAdditionalFields>(map);
  }

  static HcmStockModelAdditionalFields fromJson(String json) {
    return ensureInitialized().decodeJson<HcmStockModelAdditionalFields>(json);
  }
}

mixin HcmStockModelAdditionalFieldsMappable {
  String toJson() {
    return HcmStockModelAdditionalFieldsMapper.ensureInitialized()
        .encodeJson<HcmStockModelAdditionalFields>(
            this as HcmStockModelAdditionalFields);
  }

  Map<String, dynamic> toMap() {
    return HcmStockModelAdditionalFieldsMapper.ensureInitialized()
        .encodeMap<HcmStockModelAdditionalFields>(
            this as HcmStockModelAdditionalFields);
  }

  HcmStockModelAdditionalFieldsCopyWith<HcmStockModelAdditionalFields,
          HcmStockModelAdditionalFields, HcmStockModelAdditionalFields>
      get copyWith => _HcmStockModelAdditionalFieldsCopyWithImpl(
          this as HcmStockModelAdditionalFields, $identity, $identity);
  @override
  String toString() {
    return HcmStockModelAdditionalFieldsMapper.ensureInitialized()
        .stringifyValue(this as HcmStockModelAdditionalFields);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            HcmStockModelAdditionalFieldsMapper.ensureInitialized()
                .isValueEqual(this as HcmStockModelAdditionalFields, other));
  }

  @override
  int get hashCode {
    return HcmStockModelAdditionalFieldsMapper.ensureInitialized()
        .hashValue(this as HcmStockModelAdditionalFields);
  }
}

extension HcmStockModelAdditionalFieldsValueCopy<$R, $Out>
    on ObjectCopyWith<$R, HcmStockModelAdditionalFields, $Out> {
  HcmStockModelAdditionalFieldsCopyWith<$R, HcmStockModelAdditionalFields, $Out>
      get $asHcmStockModelAdditionalFields => $base.as(
          (v, t, t2) => _HcmStockModelAdditionalFieldsCopyWithImpl(v, t, t2));
}

abstract class HcmStockModelAdditionalFieldsCopyWith<
    $R,
    $In extends HcmStockModelAdditionalFields,
    $Out> implements AdditionalFieldsCopyWith<$R, $In, $Out> {
  @override
  ListCopyWith<$R, AdditionalField,
      AdditionalFieldCopyWith<$R, AdditionalField, AdditionalField>> get fields;
  @override
  $R call({String? schema, int? version, List<AdditionalField>? fields});
  HcmStockModelAdditionalFieldsCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _HcmStockModelAdditionalFieldsCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, HcmStockModelAdditionalFields, $Out>
    implements
        HcmStockModelAdditionalFieldsCopyWith<$R, HcmStockModelAdditionalFields,
            $Out> {
  _HcmStockModelAdditionalFieldsCopyWithImpl(
      super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<HcmStockModelAdditionalFields> $mapper =
      HcmStockModelAdditionalFieldsMapper.ensureInitialized();
  @override
  ListCopyWith<$R, AdditionalField,
          AdditionalFieldCopyWith<$R, AdditionalField, AdditionalField>>
      get fields => ListCopyWith($value.fields, (v, t) => v.copyWith.$chain(t),
          (v) => call(fields: v));
  @override
  $R call({String? schema, int? version, List<AdditionalField>? fields}) =>
      $apply(FieldCopyWithData({
        if (schema != null) #schema: schema,
        if (version != null) #version: version,
        if (fields != null) #fields: fields
      }));
  @override
  HcmStockModelAdditionalFields $make(CopyWithData data) =>
      HcmStockModelAdditionalFields(
          schema: data.get(#schema, or: $value.schema),
          version: data.get(#version, or: $value.version),
          fields: data.get(#fields, or: $value.fields));

  @override
  HcmStockModelAdditionalFieldsCopyWith<$R2, HcmStockModelAdditionalFields,
      $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _HcmStockModelAdditionalFieldsCopyWithImpl($value, $cast, t);
}
