import 'package:flutter/material.dart';

class LocaleProvider with ChangeNotifier {
  String? defaultLocale = 'en';

  String? changeLocale(String? newLocal) {
    defaultLocale = newLocal;
    notifyListeners();
    return defaultLocale!;
  }
}
