import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

import '../../../../../Core/Utils/styles.dart';
import '../../../../../generated/l10n.dart';
import '../../../Data/Remote Data/models/weather_model.dart';

class HomeDetailsBox extends StatelessWidget {
  final WeatherModel weatherModel;

  const HomeDetailsBox(this.weatherModel, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              const Color(0xff1C1B33).withOpacity(0.8),
              const Color(0xff2E335A).withOpacity(0.8)
            ], begin: Alignment.bottomLeft, end: Alignment.topRight),
            borderRadius: BorderRadius.circular(25)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: FaIcon(FontAwesomeIcons.dropletSlash,
                  color: Colors.white, size: 20.sp),
              title: Text(
                S.of(context).humidity,
                style: Styles.textStyle20White,
              ),
              trailing: Text(
                '${NumberFormat('##', Intl.getCurrentLocale() == 'ar' ? 'ar_EG' : Intl.getCurrentLocale()).format(weatherModel.main!.humidity!)}%',
                style: Styles.textStyle20Grey,
              ),
            ),
            ListTile(
                leading: FaIcon(FontAwesomeIcons.sun,
                    color: Colors.yellowAccent, size: 20.sp),
                title: Text(
                  S.of(context).sunrise,
                  style: Styles.textStyle20White,
                ),
                trailing: Text(
                  DateFormat('HH:mm').format(
                      DateTime.fromMillisecondsSinceEpoch(
                          weatherModel.sys!.sunrise! * 1000)),
                  style: Styles.textStyle20Grey,
                )),
            ListTile(
              leading: FaIcon(FontAwesomeIcons.cloudSun,
                  color: Colors.grey, size: 20.sp),
              title: Text(
                S.of(context).sunset,
                style: Styles.textStyle20White,
              ),
              trailing: Text(
                DateFormat('HH:mm').format(DateTime.fromMillisecondsSinceEpoch(
                    weatherModel.sys!.sunset! * 1000)),
                style: Styles.textStyle20Grey,
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.compare_arrows,
                color: Colors.white,
                size: 20.sp,
              ),
              title: Text(
                S.of(context).pressure,
                style: Styles.textStyle20White,
              ),
              trailing: Text(
                '${NumberFormat('##', Intl.getCurrentLocale() == 'ar' ? 'ar_EG' : Intl.getCurrentLocale()).format(weatherModel.main!.pressure!)} mb',
                style: Styles.textStyle20Grey,
              ),
            ),
            ListTile(
                leading: FaIcon(FontAwesomeIcons.wind,
                    color: Colors.white, size: 20.sp),
                title: Text(
                  S.of(context).wind,
                  style: Styles.textStyle20White,
                ),
                trailing: Text(
                  '${NumberFormat('##', Intl.getCurrentLocale() == 'ar' ? 'ar_EG' : Intl.getCurrentLocale()).format(weatherModel.wind!.speed!)} ${S.of(context).speedMeasure}',
                  style: Styles.textStyle20Grey,
                )),
          ],
        ),
      ),
    );
  }
}
