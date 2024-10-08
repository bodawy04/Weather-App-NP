import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants.dart';

abstract class Styles {
  static final textStyle40 = TextStyle(
    fontWeight: FontWeight.w500,
    color: textPrimColor,
    fontSize: 40.sp,
  );
  static final textStyleDegree = TextStyle(
    fontWeight: FontWeight.w400,
    color: textPrimColor,
    fontSize: 46.sp,
    letterSpacing: 2.sp,
  );
  static final textStyle20Grey = TextStyle(
      fontWeight: FontWeight.bold, color: textTerColor, fontSize: 16.sp);
  static final textStyle20Black = TextStyle(
      fontWeight: FontWeight.bold, color: Colors.black, fontSize: 16.sp);
  static final textStyle20White = TextStyle(
      fontWeight: FontWeight.w600, color: textPrimColor, fontSize: 16.sp);
}
