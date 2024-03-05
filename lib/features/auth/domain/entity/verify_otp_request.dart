
class VerifyOtpRequest {
  String token;
  String otp;
  String client;
  String type;

  VerifyOtpRequest({
    required this.token,
    required this.otp,
    required this.client,
    required this.type,
  });


  Map<String, dynamic> toJson() => {
    "token": token,
    "otp": otp,
    "client": client,
    "type": type,
  };
}
