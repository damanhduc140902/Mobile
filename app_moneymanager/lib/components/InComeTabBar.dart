import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'ButtonPrimary.dart';
import 'DatePicker1.dart';
import 'DateRangePicker.dart';
import 'TitleText1.dart';

class InComeTabBar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return DefaultTabController(
      length: 5, // length of tabs
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: <Widget>[
        Container(
          child: TabBar(
            labelColor: Color.fromARGB(255, 35, 111, 87),
            labelStyle: TextStyle(fontSize: 15.sp, fontFamily: 'Inter', fontWeight: FontWeight.bold),
            unselectedLabelColor: Colors.black,
            indicatorWeight: 2.2.sp,
            indicatorColor: Color.fromARGB(255, 35, 111, 87),
            padding: EdgeInsets.only(top: 10.h),
            indicatorPadding: EdgeInsets.only(left: 25.0.w, bottom: 5.0.h, right: 0.0.w),
            labelPadding: EdgeInsets.only(left: 23.0.w),
            isScrollable: true,
            tabs: [
              Tab(text: 'Ngày'),
              Tab(text: 'Tuần'),
              Tab(text: 'Tháng'),
              Tab(text: 'Năm'),
              Tab(text: 'Khoảng thời gian'),
            ],
          ),
        ),
        Container(
          height: 400.h, //height of TabBarView
          decoration: BoxDecoration(
          ),
          child: TabBarView(
              children: <Widget>[
                Center(
                  child: Column(
                    children: <Widget>[
                      DatePicker1(),
                      TitleText1(text: 'Tổng cộng: 2,000,000 đ', fontFamily: 'Inter', fontSize: 15, fontWeight: FontWeight.bold, r: 0, g: 0, b: 0),
                      Padding(
                        padding: EdgeInsets.only(top: 280),
                        child: SizedBox (
                          width: 93.w,
                          height: 51.h,
                          child: ButtonPrimary(text: 'Thêm', r: 35, g: 111, b: 87, radius: 30, weight: 109, height: 51, screenName: 'InComeTabBar'),
                        ),
                      ),
                    ],
                  ),
                ),
                Center(child: TitleText1(text: 'Tab 2', fontFamily: 'Inter', fontSize: 25, fontWeight: FontWeight.normal, r: 0, g: 0, b: 0)),
                Center(child: TitleText1(text: 'Tab 3', fontFamily: 'Inter', fontSize: 25, fontWeight: FontWeight.normal, r: 0, g: 0, b: 0)),
                Center(child: TitleText1(text: 'Tab 4', fontFamily: 'Inter', fontSize: 25, fontWeight: FontWeight.normal, r: 0, g: 0, b: 0)),
                Center(
                  child: Column(
                    children: <Widget>[
                      DateRangePicker(),
                      TitleText1(text: 'Tổng cộng: 2,000,000 đ', fontFamily: 'Inter', fontSize: 15, fontWeight: FontWeight.bold, r: 0, g: 0, b: 0),
                    ],
                  ),
                ),
              ]
          ),
        ),
      ]),
    );
  }
}