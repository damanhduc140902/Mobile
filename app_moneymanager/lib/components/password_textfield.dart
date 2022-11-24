import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class  PasswordTextField extends StatefulWidget {

  PasswordTextField(
      {Key? key,
        required this.hintText,
        required this.labelText,
        required this.maxLines,
        this.isHiddenPassword = true})
      : super(key: key);

  String hintText, labelText;
  int maxLines;
  bool isHiddenPassword;
  @override
  PasswordTextFieldState createState() =>  PasswordTextFieldState(this.hintText, this.labelText, this.maxLines, this.isHiddenPassword);
}

class  PasswordTextFieldState extends State< PasswordTextField> {
  PasswordTextFieldState(this.hintText, this.labelText, this.maxLines, this.isHiddenPassword);

  String hintText, labelText;
  int maxLines;
  bool isHiddenPassword;

  void _tooglePasswordView() {
    if (this.isHiddenPassword == true) {
      this.isHiddenPassword = false;
    } else {
      this.isHiddenPassword = true;
    }
   setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return TextField(
      obscureText: this.isHiddenPassword,
      decoration: InputDecoration(
        hintText: this.hintText,
        labelText: this.labelText,
        suffixIcon: IconButton(
          icon: Icon(Icons.visibility),
          color: Color.fromARGB(255, 35, 111, 87),
          onPressed: () => {
            _tooglePasswordView(),
          },
        ),
        labelStyle: TextStyle(
          fontSize: 18.sp,
          fontFamily: 'Inter',
          color: Colors.black,
        ),
        hintStyle: TextStyle(
          fontSize: 18.sp,
          fontFamily: 'Inter',
          color: Color.fromARGB(255, 189, 189, 189),
        ),
        border: OutlineInputBorder(),
        enabledBorder: const OutlineInputBorder(
          borderSide: const BorderSide(
              color: Color.fromARGB(255, 189, 189, 189),
              width: 1.0
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: const BorderSide(
            color: Color.fromARGB(255, 35, 111, 87),
            width: 2.0
          ),
        ),
        fillColor: Color.fromARGB(255, 232, 232, 232),
        filled: true,
      ),
      maxLines: this.maxLines,
    );
  }
}