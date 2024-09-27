import 'package:travel_app_flutter/core/api/api_helper.dart';
import 'package:travel_app_flutter/core/api/api_url.dart';
import 'package:travel_app_flutter/core/errors/exception.dart';
import 'package:travel_app_flutter/features/home/data/model/inspiration_model.dart';

abstract class InspirationRemoteDatasource {
  Future<InspirationModel> getInspirations();
}

class InspirationRemoteDatasourceImpl implements InspirationRemoteDatasource {
  final url = '${ApiUrl.baseUrl}destination/inspiration/';
  final ApiHelper _apiHelper;

  InspirationRemoteDatasourceImpl(this._apiHelper);

  @override
  Future<InspirationModel> getInspirations() async {
    try {
      final response = await _apiHelper.execute(method: Method.get, url: url);

      return InspirationModel.fromJson(response);
    } catch (e) {
      print('+++++++++++++++++++ $e');
      throw ServerException();
    }
  }
}
