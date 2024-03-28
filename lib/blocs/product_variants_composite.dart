// GENERATED using mason_cli
import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:inventory_management/blocs/product_variant.dart';
import 'package:inventory_management/models/entities/product_variant.dart';
import 'package:inventory_management/models/entities/project_resource.dart';
import 'package:new_digit_app/model/dataModel.dart';
import 'package:new_digit_app/repositories/product_variants_repo.dart';
import 'package:new_digit_app/repositories/project_resource_repo.dart';

part 'product_variants_composite.freezed.dart';

typedef ProductVariantCompositeEmitter = Emitter<ProductVariantCompositeState>;

class ProductVariantCompositeBloc
    extends Bloc<ProductVariantCompositeEvent, ProductVariantCompositeState> {
  ProductVariantCompositeBloc(super.initialState) {
    on(_handleLoad);
  }

  final _productVariantBloc =
      ProductVariantBloc(const ProductVariantEmptyState());

  FutureOr<void> _handleLoad(
    ProductVariantCompositeLoadEvent event,
    ProductVariantCompositeEmitter emit,
  ) async {
    emit(const ProductVariantCompositeLoadingState());

    final projectResources = await ProjectResourceRemoteRepository()
        .search(event.query, event.actionMap);

    final variants = await ProductVariantRemoteRepository().search(
      ProductVariantSearchModel(
        id: projectResources.map((e) {
          return e.resource.productVariantId;
        }).toList(),
      ),
      event.actionMap,
    );

    // _productVariantBloc.add(ProductVariantEvent.load(query: event.query));

    if (variants.isEmpty) {
      emit(const ProductVariantCompositeEmptyState());
    } else {
      emit(ProductVariantCompositeFetchedState(productVariants: variants));
    }
  }
}

@freezed
class ProductVariantCompositeEvent with _$ProductVariantCompositeEvent {
  const factory ProductVariantCompositeEvent.load(
          {required ProjectResourceSearchModel query,
          required Map<DataModelType, Map<ApiOperation, String>>? actionMap}) =
      ProductVariantCompositeLoadEvent;
}

@freezed
class ProductVariantCompositeState with _$ProductVariantCompositeState {
  const factory ProductVariantCompositeState.loading() =
      ProductVariantCompositeLoadingState;

  const factory ProductVariantCompositeState.empty() =
      ProductVariantCompositeEmptyState;

  const factory ProductVariantCompositeState.fetched({
    required List<ProductVariantModel> productVariants,
  }) = ProductVariantCompositeFetchedState;
}
