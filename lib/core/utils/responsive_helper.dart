import 'package:flutter_screenutil/flutter_screenutil.dart';

extension ResponsiveExtension on num {
  double get sp => ScreenUtil().setSp(this);
  double get w => ScreenUtil().setWidth(this);
  double get h => ScreenUtil().setHeight(this);
  double get r => ScreenUtil().radius(this);
  double get sh => ScreenUtil().screenHeight * this;
}
