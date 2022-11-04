import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../components/PasswordTextField.dart';
import '../components/InputText1.dart';
import '../components/ButtonPrimary.dart';
import '../components/TitleText1.dart';
import 'LoginScreen.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: Padding(
          padding: EdgeInsets.only(top: 50.h),
          child: TitleText1(text: 'Đăng ký', fontFamily: 'Inter', fontSize: 25, fontWeight: FontWeight.bold, r: 0, g: 0, b: 0),
        ),
        backgroundColor: Colors.transparent,
        toolbarHeight: 100.h,
        elevation: 0.0,
        // leading: IconButton(
        //   padding: EdgeInsets.only(left: 16, top: 55),
        //   iconSize: 20,
        //   color: Color.fromARGB(255, 189, 189, 189),
        //   alignment: Alignment.center,
        //   icon: Icon(Icons.close),
        //   onPressed: () => {},
        // ),
        actions: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen(title: 'Tạo lời nhắc')));
            },
            child: Padding(
              padding: EdgeInsets.only(right: 16, top: 62),
              child: Text(
                'Đăng nhập',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 17.sp,
                  fontWeight: FontWeight.normal,
                color: Color.fromARGB(255, 35, 111, 87),
              ),),
            ),
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 30.h),
            child: InputText1(hintText: 'Email', labelText: 'Email', maxLines: 1),
          ),
          Padding(
            padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 20.h),
            child: PasswordTextField(hintText: 'Mật khẩu', labelText: 'Mật khẩu', maxLines: 1),
          ),
          Padding(
            padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 20.h),
            child: PasswordTextField(hintText: 'Nhập lại mật khẩu', labelText: 'Nhập lại mật khẩu', maxLines: 1),
          ),
          Padding(
            padding: EdgeInsets.only(top: 80.h),
            child: ButtonPrimary(text: 'Đăng ký', r: 35, g: 111, b: 87, radius: 30, weight: 343, height: 51, screenName: 'RegisterScreen'),
          ),
          Padding(
            padding: EdgeInsets.only(top: 80.h),
            child: TitleText1(text: 'Đăng nhập với', fontFamily: 'Inter', fontSize: 18, fontWeight: FontWeight.normal, r: 0, g: 0, b: 0),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget> [
                IconButton(
                  padding: EdgeInsets.only(top: 10.h),
                  iconSize: 60,
                  icon: Image.asset("assets/fb.png"),
                  onPressed: () => {},
                ),
                IconButton(
                  padding: EdgeInsets.only(left: 30.w, top: 10.h),
                  iconSize: 60.sp,
                  icon: Image.asset("assets/google.png"),
                  onPressed: () => {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}