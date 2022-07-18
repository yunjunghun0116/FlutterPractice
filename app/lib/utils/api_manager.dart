import 'package:app/constants/constants.dart';
import 'package:app/utils/view_utils.dart';
import 'package:dio/dio.dart';

import '../models/base_model.dart';

class ApiManager {

  static Future<dynamic> getResponse(url, {headers, parameters, isBlock = true}) async {
    try {
      if(isBlock) {
        await ViewUtils.showLoading();
      }
      final response = await Dio().get(
        url,
        options: Options(
          headers: headers,
        ),
        queryParameters: parameters,
      );
      ViewUtils.hideLoading();
      return responseCheck(response);
    } catch (e) {
      await ViewUtils.hideLoading();
      ViewUtils.showAlertDialog(content: kNetworkErrMsg+'$e');
      return null;
    }
  }

  static Future<dynamic> postResponse(url, {headers, parameters, isBlock = true}) async {
    ViewUtils.showLoading();
    try {
      if(isBlock) {
        await ViewUtils.showLoading();
      }
      final response = await Dio().post(
        url,
        options: Options(
          headers: headers,
        ),
        queryParameters: parameters,
      );
      ViewUtils.hideLoading();
      return responseCheck(response);
    } catch (e) {
      await ViewUtils.hideLoading();
      ViewUtils.showAlertDialog(content: kNetworkErrMsg+'$e');
      return null;
    }
  }

  static Future<dynamic> responseCheck(response) async {
    final model = BaseModel.fromJson(response.data);
    switch (model.status) {
      case 'success':
        return response;
      default:
        // TODO: 에러 팝업 추가
        break;
    }
  }
}
