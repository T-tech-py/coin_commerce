import 'package:coin_commerce/core/domain/entities/category.dart';
import 'package:either_dart/either.dart';
import '../../../../core/domain/entities/failure_result.dart';
import '../../../../core/domain/usecase/usecase.dart';
import '../repository/product_repository.dart';

class GetCategoryUseCase with UseCase<List<CategoryEntity>, Null> {
  final ProductRepository _repository;

  GetCategoryUseCase({
    required ProductRepository feedRepository,
  }) : _repository = feedRepository;

  @override
  Future<Either<FailureResult, List<CategoryEntity>>> call(Null params) {
    return _repository.getCategory();
  }
}
