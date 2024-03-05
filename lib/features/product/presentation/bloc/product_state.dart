part of 'product_bloc.dart';

@immutable
abstract class ProductState {}

class ProductInitial extends ProductState {}


class ProductLoadingState extends ProductState {}


class ProductErrorState extends ProductState {
  final String message;
  ProductErrorState({required this.message});
}

@immutable
class ProductSuccessState extends ProductState {
  final List<CategoryEntity>? categories;
  final List<ProductEntity>? products;
  ProductSuccessState({this.categories,this.products});

}