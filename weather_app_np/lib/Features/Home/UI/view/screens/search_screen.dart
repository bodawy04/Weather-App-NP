import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:weather_app_np/Features/Home/Data/Database/SQLite/local_database.dart';
import 'package:weather_app_np/Features/Home/UI/manager/home_provider.dart';

import '../../../../../Core/Utils/service_locator.dart';
import '../../../../../Core/Utils/styles.dart';
import '../../manager/locale_provider.dart';
import '../widgets/search_box.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        actions: [
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
                  getIt.get<LocaleProvider>().changeLocale("en");
                },
                child: Text(
                  "EN",
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
                  getIt.get<LocaleProvider>().changeLocale("ar");
                },
                child: Text(
                  "AR",
                  style: Styles.textStyle20White,
                )),
          )
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  "Assets/images/background.jpg",
                ),
                fit: BoxFit.fill)),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SearchBox(
                    home: getIt.get<HomeProvider>(),
                    textEditingController: TextEditingController(),
                  ),
                  FutureBuilder(
                      future: SQLDB().readData(),
                      builder: (context, snapshots) => Padding(
                            padding: EdgeInsets.symmetric(horizontal: 40.w),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.5),
                                  borderRadius: BorderRadius.circular(12)),
                              child: ListView.builder(
                                  padding: const EdgeInsets.all(0),
                                  itemCount: snapshots.data!.length,
                                  itemBuilder: (context, i) => ListTile(
                                        title: Text(
                                          snapshots.data![i]['City Name'],
                                          style: Styles.textStyle20Black,
                                        ),
                                        subtitle: Text(
                                          snapshots.data![i]['Weather Status'],
                                          style: Styles.textStyle20Grey
                                              .copyWith(fontSize: 16.sp),
                                        ),
                                        trailing: Text(
                                          '${NumberFormat('##', Intl.getCurrentLocale() == 'ar' ? 'ar_EG' : Intl.getCurrentLocale()).format(((snapshots.data![i]['Weather Degree'] - 273.15).floor()))}°',
                                          style: Styles.textStyle20White,
                                        ),
                                      ),
                                  shrinkWrap: true),
                            ),
                          ))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
