import 'package:flutter/material.dart';
import 'package:taskati/core/constant/colors.dart';

TextStyle getTitleTextStyle(
  {double? fontsize,Color? color, FontWeight? fontWeight}
){
  return TextStyle(
    fontFamily: 'Poppins',
    color: color ?? AppColors.black,
fontWeight: fontWeight ?? FontWeight.bold,
fontSize: fontsize ?? 30
  );
}
TextStyle getbodyStyle(black, 
  {double? fontsize,Color? color, FontWeight? fontWeight}
){
  return TextStyle(
    fontFamily: 'Poppins',
    color: color ?? AppColors.black,
fontWeight: fontWeight ?? FontWeight.normal,
fontSize: fontsize ?? 16
  );
}
TextStyle getsmallStyle(Color blue, 
  {double? fontsize,Color? color, FontWeight? fontWeight}
){
  return TextStyle(
    color: color ?? AppColors.grey,
fontFamily: 'Poppins',
fontSize: fontsize ?? 20
  );
}