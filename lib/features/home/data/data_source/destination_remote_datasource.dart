import 'package:travel_app_flutter/core/api/api_helper.dart';
import 'package:travel_app_flutter/core/api/api_url.dart';
import 'package:travel_app_flutter/core/errors/exception.dart';
import 'package:travel_app_flutter/features/home/data/model/destination_model.dart';

abstract class DestinationRemoteDatasource {
  Future<DestinationModel> getDestination();
}

class DestinationRemoteDatasourceImpl implements DestinationRemoteDatasource {
  final url = '${ApiUrl.baseUrl}destination/list/';
  final ApiHelper _apiHelper;

  DestinationRemoteDatasourceImpl(this._apiHelper);

  @override
  Future<DestinationModel> getDestination() async {
    try {
      final response = await _apiHelper.execute(method: Method.get, url: url);

      return DestinationModel.fromJson(response);
    } catch (e) {
      print('--------------------- $e');
      throw ServerException();
    }
  }
}
