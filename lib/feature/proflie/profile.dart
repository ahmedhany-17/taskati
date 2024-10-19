import 'dart:io';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hive/hive.dart';
//import 'package:image_picker/image_picker.dart';
import 'package:taskati/core/constant/colors.dart';
import 'package:taskati/core/utils/text_style.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    var box = Hive.box('userBox');
    print(box.get('image'));
    print(box.get('name'));
    return Scaffold(
        appBar: AppBar(
          title: Text('Profile',style: getbodyStyle(AppColors.black),),
          centerTitle: true,
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.sunny))
          ],
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Stack(
                children: [
                  CircleAvatar(
                    radius: 70,
                    backgroundImage: box.get('image') != null
                        ? FileImage(File(box.get('image')))
                        : const AssetImage('assets/images/user.jpeg'),
                  ),
                  Positioned(
                      right: 0,
                      bottom: 0,
                      child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle, color: AppColors.white
                          ),
                          child: Icon(Icons.camera_alt,color: AppColors.blue,),
                      ))
                ],
              ),
              const Gap(40),
              Divider(
                color: AppColors.blue,
              ),
              const Gap(20),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(
                      '${box.get('name')}',
                      style:
                          getTitleTextStyle(fontsize: 20, color: AppColors.blue),
                    ),
                    const Spacer(),
                    IconButton.outlined(
                      constraints: const BoxConstraints(maxWidth:35 , maxHeight: 35),
                        onPressed: () {},
                        icon: Icon(
                          Icons.edit,
                          color: AppColors.blue,
                        ))
                  ],
                ),
              )
            ]),
          ),
        ));
  }
}
