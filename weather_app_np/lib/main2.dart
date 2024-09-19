  import 'package:intl/intl.dart';
import 'package:dio/dio.dart';
import 'package:translator/translator.dart';

bool check(){
  print("Check");
  return false;
}
bool et2kd(){
  print("et2kd");
  return true;
}

void main() {
  // setupServiceLocator();
  // sc("cairo").then((onValue)=>print(onValue.values));
  //
  //   int timestamp = 1726458014;
  //
  //   DateTime.now();
  //   // Convert Unix timestamp (seconds) to DateTime
  //   DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
  //
  //   // Format to only hours:minutes:seconds
  //   String formattedTime = DateFormat('HH:mm:ss').format(dateTime);

    // Print the result
    // print(DateFormat('EE, h:m a').format(DateTime.now()));  // Output: 14:46:54

  // print(et2kd()||check());

  // double number = 1234567.89;
  //
  // // Format number in Arabic locale
  // var formattedNumber = NumberFormat.currency(locale: 'ar',symbol: "ج.م");
  //
  // print('Formatted Currency (Arabic): ${formattedNumber.format(number)}');
  // print("١٧٨٩");
  // print(NumberFormat('#.##', 'ar_EG').format(number));

  final translator = GoogleTranslator(client: ClientType.extensionGT);

  final input = "Broken Clouds";

  translator.translate(input, from: 'ru', to: 'ar').then(print);
}


