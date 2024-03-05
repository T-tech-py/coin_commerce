
import 'package:either_dart/either.dart';
import '../../../../core/domain/entities/failure_result.dart';
import '../../../../core/domain/usecase/usecase.dart';
import '../repository/auth_repository.dart';

class SignupUseCase with UseCase<bool,
    SignupParams > {
  final AuthRepository _repository;

  SignupUseCase({
    required AuthRepository feedRepository,
  }) : _repository = feedRepository;

  @override
  Future<Either<FailureResult, bool>> call(SignupParams params) {
    return _repository.signup(params);
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