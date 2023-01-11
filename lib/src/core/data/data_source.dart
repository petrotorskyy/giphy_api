import 'dart:async';

import 'package:dio/dio.dart';

import '../api/api_response.dart';
import '../const/const.dart';

class DataSource {
  Future<List<Data>> getData(String request) async {
    var queryParams = {
      'api_key': giphyApiKey,
      'q': request,
    };
    var uri = Uri.https(giphyAuthority, giphyPath, queryParams);
    final dio = Dio();
    dio.interceptors.add(LogInterceptor(
      responseHeader: false,
      responseBody: true,
    ));
    var response = await dio.getUri(uri);
    if (response.statusCode == 200) {
      ApiResponse apiResponse = ApiResponse.fromJson(response.data);
      return apiResponse.data ?? [];
    }
    return [];
  }
}
