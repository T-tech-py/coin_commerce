
import 'package:coin_commerce/features/auth/domain/usecase/signup_use_case.dart';
import '../../domain/entity/login_request.dart';
import '../model/login_response_model.dart';

abstract class AuthApi {
  Future<bool> login(LoginRequest data);
  Future<dynamic> signup(SignupParams data);


}