import 'package:flutter_screenutil/flutter_screenutil.dart';

//扩展字体缩放方法
extension FontSp on num {
  double get fontSp => ScreenUtil().setFontSp(this);
}

//按照设计图上的字体设置大小 字体只进行放大但不进行缩小
extension FontSpScale on ScreenUtil {
  double setFontSp(num fontSize) => fontSize * (scaleText <= 1 ? 1 : scaleText);
}

extension FontExtension on num {
  double get bw => this * (ScreenUtil().scaleWidth < 1 ? 1 : ScreenUtil().scaleWidth);

  double get bh => this * (ScreenUtil().scaleWidth < 1 ? 1 : ScreenUtil().scaleHeight);
}
