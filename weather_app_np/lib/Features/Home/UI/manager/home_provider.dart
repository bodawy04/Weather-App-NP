import 'package:flutter/material.dart';
import 'package:dartz/dartz.dart';
import '../../../../Core/Errors/failures.dart';
import '../../Data/Remote Data/Repository/home_repo.dart';
import '../../Data/Remote Data/models/weather_model.dart';

class HomeProvider with ChangeNotifier {
  final HomeRepo homeRepo;

  HomeProvider(this.homeRepo);

  WeatherModel? _weatherModel;
  WeatherModel? get weatherModel => _weatherModel;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  Future<void> fetchSearchedCity(String country) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    Either<Failure, WeatherModel> result = await homeRepo.fetchSearchedCity(country);

    result.fold(
          (failure) {
        _errorMessage = failure.errMessage!;
      },
          (weather) {
        _weatherModel = weather;
      },
    );

    _isLoading = false;
    notifyListeners();
  }

  void resetWeatherModel() {
    _weatherModel = null;
    _errorMessage = null;
    notifyListeners();
  }
}
