
import 'package:coin_commerce/features/product/domain/entity/product_entity.dart';
import 'package:either_dart/either.dart';
import '../../../../core/domain/entities/failure_result.dart';
import '../../../../core/domain/usecase/usecase.dart';
import '../repository/product_repository.dart';

class GetProductUseCase with UseCase<List<ProductEntity>,
    String > {
  final ProductRepository _repository;

  GetProductUseCase({
    required ProductRepository feedRepository,
  }) : _repository = feedRepository;

  @override
  Future<Either<FailureResult, List<ProductEntity>>> call(String params) {
    return _repository.getProducts(params);
  }
}

class SignupParams{
  final String email;
  final String password;
  final String fulname;

  SignupParams( {required this.email,required this.password,required this.fulname,});

  Map<String,dynamic> toJson()=> {
    "email":email,
    "password":password,
    "name":{
      "firstname":fulname.split(" ").first,
      "lastname":fulname.split(" ").first
    }

  };
}