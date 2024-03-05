import 'package:either_dart/either.dart';
import '../../../../core/domain/entities/failure_result.dart';
import '../entity/login_request.dart';
import '../entity/login_response.dart';
import '../usecase/signup_use_case.dart';

abstract class AuthRepository{

  Future<Either<FailureResult, bool>> login(LoginRequest data);
  Future<Either<FailureResult, bool>> signup(
      SignupParams data);
}