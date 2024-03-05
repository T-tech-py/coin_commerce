part of 'product_bloc.dart';

@immutable
abstract class ProductEvent {}

class GetCategoryEvent extends ProductEvent{}
class GetProductEvent extends ProductEvent{
  final String name;
  GetProductEvent({required this.name});
}