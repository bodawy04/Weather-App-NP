import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../Core/Utils/service_locator.dart';
import '../../../Data/Database/SQLite/local_database.dart';
import '../../../Data/Remote Data/models/weather_model.dart';
import '../../manager/home_provider.dart';
import 'home_details_box.dart';
import 'home_main_info.dart';

class HomeViewBody extends StatelessWidget {
  final WeatherModel element;
  final SQLDB sqldb = SQLDB();

  HomeViewBody(this.element, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () async {
            await sqldb.insertData(
                element.name!,
                element.main!.temp!.toInt(),
                element.weather![0].main!,
                element.weather![0].description!,
                element.main!.humidity!,
                element.sys!.sunrise!.toString(),
                element.sys!.sunset!.toString(),
                element.main!.pressure!,
                element.wind!.speed!.toInt());
            getIt.get<HomeProvider>().resetWeatherModel();
            // Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
            size: 20.sp,
          ),
        ),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            "Assets/images/background.jpg",
            fit: BoxFit.fill,
          ),
          ListView(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            children: [
              SizedBox(
                height: 40.h,
              ),
              HomeMainInfo(element),
              SizedBox(
                height: 20.h,
              ),
              HomeDetailsBox(element)
            ],
          ),
        ],
      ),
    );
  }
}
