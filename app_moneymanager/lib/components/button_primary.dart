import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'title_text_1.dart';
import 'package:money_manager/screens/budget_screen.dart';

class ButtonPrimary extends StatelessWidget {
  ButtonPrimary(
      {Key? key,
      required this.text,
      required this.r,
      required this.g,
      required this.b,
      required this.radius,
      required this.weight,
      required this.height,
      this.fontSize = 18,
      required this.screenName})
      : super(key: key);

  double fontSize;
  String text;
  int r, g, b;
  double radius;
  double height, weight;
  String screenName;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SizedBox(
      width: this.weight.w,
      height: this.height.h,
      child: ElevatedButton(
          onPressed: () {},
          child: TitleText1(
              text: this.text,
              fontFamily: 'Inter',
              fontSize: this.fontSize.sp,
              fontWeight: FontWeight.bold,
              r: 255,
              g: 255,
              b: 255),
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(
                  Color.fromARGB(255, this.r, this.g, this.b)),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(this.radius.r)),
              )))),
    );
  }
}
