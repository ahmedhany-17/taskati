import 'dart:io';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hive/hive.dart';
import 'package:taskati/core/constant/colors.dart';
import 'package:taskati/core/function/dialogs.dart';
import 'package:taskati/core/function/navigation.dart';
import 'package:taskati/core/utils/text_style.dart';
import 'package:image_picker/image_picker.dart';
import 'package:taskati/feature/home/home_view.dart';

class Upload extends StatefulWidget {
  const Upload({super.key});

  @override
  State<Upload> createState() => _UploadState();
}

class _UploadState extends State<Upload> {
  String? path;
  String? name;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
              onPressed: () {
                if (path != null && name!.isNotEmpty) {
                  var box = Hive.box('userBox');
                  box.put('name', name);
                  box.put('image', path);
                   print(box.get('image'));
                   print(box.get('name'));
                  pushWithReplacment(context, const HomeView());
                } else if (path == null && name!.isNotEmpty) {
                  ShowErrorDialog(context, 'Please Select Image');
                } else if (path != null && name!.isEmpty) {
                  ShowErrorDialog(context, 'Please Enter Name');
                } else {
                  ShowErrorDialog(
                      context, 'Please Select Image and Enter Name');
                }
              },
              child: Text(
                'Done',
                style: getbodyStyle(AppColors.blue),
              ))
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
                radius: 100,
                backgroundColor: AppColors.blue,
                backgroundImage: (path != null)
                    ? FileImage(File(path!))
                    : const AssetImage('assets/images/user.jpeg')),
            const Gap(10),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: 250,
                height: 50,
                child: ElevatedButton(
                    onPressed: () {
                      ImagePicker()
                          .pickImage(source: ImageSource.camera)
                          .then((value) {
                        if (value != null) {
                          setState(() {
                            path = value.path;
                          });
                        } 
                      });
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.blue,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8))),
                    child: Text(
                      'Upload From Camera',
                      style: getbodyStyle(AppColors.white),
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: 250,
                height: 50,
                child: ElevatedButton(
                    onPressed: () {
                      ImagePicker()
                          .pickImage(source: ImageSource.gallery)
                          .then((value) {
                        if (value != null) {
                          setState(() {
                            path = value.path;
                          });
                        }
                      });
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.blue,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8))),
                    child: Text(
                      'Upload From Gallary',
                      style: getbodyStyle(AppColors.white),
                    )),
              ),
            ),
            const Gap(16),
            const Divider(),
            const Gap(10),
            Padding(
              padding: const EdgeInsets.all(20),
              child: TextFormField(
                onChanged: (value) {
                  setState(() {
                    name = value;
                  });
                },
                decoration: const InputDecoration(
                  label: Text('Enter Your Name'),
                ),
              ),
              ),
            
          ],
        ),
      ),
    );
  }
}



