import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:weather_app_np/Core/Utils/service_locator.dart';
import 'package:weather_app_np/Core/Utils/styles.dart';
import 'package:weather_app_np/Features/Home/UI/manager/home_provider.dart';
import 'package:weather_app_np/Features/Home/UI/view/screens/search_screen.dart';

import '../widgets/home_screen_body.dart';

class HomeScreen extends StatelessWidget {
  final TextEditingController textEditingController = TextEditingController();

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider(
          create: (context) => getIt.get<HomeProvider>(),
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image.asset(
                "Assets/images/background.jpg",
                fit: BoxFit.fill,
              ),
              Consumer<HomeProvider>(builder: (context, home, child) {
                if (home.isLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (home.errorMessage != null) {
                  return Center(
                      child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        home.errorMessage!,
                        style: Styles.textStyle20Black,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                colors: [
                                  const Color(0xff1C1B33).withOpacity(0.8),
                                  const Color(0xff2E335A).withOpacity(0.8)
                                ],
                                begin: Alignment.bottomLeft,
                                end: Alignment.topRight),
                            borderRadius: BorderRadius.circular(12)),
                        padding: EdgeInsets.all(5.sp),
                        child: MaterialButton(
                            onPressed: () {
                              getIt.get<HomeProvider>().resetWeatherModel();
                            },
                            child: Text(
                              "Go Back",
                              style: Styles.textStyle20White,
                            )),
                      )
                    ],
                  ));
                } else if (home.weatherModel != null) {
                  return HomeViewBody(home.weatherModel!);
                } else {
                  return const SearchScreen();
                }
              }),
            ],
          )),
    );
  }
}
