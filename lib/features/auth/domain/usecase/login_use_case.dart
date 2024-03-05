import 'package:either_dart/either.dart';
import '../../../../core/domain/entities/failure_result.dart';
import '../../../../core/domain/usecase/usecase.dart';
import '../entity/login_request.dart';
import '../entity/login_response.dart';
import '../repository/auth_repository.dart';

class LoginUseCase with UseCase<bool, LoginRequest> {
  final AuthRepository _repository;

  LoginUseCase({
    required AuthRepository feedRepository,
  }) : _repository = feedRepository;

  @override
  Future<Either<FailureResult, bool>> call(LoginRequest params) {
    return _repository.login(params);
  }
}
