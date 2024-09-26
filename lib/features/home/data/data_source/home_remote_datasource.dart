import 'package:travel_app_flutter/core/api/api_helper.dart';
import 'package:travel_app_flutter/core/api/api_url.dart';
import 'package:travel_app_flutter/core/errors/exception.dart';
import 'package:travel_app_flutter/features/home/data/model/destination_model.dart';

sealed class HomeRemoteDatasource {
  Future<DestinationModel> getHome();
}

class HomeRemoteDatasourceImpl implements HomeRemoteDatasource {
  final url = '${ApiUrl.baseUrl}destination/list/';
  final ApiHelper _apiHelper;

  HomeRemoteDatasourceImpl(this._apiHelper);

  @override
  Future<DestinationModel> getHome() async {
    try {
      final response = await _apiHelper.execute(method: Method.get, url: url);

      return DestinationModel.fromJson(response);
    } catch (e) {
      throw ServerException();
    }
  }
}
