import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:weather_app_np/Features/Home/UI/manager/home_provider.dart';
import '../../Features/Home/Data/Remote Data/Repository/home_repo.dart';
import '../../Features/Home/UI/manager/locale_provider.dart';
import 'api_service.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<ApiService>(ApiService(Dio()));
  getIt.registerSingleton<HomeRepo>(HomeRepo(getIt.get<ApiService>()));
  getIt.registerSingleton<HomeProvider>(HomeProvider(HomeRepo(getIt.get<ApiService>())));
  getIt.registerSingleton<LocaleProvider>(LocaleProvider());
}