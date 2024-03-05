
class LoginResponse {
  bool success;
  String message;
  Data data;

  LoginResponse({
    required this.success,
    required this.message,
    required this.data,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
    success: json["success"],
    message: json["message"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "data": data.toJson(),
  };
}

class Data {
  User? result;
  String? token;

  Data({
     this.result,
    this.token,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    result: User.fromJson(json["result"]),
    token: json["token"],
  );

  Map<String, dynamic> toJson() => {
    "result": result?.toJson(),
    "token": token,
  };
}

class User {
  String id;
  String agentId;
  String agencyId;
  String email;
  String username;
  String role;

  User({
    required this.id,
    required this.agentId,
    required this.agencyId,
    required this.email,
    required this.username,
    required this.role,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    agentId: json["agentId"],
    agencyId: json["agencyId"],
    email: json["email"],
    username: json["username"],
    role: json["role"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "agentId": agentId,
    "email": email,
    "username": username,
    "role": role,
  };

  String shortName(){
    return '${username[0].toUpperCase()}${username[1].toUpperCase()}';
  }
}
