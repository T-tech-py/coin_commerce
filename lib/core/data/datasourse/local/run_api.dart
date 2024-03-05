
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

import '../../../data/model/api_exception.dart';
import '../../../ui/app_enums.dart';
import '../../../utils/session_manager.dart';
import '../../model/app_exception.dart';

class NetworkHandler{
  // The Rest Client for the project is Dio
  final Dio _dio = Dio();
  //Session User
  final SessionManager _sessionUser;
  // Setting the request timeout seconds
  static const httpTimeoutDuration = 45;
  // Setting the response for network timeouts
  final kTimeoutResponse = Response(
      data: {"message": "Connection Timeout"},
      statusCode: 508,
      requestOptions:
      RequestOptions(path: 'Error occurred while connecting to server'));

// NetworkHandler constructor
  NetworkHandler({
        required SessionManager sessionManager,
      }):_sessionUser = sessionManager;


  Future<dynamic> runApi({
    required ApiRequestType type,
    required String url,
    Map<String, dynamic>? body,
    Map<String, String>? headers,
    bool? useToken = true,
  }) async {
    _dio.options.baseUrl = url;
    _dio.options.connectTimeout =  const Duration(seconds: httpTimeoutDuration);
    _dio.options.receiveTimeout = const Duration(seconds: httpTimeoutDuration);



    final token = _sessionUser.currentUser?.token;
    print('token: $token');

    // Setting header parameters
    var kHeader = useToken!?{
      'Content-Type': 'application/json',
      //'Accept': 'application/json',
      'cookie': 'jwt=$token',
    }:{'Content-Type': 'application/json',
      'Accept': 'application/json',};

    kHeader.addAll(headers ?? {});

    _dio.options.headers = headers ?? kHeader;

    print('header: ${headers ?? kHeader}}');
    print('Dioheader: ${_dio.options.headers}}');
    print('url: $url');
    print('request: ${body}');

    Response res;

   try {

      switch (type) {
        case ApiRequestType.get:
          res = await _get(url: url, body: body);
          break;
        case ApiRequestType.post:
          res = await _post(url: url, body: body,header: kHeader);
          break;
        case ApiRequestType.put:
          res = await _put(url: url, body: body);
          break;
        case ApiRequestType.patch:
          res = await _patch(url: url, body: body);
          break;
        case ApiRequestType.delete:
          res = await _delete(url: url, body: body);
          break;
        case ApiRequestType.formData:
          res = await _formData(url: url, body: body);
          break;
      }
      _logRequest(method: _dio.options.method, url: url, response: res,
          headers: res.headers);
      print(res);
      return await _processResponse(res);
    } on DioException catch (error) {
     print("error: $error");
      return error.response == null? networkErrorResponse(error.type): _processResponse(error.response!);
    } catch (e) {
     print("error: $e");
      return networkErrorResponse(e);
    }
  }

  Future<Response> _get({required String url, body}) async {
    return await _dio.get(url).timeout(const Duration(seconds: httpTimeoutDuration),
        onTimeout: () => kTimeoutResponse);
  }

  Future<Response> _post({required String url, body,header}) async {
    return await _dio.post(url, data:body,).timeout(
        const Duration(seconds: httpTimeoutDuration),
        onTimeout: () => kTimeoutResponse);
  }

  Future<Response> _patch({required String url, body}) async {
    return await _dio.patch(url, data: body).timeout(
        const Duration(seconds: httpTimeoutDuration),
        onTimeout: () => kTimeoutResponse);
  }

  Future<Response> _put({required String url, body}) async {
    return await _dio.put(url, data: body).timeout(
        const Duration(seconds: httpTimeoutDuration),
        onTimeout: () => kTimeoutResponse);
  }

  Future<Response> _delete({required String url, body}) async {
    return await _dio.delete(url, data: body).timeout(
        const Duration(seconds: httpTimeoutDuration),
        onTimeout: () => kTimeoutResponse);
  }

  Future<Response> _formData({required String url, body}) async {
    FormData formData = FormData.fromMap(body);
    return await _dio.post(url, data: formData).timeout(
        const Duration(seconds: httpTimeoutDuration),
        onTimeout: () => kTimeoutResponse);
  }



  Future<dynamic> _processResponse(Response response) async {
    if (response.statusCode! >199 && response.statusCode! < 300  ) {
      final json = response.data;
      return json;
    }
    print(response.statusCode);
    print(response.data['message'],);

      throw ApiException(
        message: response.data['message'],
      );

  }

  _logRequest({
    required String method,
    required String url,
    required Response response,
    required Headers? headers,
    Map? body,
  }) {
     Logger().i(
      '$method, $url \nHEADERS: '
          '$headers \nREQUEST: ${jsonEncode(body ?? '{}')}'
          ' \nRESPONSE CODE: ${response.statusCode}'
          '\nRESPONSE: ${response.data}',
    );
  }
}