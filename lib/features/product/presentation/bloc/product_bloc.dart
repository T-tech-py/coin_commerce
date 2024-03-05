import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:coin_commerce/features/product/domain/entity/product_entity.dart';
import 'package:meta/meta.dart';

import '../../../../core/domain/entities/category.dart';
import '../../domain/usecase/get_categories_use_case.dart';
import '../../domain/usecase/get_product_use_case.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final GetCategoryUseCase _categoryUseCase;
  final GetProductUseCase _productUseCase;
  ProductBloc(this._categoryUseCase,this._productUseCase) : super(ProductInitial()) {
    on<GetCategoryEvent>(_getCategory);
    on<GetProductEvent>(_getProduct);
  }

  Future<void> _getCategory(GetCategoryEvent event,
      Emitter<ProductState> emit,) async {
    emit(
      ProductLoadingState(),
    );
    await _categoryUseCase(null).then(
          (value) =>
          value.fold(
                (failure) =>
                emit(
                  ProductErrorState(message: failure.message),
                ), (success) =>
              emit(
                ProductSuccessState(categories: success),
              ),
          ),
    );
  }

  Future<void> _getProduct(GetProductEvent event,
      Emitter<ProductState> emit,) async {
    emit(
      ProductLoadingState(),
    );
    await _productUseCase(event.name).then(
          (value) =>
          value.fold(
                (failure) =>
                emit(
                  ProductErrorState(message: failure.message),
                ), (success) =>
              emit(
                ProductSuccessState(
                  products: success
                ),
              ),
          ),
    );
  }
}
