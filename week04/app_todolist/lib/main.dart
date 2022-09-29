import 'package:app_todolist/AppAssets.dart';
import 'package:app_todolist/AppColors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:app_todolist/MyHomePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        home: Scaffold(
      body: MyHomePage(),
    ));
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // width: 428,
      // height: 926,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(color: AppColors.primaryColor),
                  child: TextButton(
                      onPressed: () {},
                      child: Column(
                        children: [
                          Text(
                            "Tất cả",
                            style: GoogleFonts.roboto(
                                textStyle: TextStyle(
                                    fontSize: 13, color: Colors.black)),
                          ),
                        ],
                      ))),
              Container(
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(color: AppColors.primaryColor),
                  child: TextButton(
                      onPressed: () {},
                      child: Column(
                        children: [
                          Text(
                            "Công việc",
                            style: GoogleFonts.roboto(
                                textStyle: TextStyle(
                                    fontSize: 13, color: Colors.black)),
                          ),
                        ],
                      ))),
              Container(
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(color: AppColors.primaryColor),
                  child: TextButton(
                      onPressed: () {},
                      child: Column(
                        children: [
                          Text(
                            "Cá nhân",
                            style: GoogleFonts.roboto(
                                textStyle: TextStyle(
                                    fontSize: 13, color: Colors.black)),
                          ),
                        ],
                      ))),
              Container(
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(color: AppColors.primaryColor),
                  child: TextButton(
                      onPressed: () {},
                      child: Column(
                        children: [
                          Text(
                            "Danh sách yêu thích",
                            style: GoogleFonts.roboto(
                                textStyle: TextStyle(
                                    fontSize: 13, color: Colors.black)),
                          ),
                        ],
                      ))),
              Container(
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(color: AppColors.primaryColor),
                  child: TextButton(
                      onPressed: () {},
                      child: Column(
                        children: [
                          Text(
                            "Ngày sinh nhật",
                            style: GoogleFonts.roboto(
                                textStyle: TextStyle(
                                    fontSize: 13, color: Colors.black)),
                          ),
                        ],
                      ))),
              Container(
                margin: EdgeInsets.all(10),
                child: TextButton(
                  onPressed: () {},
                  child: Image.asset(AppAssets.add),
                ),
              )
            ],
          ),
          
          Spacer(),
          Container(
              width: 100,
              height: 50,
              child: TextButton(
                  onPressed: () {}, child: Image.asset(AppAssets.addtask))),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.all(15),
                child: Image.asset(AppAssets.menu),
              ),
              Container(
                margin: const EdgeInsets.all(10),
                child: TextButton(
                    onPressed: () {},
                    child: Column(
                      children: [
                        Image.asset(AppAssets.nhiemvu),
                        Text("Nhiệm vụ",
                            style: GoogleFonts.roboto(
                                fontSize: 10, color: Colors.black))
                      ],
                    )),
              ),
              Container(
                // margin: const EdgeInsets.all(10),
                child: TextButton(
                    onPressed: () {},
                    child: Column(
                      children: [
                        Image.asset(AppAssets.lich),
                        Text("Lịch",
                            style: GoogleFonts.roboto(
                                fontSize: 10, color: Colors.black))
                      ],
                    )),
              ),
              Container(
                // margin: const EdgeInsets.all(10),
                child: TextButton(
                    onPressed: () {},
                    child: Column(
                      children: [
                        Image.asset(AppAssets.cuatoi),
                        Text("Của tôi",
                            style: GoogleFonts.roboto(
                                fontSize: 10, color: Colors.black))
                      ],
                    )),
              )
            ],
          )
        ],
      ),
    );
  }
}
