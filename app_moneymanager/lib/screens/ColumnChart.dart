import 'package:flutter/material.dart';
import '../components/ColumnChartExpenseTabBar.dart';
import '../components/ColumnChartGeneralTabBar.dart';
import '../components/ColumnChartInComeTabBar.dart';
import '../components/NavigationDrawerWidget.dart';
import '../components/TitleText1.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ColumnChart extends StatelessWidget {
  ColumnChart ({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        drawer: NavigationDrawerWidget(),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Padding(
            padding: EdgeInsets.only(top: 10.h, bottom: 1.h),
            child: TitleText1(text: 'Biểu đồ', fontFamily: 'Inter', fontSize: 25, fontWeight: FontWeight.bold, r: 255, g: 255, b: 255),
          ),
          backgroundColor: Colors.transparent,
          toolbarHeight: 100.h,
          elevation: 0.0,
          leading: Builder(
            builder: (context) => Container(
              child: IconButton(
                padding: EdgeInsets.only(left: 32.w, top: 10.h, bottom: 1.h),
                iconSize: 30.sp,
                icon: Icon(Icons.menu),
                tooltip: 'Menu',
                onPressed: () => {Scaffold.of(context).openDrawer()},
              ),
            ),
          ),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(25.r),
                  bottomRight: Radius.circular(25.r)),
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 35, 111, 87),
                  Color.fromARGB(255, 35, 111, 87),
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
          ),
          bottom: TabBar(
            indicatorColor: Colors.white,
            indicatorWeight: 3.sp,
            indicatorPadding: EdgeInsets.only(left: 25.w, right: 25.w, bottom: 2.h),
            padding: EdgeInsets.only(bottom: 20.h),
            tabs: [
              Tab(
                child: TitleText1(text: 'Chung', fontFamily: 'Inter', fontSize: 18, fontWeight: FontWeight.bold, r: 255, g: 255, b: 255),
              ),
              Tab(
                child: TitleText1(text: 'Chi phí', fontFamily: 'Inter', fontSize: 18, fontWeight: FontWeight.bold, r: 255, g: 255, b: 255),
              ),
              Tab(
                child: TitleText1(text: 'Thu nhập', fontFamily: 'Inter', fontSize: 18, fontWeight: FontWeight.bold, r: 255, g: 255, b: 255),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            ColumnChartGeneralTabBar(),
            ColumnChartExpenseTabBar(),
            ColumnChartInComeTabBar(),
          ],
        ),
      ),
    );
  }
}