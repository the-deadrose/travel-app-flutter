import 'package:travel_app_flutter/core/api/api_exception.dart';
import 'package:travel_app_flutter/core/api/api_helper.dart';
import 'package:travel_app_flutter/core/api/api_url.dart';
import 'package:travel_app_flutter/core/errors/exception.dart';
import 'package:travel_app_flutter/features/welcome/data/model/welcome_model.dart';

sealed class WelcomeRemoteDatasource {
  Future<WelcomeModel> getWelcome();
}

class WelcomeRemoteDatasourceImpl implements WelcomeRemoteDatasource {
  final url = '${ApiUrl.baseUrl}welcome-destinations/';
  final ApiHelper _apiHelper;

  WelcomeRemoteDatasourceImpl(this._apiHelper);

  @override
  Future<WelcomeModel> getWelcome() async {
    print('getWelcome');
    try {
      final response = await _apiHelper.execute(method: Method.get, url: url);

      print('response is $response');

      return WelcomeModel.fromJson(response);

      // if (response == 200) {
      //   print('response');
      // final WelcomeModel welcomeList = [];
      // response['data'].forEach((v) {
      //   welcomeList.add(WelcomeModel.fromJson(v));
      // });
      // return welcomeList;

      // return response as WelcomeModel;
      // } else {
      //   throw FetchDataException(response['message']);
      // }
    } catch (e) {
      print('errorrr');
      print('errrrrrrrrrrrrrrrrrrrrrr $e');
      throw ServerException();
    }
  }
}
