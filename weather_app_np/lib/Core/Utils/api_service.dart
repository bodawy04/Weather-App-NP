import 'package:dio/dio.dart';

class ApiService {
  final _baseUrl = 'https://api.openweathermap.org/data/2.5/weather?';

  final Dio _dio;

  ApiService(this._dio);

  Future<Map<String, dynamic>> get({required String country}) async {
    // print(country);
    var response = await _dio.get('${_baseUrl}q=$country&${_apiKey}');
    return response.data;
  }
}