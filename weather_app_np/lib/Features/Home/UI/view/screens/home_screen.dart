import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:weather_app_np/Core/Utils/service_locator.dart';
import 'package:weather_app_np/Core/Utils/styles.dart';
import 'package:weather_app_np/Features/Home/UI/manager/home_provider.dart';
import 'package:weather_app_np/Features/Home/UI/view/screens/search_screen.dart';
import '../../manager/locale_provider.dart';
import '../widgets/home_screen_body.dart';
import '../widgets/search_box.dart';

class HomeScreen extends StatelessWidget {
  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext mainContext) {
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
                return home.isLoading
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : home.errorMessage != null
                        ? Center(
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
                                          const Color(0xff1C1B33)
                                              .withOpacity(0.8),
                                          const Color(0xff2E335A)
                                              .withOpacity(0.8)
                                        ],
                                        begin: Alignment.bottomLeft,
                                        end: Alignment.topRight),
                                    borderRadius: BorderRadius.circular(12)),
                                padding: EdgeInsets.all(5.sp),
                                child: MaterialButton(
                                    onPressed: () {
                                      getIt
                                          .get<HomeProvider>()
                                          .resetWeatherModel();
                                    },
                                    child: Text(
                                      "Go Back",
                                      style: Styles.textStyle20White,
                                    )),
                              )
                            ],
                          ))
                        : home.weatherModel != null
                            ? HomeViewBody(home.weatherModel!)
                            : SearchScreen();
              }),
            ],
          )),
    );
  }
}
