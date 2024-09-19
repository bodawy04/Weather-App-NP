import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app_np/Core/Utils/styles.dart';
import 'package:weather_app_np/Features/Home/UI/manager/home_provider.dart';

import '../../../../../generated/l10n.dart';

class SearchBox extends StatelessWidget {
  final HomeProvider home;

  SearchBox({
    super.key,
    required this.textEditingController,
    required this.home,
  });

  final TextEditingController textEditingController;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Padding(
      padding: EdgeInsets.all(40.sp),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  const Color(0xff1C1B33).withOpacity(0.8),
                  const Color(0xff2E335A).withOpacity(0.8)
                ], begin: Alignment.bottomLeft, end: Alignment.topRight),
                borderRadius: BorderRadius.circular(12)),
            padding: EdgeInsets.all(10.sp),
            child: TextField(
              controller: textEditingController,
              style: Styles.textStyle20White,
              decoration: InputDecoration(
                hintText:S.of(context).searchHintText,
                hintStyle: Styles.textStyle20Grey,
                focusColor: Colors.transparent,
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                    borderRadius: BorderRadius.circular(12)),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                    borderRadius: BorderRadius.circular(12)),
              ),
            ),
          ),
          SizedBox(
            height: 20.h,
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
                onPressed: () async {
                  await home.fetchSearchedCity(textEditingController.text);
                  textEditingController.clear();
                },
                child: Text(S.of(context).searchButton,style: Styles.textStyle20White,)),
          )
        ],
      ),
    ));
  }
}
