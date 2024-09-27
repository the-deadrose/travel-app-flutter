import 'package:travel_app_flutter/core/api/api_helper.dart';
import 'package:travel_app_flutter/core/api/api_url.dart';
import 'package:travel_app_flutter/core/errors/exception.dart';
import 'package:travel_app_flutter/features/detail/data/model/detail_model.dart';

abstract class DetailRemoteDatasource {
  Future<DetailModel> getDetail(int id);
}

class DetailRemoteDatasourceImpl implements DetailRemoteDatasource {
  final url = '${ApiUrl.baseUrl}destination/detail/';
  final ApiHelper _apiHelper;

  DetailRemoteDatasourceImpl(this._apiHelper);

  @override
  Future<DetailModel> getDetail(int id) async {
    try {
      final response =
          await _apiHelper.execute(method: Method.get, url: '$url$id/');

      return DetailModel.fromJson(response);
    } catch (e) {
      print('--------------------- $e');
      throw ServerException();
    }
  }
}
