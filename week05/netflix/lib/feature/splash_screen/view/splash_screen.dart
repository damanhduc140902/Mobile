import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../get_started_page/view/getstarted.dart';
import '../../tabbar/view/app_tabbar_view.dart';


class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SplashScreen();
  }
}

class _SplashScreen extends State<SplashScreen> {
  int spashtime = 3;

  @override
  void initState() {
    Future.delayed(Duration(seconds: spashtime), () async{
      Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context) {
          return Getstarted();
        }
      ));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold (
      backgroundColor: Colors.black,
      body: Container(
        alignment: Alignment.center,
        child: Container(
          child: SizedBox(
            height: 200.0,
            width: 200.0,
            child: Image.asset('assets/images/logo.png')
          ),
        ),
      ),
    );
  }

}