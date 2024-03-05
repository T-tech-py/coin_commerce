import 'package:coin_commerce/features/auth/domain/usecase/signup_use_case.dart';
import 'package:either_dart/src/either.dart';import 'package:logger/logger.dart';

import '../../../../core/data/model/api_exception.dart';
import '../../../../core/domain/entities/failure_result.dart';
import '../../domain/entity/login_request.dart';
import '../../domain/entity/login_response.dart';
import '../../domain/repository/auth_repository.dart';
import '../datasource/auth_api.dart';

class AuthRepositoryImpl extends AuthRepository{
  AuthRepositoryImpl({
    required AuthApi authApi,
    Logger? logger,
  })  : _api = authApi,
        _logger = logger;
  final AuthApi _api;
  final Logger? _logger;

  @override
  Future<Either<FailureResult, bool>> login(LoginRequest data)async {
    try {
      final response = await _api.login(data);
      return Right(true);
    } on ApiException catch (ex) {
      return Left(
        FailureResult(
          title:  ex.message.toString(),
          message: ex.message.toString(),
        ),
      );
    } catch (ex,st) {
      _logger?.e(ex);
      print(st);
      return Left(
        FailureResult(
          title: 'Something went wrong',
          message: ex.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<FailureResult, bool>>
  signup(SignupParams data) async{
    try {
      final response = await _api.signup(data);
      return Right(response);
    } on ApiException catch (ex) {
      return Left(
        FailureResult(
          title:  ex.message.toString(),
          message: ex.message.toString(),
        ),
      );
    } catch (ex,st) {
      _logger?.e(ex);
      return Left(
        FailureResult(
          title: 'Something went wrong',
          message: ex.toString(),
        ),
      );
    }
  }

}