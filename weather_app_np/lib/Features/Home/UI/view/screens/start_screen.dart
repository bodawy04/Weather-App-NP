import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app_np/Core/Utils/api_service.dart';
import 'package:weather_app_np/Core/Utils/service_locator.dart';
import 'package:weather_app_np/Features/Home/Data/Remote%20Data/models/weather_model.dart';
import 'package:weather_app_np/Features/Home/UI/view/screens/home_screen.dart';
import 'package:weather_app_np/Features/Home/UI/view/widgets/my_location_weather.dart';

import '../../../../../Core/Utils/location_service.dart';
import '../../../../../Core/Utils/styles.dart';
import '../../../../../generated/l10n.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        alignment: Alignment.center,
        children: [
          Image.asset(
            "Assets/images/background.jpg",
            fit: BoxFit.fill,
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                      const Color(0xff1C1B33).withOpacity(0.8),
                      const Color(0xff2E335A).withOpacity(0.8)
                    ], begin: Alignment.bottomLeft, end: Alignment.topRight),
                    borderRadius: BorderRadius.circular(12)),
                padding: EdgeInsets.all(5.sp),
                child: MaterialButton(
                    onPressed: () async {
                      WeatherModel? result;
                      await LocationService()
                          .getCurrentLocation()
                          .then((onValue) async {
                        await getIt
                            .get<ApiService>()
                            .getByLocation(
                                longitude: onValue.longitude.toString(),
                                latitude: onValue.latitude.toString())
                            .then((onValue) async {
                          result = WeatherModel.fromJson(onValue);
                        });
                      });
                      // ignore: use_build_context_synchronously
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => MyLocationWeather(result!)));
                    },
                    child: Text(
                      S.of(context).getCurrentCity,
                      style: Styles.textStyle20White,
                    )),
              ),
              Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                      const Color(0xff1C1B33).withOpacity(0.8),
                      const Color(0xff2E335A).withOpacity(0.8)
                    ], begin: Alignment.bottomLeft, end: Alignment.topRight),
                    borderRadius: BorderRadius.circular(12)),
                padding: EdgeInsets.all(5.sp),
                child: MaterialButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => HomeScreen()));
                    },
                    child: Text(
                      S.of(context).searchCity,
                      style: Styles.textStyle20White,
                    )),
              )
            ],
          )
        ],
      ),
    );
  }
}
