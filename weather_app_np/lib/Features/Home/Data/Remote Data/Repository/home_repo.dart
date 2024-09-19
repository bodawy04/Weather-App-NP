import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../../Core/Errors/failures.dart';
import '../../../../../Core/Utils/api_service.dart';
import '../models/weather_model.dart';

class HomeRepo {
  final ApiService apiService;

  HomeRepo(this.apiService);

  Future<Either<Failure, WeatherModel>> fetchSearchedCity(String country) async {
    try {
      var data = await apiService.get(country: country);
      WeatherModel weatherModel=WeatherModel.fromJson(data);

      return right(weatherModel);
    } catch (e) {
      if (e is DioException) {
        return left(
          ServerFailure.fromDioError(e),
        );
      }
      return left(
        ServerFailure(
          e.toString(),
        ),
      );
    }
  }}