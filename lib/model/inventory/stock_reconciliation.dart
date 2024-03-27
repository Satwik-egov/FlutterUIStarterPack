import 'package:dart_mappable/dart_mappable.dart';
import 'package:inventory_management/models/entities/stock_reconciliation.dart';
import 'package:new_digit_app/model/dataModel.dart';

part 'stock_reconciliation.mapper.dart';

@MappableClass(ignoreNull: true, discriminatorValue: MappableClass.useAsDefault)
class HcmStockReconciliationModel extends StockReconciliationModel {
  final AdditionalFields? additionalFields;

  HcmStockReconciliationModel(
      {super.id,
      super.calculatedCount,
      required super.clientReferenceId,
      super.commentsOnReconciliation,
      required super.dateOfReconciliation,
      super.facilityId,
      super.nonRecoverableError,
      super.physicalCount,
      super.productVariantId,
      super.referenceId,
      super.referenceIdType,
      super.rowVersion,
      super.tenantId,
      this.additionalFields});
}

@MappableClass(ignoreNull: true, discriminatorValue: MappableClass.useAsDefault)
class StockReconciliationAdditionalFields extends AdditionalFields
    with StockReconciliationAdditionalFieldsMappable {
  StockReconciliationAdditionalFields({
    super.schema = 'StockReconciliation',
    required super.version,
    super.fields,
  });
}
