import 'package:travel_app_flutter/core/api/api_helper.dart';
import 'package:travel_app_flutter/core/api/api_url.dart';
import 'package:travel_app_flutter/core/errors/exception.dart';
import 'package:travel_app_flutter/features/home/data/model/popular_model.dart';

abstract class PopularRemoteDatasource {
  Future<PopularModel> getPopular();
}

class PopularRemoteDatasourceImpl implements PopularRemoteDatasource {
  final url = '${ApiUrl.baseUrl}destination/popular/';
  final ApiHelper _apiHelper;

  PopularRemoteDatasourceImpl(this._apiHelper);

  @override
  Future<PopularModel> getPopular() async {
    try {
      final response = await _apiHelper.execute(method: Method.get, url: url);

      return PopularModel.fromJson(response);
    } catch (e) {
      print('+++++++++++++++++++ $e');
      throw ServerException();
    }
  }
}
