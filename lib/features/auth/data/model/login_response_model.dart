
import '../../domain/entity/login_response.dart';

class LoginResponseModel extends LoginResponse{
  LoginResponseModel({
     required super.data,
     required super.message,
     required super.success,});

  factory LoginResponseModel.fromJson(Map<String, dynamic> json)=>
      LoginResponseModel(
        data: Data.fromJson(json["data"]),
          message: json["message"],
          success: json["success"],
      );
}