
import 'dart:math';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension TextSizeExtension on num{
  num get w => ScreenUtil().setWidth(this);

  num get h => ScreenUtil().setHeight(this);

  num get sp => min(ScreenUtil().setWidth(this), ScreenUtil().setHeight(this));

  //num get ssp => ScreenUtil().setSp(this, allowFontScalingSelf: true);
}