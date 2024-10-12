import 'dart:io';
import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:taskati/core/constant/colors.dart';
import 'package:taskati/core/function/navigation.dart';
import 'package:taskati/core/services/local_services.dart';
import 'package:taskati/core/utils/text_style.dart';
import 'package:taskati/feature/add_task/task.dart';
import 'package:taskati/feature/proflie/profile.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    var box = Hive.box('userBox');
    print(box.get('image'));
    print(box.get('name'));
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(15),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hello, ${box.get('name')}',
                  style: getTitleTextStyle(
                      color: AppColors.blue, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Have a nice day',
                  style: getbodyStyle(fontsize: 20, AppColors.black),
                ),
              ],
            ),
            const Spacer(),
            GestureDetector(
              onTap: () => pushto(context, const Profile()),
              child: CircleAvatar(
                radius: 40,
                backgroundImage: box.get('image') != null
                    ? FileImage(File(box.get('image')))
                    : const AssetImage('assets/images/user.jpeg'),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(DateFormat.yMMMMd().format(DateTime.now()),
                    style: getbodyStyle(
                        AppColors.black,
                        fontsize: 20,
                        fontWeight: FontWeight.bold)),
                Text('Today',
                    style: getbodyStyle(
               AppColors.black,
                        fontsize: 25,
                        fontWeight: FontWeight.bold)),
              ],
            ),
            const Spacer(),
            SizedBox(
                height: 60,
                width: 120,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => AddTask(),
                      ));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.blue,
                    ),
                    child: Text(
                      '+ add Task',
                      style: getbodyStyle(
                        fontsize: 12,
                        AppColors.white,
                      ),
                    )))
          ],
        ),
        const Gap(20),
        DatePicker(
          width: 80,
          height: 100,
          DateTime.now(),
          selectionColor: AppColors.blue,
          selectedTextColor: AppColors.white,
          initialSelectedDate: DateTime.now(),
        ),
        const Gap(20),
        Expanded(
          child: ListView.builder(
            itemCount: AppLocalStorage.taskBox.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                margin: const EdgeInsetsDirectional.only(top: 10),
                decoration: BoxDecoration(
                    color: AppColors.blue,
                    borderRadius: BorderRadius.circular(20)),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column( 
                          // mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Flutter1',
                              style: getbodyStyle(AppColors.white),
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.watch_later_rounded,
                                  color: AppColors.white,
                                ),
                                const Gap(10),
                                Text(
                                  '10am:10pm',
                                  style: getbodyStyle(AppColors.white),
                                )
                              ],
                            ),
                            Text(
                              'Flutter1 svkjdvgvhjgvdhjdgvdkdghvhjgvgfhjfh',
                              style: getbodyStyle(AppColors.white),
                            ),
                          ],
                        ),
                      ),
                      const Spacer(),
                      Container(
                        width: 0.5,
                        height: 50,
                        color: AppColors.white,
                      ),
                      const Gap(10),
                      RotatedBox(
                        quarterTurns: 3,
                        child: Text(
                          'TODO',
                          style: getbodyStyle(AppColors.white),
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        )
      ]),
    ));
  }
}
