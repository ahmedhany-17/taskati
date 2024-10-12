import 'package:flutter/material.dart';
import 'package:taskati/core/constant/colors.dart';

ShowErrorDialog(BuildContext context, String text){
ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  backgroundColor: AppColors.red,
  content: const Text('Please Select Image'),
  ),
  );
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  backgroundColor: AppColors.red,
  content: const Text('Please Enter Your Name'),
  ),
  );
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  backgroundColor: AppColors.red,
  content: const Text('Please Enter Your Name and Please Select Image'),
  ),
  );
}
