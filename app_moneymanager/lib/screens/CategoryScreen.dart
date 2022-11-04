import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:money_manager/main.dart';
import 'package:money_manager/main1.dart';
import 'package:money_manager/screens/Authentication.dart';
import 'package:provider/provider.dart';
import '../components/CategoryGridView.dart';
import '../components/NavigationDrawerWidget.dart';
import '../components/TitleText1.dart';
import '../components/Category.dart';
import 'package:http/http.dart' as http;

// List<Category> parseCategories(String responseBody) {
//   final parsed = json.decode(responseBody).cast<Map<dynamic, dynamic>>();
//   return parsed.map<Category>((json) => Category.fromMap(json)).toList();
// }
//
// Future<List<Category>> fetchCategories() async {
//   final response =
//   await http.get(Uri.parse('http://192.168.138.1:8000/Json/categories.json'));
//   if (response.statusCode == 200) {
//     print(response.statusCode);
//     return parseCategories(response.body);
//   } else {
//     print(response.statusCode);
//     throw Exception('Unable to fetch products from the REST API');
//   }
// }

class CategoryScreen extends StatelessWidget {
  CategoryScreen({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        drawer: NavigationDrawerWidget(),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Padding(
            padding: EdgeInsets.only(top: 10.h),
            child: TitleText1(
                text: 'Danh mục',
                fontFamily: 'Inter',
                fontSize: 25,
                fontWeight: FontWeight.bold,
                r: 255,
                g: 255,
                b: 255),
          ),
          backgroundColor: Colors.transparent,
          toolbarHeight: 100.h,
          elevation: 0.0,
          leading: Builder(
            builder: (context) => Container(
              child: IconButton(
                padding: EdgeInsets.only(left: 32.w, top: 10.h),
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
            indicatorPadding:
                EdgeInsets.only(left: 50.0.w, right: 50.0.w, bottom: 2.0.h),
            padding: EdgeInsets.only(bottom: 20.0.h),
            tabs: [
              Tab(
                child: TitleText1(
                    text: 'Chi phí',
                    fontFamily: 'Inter',
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    r: 255,
                    g: 255,
                    b: 255),
              ),
              Tab(
                child: TitleText1(
                    text: 'Thu nhập',
                    fontFamily: 'Inter',
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    r: 255,
                    g: 255,
                    b: 255),
              ),
            ],
          ),
        ),
        body: ChangeNotifierProvider.value(
          value: ApplicationState.getInstance,
          builder: (context, _) => Consumer<ApplicationState>(
              builder: (context, appState, _) => Padding(
                    padding: EdgeInsets.only(top: 30.h),
                    child: TabBarView(
                      children: [
                        CategoryGridView(
                          categories: appState.expenseCategories,
                        ),
                        CategoryGridView(
                          categories: appState.incomeCategories,
                        )
                      ],
                    ),
                  )),
        ),
      ),
    );
  }
}
