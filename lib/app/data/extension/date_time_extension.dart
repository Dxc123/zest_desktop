// 日期时间扩展 — 格式和比较

extension DateTimeExtensions on DateTime {
  // String get formattedDate => "${day.toString().padLeft(2, '0')}/"
  //     "${month.toString().padLeft(2, '0')}/"
  //     "$year";
  //
  // // 是否是今天
  // bool get isToday {
  //   final now = DateTime.now();
  //   return now.day == day && now.month == month && now.year == year;
  // }
  // // 是否是同一时间
  // bool isSameDate(DateTime other) =>
  //     day == other.day && month == other.month && year == other.year;
}

// final now = DateTime.now();
// print(now.formattedDate); // 17/04/2025
// print(now.isToday);  // true