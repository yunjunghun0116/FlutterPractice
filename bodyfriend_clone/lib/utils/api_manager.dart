import 'dart:developer';
import 'package:dio/dio.dart';

class APIManager {
  Future<Response?> getResponse(String path,
      {Map<String, dynamic>? headers, Map<String, dynamic>? parameters}) async {
    try {
      Response response = await Dio().get(
        path,
        options: Options(
          headers: headers,
        ),
        queryParameters: parameters,
      );
      return responseCheck(response);
    } catch (e) {
      log('Error : $e');
      return null;
    }
  }

  Future<Response?> postResponse(String path,
      {Map<String, dynamic>? parameters}) async {
    try {
      Response response = await Dio().post(
        path,
        data: parameters,
      );
      return responseCheck(response);
    } catch (e) {
      log('Error : $e');
      return null;
    }
  }

  Response? responseCheck(Response response) {
    if (response.statusCode == 200) {
      return response;
    }
    log('Error : ${response.statusCode}, Msg : ${response.statusMessage}');
    return null;
  }
}
