import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../../../../../Core/Utils/styles.dart';
import '../../../Data/Remote Data/models/weather_model.dart';

class HomeMainInfo extends StatelessWidget {
  final WeatherModel weatherModel;

  const HomeMainInfo(this.weatherModel, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          weatherModel.name!,
          style: Styles.textStyle40,
        ),
        RichText(
          text: TextSpan(children: [
            TextSpan(
                text: NumberFormat(
                        '##',
                        Intl.getCurrentLocale() == 'ar'
                            ? 'ar_EG'
                            : Intl.getCurrentLocale())
                    .format((weatherModel.main!.temp! - 273.15).round()),
                style: Styles.textStyleDegree),
            TextSpan(
                text: '°',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 50.sp,
                    fontWeight: FontWeight.w300,
                    fontFeatures: const [FontFeature.superscripts()])),
          ]),
        ),
        Text(weatherModel.weather![0].main!, style: Styles.textStyle20Grey),
        Text(
            weatherModel.weather![0].description!
                    .substring(0, 1)
                    .toUpperCase() +
                weatherModel.weather![0].description!.substring(1),
            style: Styles.textStyle20White),
        Text(DateFormat('EE, hh:mm a').format(DateTime.now()),
            style: Styles.textStyle20White),
        Image.network(
          "https://openweathermap.org/img/wn/${weatherModel.weather![0].icon!}@2x.png",
          width: 100,
          height: 100,
        )
      ],
    );
  }
}
