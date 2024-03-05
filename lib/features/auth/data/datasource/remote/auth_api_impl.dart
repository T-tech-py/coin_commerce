
import 'package:coin_commerce/core/data/datasourse/local/run_api.dart';
import 'package:coin_commerce/core/ui/app_enums.dart';
import 'package:coin_commerce/features/auth/domain/usecase/signup_use_case.dart';
import 'package:logger/logger.dart';

import '../../../../../core/data/model/api_exception.dart';
import '../../../../../core/domain/entities/session_user.dart';
import '../../../domain/entity/login_request.dart';
import '../../model/login_response_model.dart';
import 'auth_api.dart';

class AuthApiImpl extends AuthApi {
  final NetworkHandler _client;
  final Logger? _logger;

  AuthApiImpl({
    Logger? logger,
    required NetworkHandler restClient,

  })  :
        _client = restClient,
        _logger = logger;

  @override
  Future<bool> login(LoginRequest data) async {
    final response = await _client.runApi(
      url: 'https://fakestoreapi.com/auth/login',
      type: ApiRequestType.post,
      body:data.toJson(),
    );
    try {
      return  true;
    } catch (ex,st) {
      //_logger?.e(ex);
      print(st);
      throw ApiException(message: ex.toString());
    }
  }

  @override
  Future signup(SignupParams data)async {
    final response = await _client.runApi(
        url: 'https://fakestoreapi.com/users',
        body:data.toJson(),
        type: ApiRequestType.post,
        useToken: false
    );
    try {
      return true;
    } catch (ex,st) {
      _logger?.e(ex);
      print(ex);
      throw ApiException(
          message: ex.toString()
      );
    }
  }



}