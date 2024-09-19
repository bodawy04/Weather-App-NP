import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:weather_app_np/Core/Utils/service_locator.dart';
import 'package:weather_app_np/Features/Home/UI/manager/locale_provider.dart';
import 'package:weather_app_np/Features/Home/UI/view/screens/home_screen.dart';

import 'generated/l10n.dart';

void main() {
  setupServiceLocator();
  ErrorWidget.builder = (FlutterErrorDetails details) => Container();
  runApp(ChangeNotifierProvider(
      create: (BuildContext context) => getIt.get<LocaleProvider>(),
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) => Consumer<LocaleProvider>(
          builder: (context, locale, child)
          => MaterialApp(
              locale: Locale(locale.defaultLocale!),
              localizationsDelegates: [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: S.delegate.supportedLocales,
              debugShowCheckedModeBanner: false,
              theme: ThemeData(fontFamily: 'Poppins'),
              home: HomeScreen()),
        ));
  }
}
