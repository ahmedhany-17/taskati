import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';
import 'package:taskati/core/function/navigation.dart';
import 'package:taskati/core/utils/text_style.dart';
import 'package:taskati/feature/home/home_view.dart';
import 'package:taskati/feature/upload/upload.dart';


class SpalshView extends StatefulWidget {
  const SpalshView({super.key});

  @override
  State<SpalshView> createState() => _SpalshViewState();
}

class _SpalshViewState extends State<SpalshView> {
  bool isUpload=true;
  @override

   void initState() {
    
    super.initState();
    Future.delayed(const Duration(seconds:5),(){
      pushWithReplacment(context, const Upload(),);
      pushWithReplacment(context, const HomeView());
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset('assets/images/logo2.json'),
          const Gap(20),
          Text('Taskati',style: getTitleTextStyle(),),
          const Gap(20),
           Text('Its Time to Get Organized',style: getsmallStyle(Colors.grey))
          ],
      )),
    );
  }
}
