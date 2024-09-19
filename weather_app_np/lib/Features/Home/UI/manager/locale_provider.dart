import 'package:flutter/material.dart';

class LocaleProvider with ChangeNotifier {
  String? defaultLocale='en';

  String? changeLocale(String? newLocal){
    defaultLocale=newLocal;
    print("Current locale: $defaultLocale");
    notifyListeners();
    return defaultLocale!;
  }
}
