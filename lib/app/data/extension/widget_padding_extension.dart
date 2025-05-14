// Widget 扩展 — 布局

import 'package:flutter/material.dart';

// extension WidgetPadding on Widget {
//   // 设置边距
//   Widget paddingAll(double value) => Padding(
//     padding: EdgeInsets.all(value),
//     child: this,
//   );
//
//   // 设置水平、垂直边距
//   Widget paddingSymmetric({double vertical = 0, double horizontal = 0}) =>
//       Padding(
//         padding: EdgeInsets.symmetric(
//           vertical: vertical,
//           horizontal: horizontal,
//         ),
//         child: this,
//       );
//
//   // 居中
//   Widget center() => Center(child: this);
// }

//使用：
// Text("Hello Extensions")
// .paddingAll(16)
// .center();