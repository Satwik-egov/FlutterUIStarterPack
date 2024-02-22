// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'dataModel.dart';

class ApiOperationMapper extends EnumMapper<ApiOperation> {
  ApiOperationMapper._();

  static ApiOperationMapper? _instance;
  static ApiOperationMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ApiOperationMapper._());
    }
    return _instance!;
  }

  static ApiOperation fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  ApiOperation decode(dynamic value) {
    switch (value) {
      case 'login':
        return ApiOperation.login;
      case 'create':
        return ApiOperation.create;
      case 'search':
        return ApiOperation.search;
      case 'update':
        return ApiOperation.update;
      case 'delete':
        return ApiOperation.delete;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(ApiOperation self) {
    switch (self) {
      case ApiOperation.login:
        return 'login';
      case ApiOperation.create:
        return 'create';
      case ApiOperation.search:
        return 'search';
      case ApiOperation.update:
        return 'update';
      case ApiOperation.delete:
        return 'delete';
    }
  }
}

extension ApiOperationMapperExtension on ApiOperation {
  String toValue() {
    ApiOperationMapper.ensureInitialized();
    return MapperContainer.globals.toValue<ApiOperation>(this) as String;
  }
}

class DataModelTypeMapper extends EnumMapper<DataModelType> {
  DataModelTypeMapper._();

  static DataModelTypeMapper? _instance;
  static DataModelTypeMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = DataModelTypeMapper._());
    }
    return _instance!;
  }

  static DataModelType fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  DataModelType decode(dynamic value) {
    switch (value) {
      case 'user':
        return DataModelType.user;
      case 'facility':
        return DataModelType.facility;
      case 'address':
        return DataModelType.address;
      case 'household':
        return DataModelType.household;
      case 'individual':
        return DataModelType.individual;
      case 'projectBeneficiary':
        return DataModelType.projectBeneficiary;
      case 'householdMember':
        return DataModelType.householdMember;
      case 'product':
        return DataModelType.product;
      case 'productVariant':
        return DataModelType.productVariant;
      case 'project':
        return DataModelType.project;
      case 'projectFacility':
        return DataModelType.projectFacility;
      case 'projectProductVariant':
        return DataModelType.projectProductVariant;
      case 'projectStaff':
        return DataModelType.projectStaff;
      case 'projectResource':
        return DataModelType.projectResource;
      case 'projectType':
        return DataModelType.projectType;
      case 'stock':
        return DataModelType.stock;
      case 'stockReconciliation':
        return DataModelType.stockReconciliation;
      case 'task':
        return DataModelType.task;
      case 'sideEffect':
        return DataModelType.sideEffect;
      case 'referral':
        return DataModelType.referral;
      case 'serviceDefinition':
        return DataModelType.serviceDefinition;
      case 'service':
        return DataModelType.service;
      case 'complaints':
        return DataModelType.complaints;
      case 'attributes':
        return DataModelType.attributes;
      case 'boundary':
        return DataModelType.boundary;
      case 'serviceAttributes':
        return DataModelType.serviceAttributes;
      case 'locality':
        return DataModelType.locality;
      case 'downsync':
        return DataModelType.downsync;
      case 'downsyncCriteria':
        return DataModelType.downsyncCriteria;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(DataModelType self) {
    switch (self) {
      case DataModelType.user:
        return 'user';
      case DataModelType.facility:
        return 'facility';
      case DataModelType.address:
        return 'address';
      case DataModelType.household:
        return 'household';
      case DataModelType.individual:
        return 'individual';
      case DataModelType.projectBeneficiary:
        return 'projectBeneficiary';
      case DataModelType.householdMember:
        return 'householdMember';
      case DataModelType.product:
        return 'product';
      case DataModelType.productVariant:
        return 'productVariant';
      case DataModelType.project:
        return 'project';
      case DataModelType.projectFacility:
        return 'projectFacility';
      case DataModelType.projectProductVariant:
        return 'projectProductVariant';
      case DataModelType.projectStaff:
        return 'projectStaff';
      case DataModelType.projectResource:
        return 'projectResource';
      case DataModelType.projectType:
        return 'projectType';
      case DataModelType.stock:
        return 'stock';
      case DataModelType.stockReconciliation:
        return 'stockReconciliation';
      case DataModelType.task:
        return 'task';
      case DataModelType.sideEffect:
        return 'sideEffect';
      case DataModelType.referral:
        return 'referral';
      case DataModelType.serviceDefinition:
        return 'serviceDefinition';
      case DataModelType.service:
        return 'service';
      case DataModelType.complaints:
        return 'complaints';
      case DataModelType.attributes:
        return 'attributes';
      case DataModelType.boundary:
        return 'boundary';
      case DataModelType.serviceAttributes:
        return 'serviceAttributes';
      case DataModelType.locality:
        return 'locality';
      case DataModelType.downsync:
        return 'downsync';
      case DataModelType.downsyncCriteria:
        return 'downsyncCriteria';
    }
  }
}

extension DataModelTypeMapperExtension on DataModelType {
  String toValue() {
    DataModelTypeMapper.ensureInitialized();
    return MapperContainer.globals.toValue<DataModelType>(this) as String;
  }
}
