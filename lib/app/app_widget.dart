import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(432,864),
      builder: () {
        return MaterialApp(
          title: 'Flutter Slidy',
          theme: ThemeData(
            primaryColor: Color(0xff393e3b),
            primaryColorLight: Color(0xff9C9F98),
            primaryColorDark: Color(0xff231F1C),
            accentColor: Color(0xffEBE9E7),
            canvasColor: Color(0xff393e3b),
            backgroundColor: Color(0xff231F1C),
            secondaryHeaderColor: Color(0xff2C2F26)),
        ).modular();
      }
    );
  }
}