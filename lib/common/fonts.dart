import 'package:flutter/material.dart';

final notoSans = 'NotoSans';

final titleBold = TextStyle(fontSize: 26, fontFamily: notoSans, fontWeight: FontWeight.w800);
final titleBig = TextStyle(fontSize: 30, fontFamily: notoSans, fontWeight: FontWeight.w800);
final titleRegular = TextStyle(fontSize: 30, fontFamily: notoSans, fontWeight: FontWeight.w400);

final bodyBold = TextStyle(fontSize: 15, fontFamily: notoSans, fontWeight: FontWeight.w800);
final bodyMedium = TextStyle(fontSize: 13, fontFamily: notoSans, fontWeight: FontWeight.w600);
final bodyMediumSizeUp = TextStyle(fontSize: 25, fontFamily: notoSans, fontWeight: FontWeight.w600);
final bodyRegular = TextStyle(fontSize: 13, fontFamily: notoSans, fontWeight: FontWeight.w400);
final bodyRegularSizeUp = TextStyle(fontSize: 25, fontFamily: notoSans, fontWeight: FontWeight.w400);


extension TextExtension on TextStyle {
  TextStyle get white => copyWith(color: Colors.white);
  TextStyle get black => copyWith(color: Colors.black);
  TextStyle get black87 => copyWith(color: Colors.black87);
  TextStyle get grey => copyWith(color: Colors.grey);
}