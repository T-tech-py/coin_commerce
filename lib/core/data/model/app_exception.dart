import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'api_exception.dart';

const String kHandshakeText = 'Connection Timed out.\nPlease try again';
const String kSocketExceptionText = 'No Internet Connection \nPlease check you network settings';

final kTimeoutResponse = Response(
    data: {"message": 'Connection timeout'},
    statusCode: 509,
    requestOptions: RequestOptions(path: ''));

final kPlatformExceptionResponse = Response(
    data: {"message": 'An error occurred'},
    statusCode: 505,
    requestOptions: RequestOptions(path: ''));
final kHandshakeExceptionResponse = Response(
    data: {"message": kHandshakeText},
    statusCode: 506,
    requestOptions: RequestOptions(path: ''));
final kSocketExceptionResponse = Response(
    data: {"message": kSocketExceptionText},
    statusCode: 508,
    requestOptions: RequestOptions(path: ''));
final kResponse = Response(
    data: {"message": kSocketExceptionText},
    statusCode: 508,
    requestOptions: RequestOptions(path: ''));


Response networkErrorResponse(error) {
  print("Errroo: $error");
  if (error == HandshakeException) {
    return kHandshakeExceptionResponse;
  } if (error == SocketException) {
    return kSocketExceptionResponse;
  }  else if (error == DioExceptionType.connectionError) {
    throw ApiException(message: kSocketExceptionText);
  }  else if (error == DioExceptionType.connectionTimeout) {
    throw ApiException(message: 'Connection timeout');
  } else if (error == DioExceptionType.badCertificate) {
    throw ApiException(message: 'Unauthorized user');
  } else if (error == PlatformException) {
    return kPlatformExceptionResponse;
  } else if (error is DioException) {
    if (kDebugMode) {
      // print(
      //     'DioException type: ${error.error}\n${error.type.name}\n${error.message}\n${error.response?.statusCode}\n${error.response?.statusMessage}');
    }
    return error.response!;
  }
  return  Response(
      data: {"message": error},
      statusCode: 508,
      requestOptions: RequestOptions(path: ''));
}