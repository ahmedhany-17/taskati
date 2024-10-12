import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:taskati/core/constant/colors.dart';
import 'package:taskati/core/function/navigation.dart';
import 'package:taskati/core/models/task_models.dart';
import 'package:taskati/core/services/local_services.dart';
import 'package:taskati/core/utils/text_style.dart';
import 'package:taskati/feature/home/home_view.dart';

class AddTask extends StatefulWidget {
  const AddTask({super.key});

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  var titleController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  var description = TextEditingController();
  int colorindex = 0;
  String date = DateFormat.yMd().format(DateTime.now());
  String starttime = DateFormat("hh:mm a").format(DateTime.now());
  String endtime =
      DateFormat("hh:mm a").format(DateTime.now().add(const Duration(hours: 1)));
  int? SelectionColor;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add Task',
          style: getTitleTextStyle(color: AppColors.blue, fontsize: 20),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Title',
                style: getbodyStyle(fontsize: 20, fontWeight: FontWeight.bold, AppColors.black),
              ),
              TextFormField(
                controller: titleController,
                decoration: const InputDecoration(hintText: 'Enter title here'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'please enter title ';
                  } else {
                    return null;
                  }
                },
              ),
              const Gap(10),
              Text(
                'Note',
                style: getbodyStyle(fontsize: 20, fontWeight: FontWeight.bold ,AppColors.black),
              ),
              TextFormField(
                controller: titleController,
                maxLines: 3,
                 validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'please enter note ';
                  } else {
                    return null;
                  }
                },
              ),
              const Gap(10),
              Text(
                'Date',
                style: getbodyStyle(fontsize: 20, fontWeight: FontWeight.bold,  AppColors.black),
              ),
              TextFormField(
                controller: titleController,
                readOnly: true,
                onTap: () {
                  showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime.now(),
                          lastDate: DateTime(2030))
                      .then((value) {
                    if (value != null) {
                      setState(() {
                        date = DateFormat.yMd().format(value);
                      });
                    }
                  });
                },
                decoration: InputDecoration(
                    hintText: DateFormat.yMd().format(DateTime.now()),
                    suffixIcon: Icon(
                      Icons.calendar_month,
                      color: AppColors.blue,
                      size: 20,
                    )),
              ),
              const Gap(20),
              Row(
                children: [
                  Text(
                    'Start Time',
                    style:
                        getbodyStyle(fontsize: 20, fontWeight: FontWeight.bold , AppColors.black),
                  ),
                  const Spacer(),
                  Text(
                    'End Time',
                    style:
                        getbodyStyle(fontsize: 20, fontWeight: FontWeight.bold,  AppColors.black),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: titleController,
                      readOnly: true,
                      onTap: () {
                        showTimePicker(
                                context: context, initialTime: TimeOfDay.now())
                            .then((value) {
                          if (value != null) {
                            setState(() {
                              starttime = value.format(context);
                            });
                          }
                        });
                      },
                      decoration: InputDecoration(
                          hintText: starttime,
                          suffixIcon: Icon(
                            Icons.timer_outlined,
                            color: AppColors.blue,
                            size: 20,
                          )),
                    ),
                  ),
                  const Gap(10),
                  Expanded(
                    child: TextFormField(
                      controller: titleController,
                      readOnly: true,
                      onTap: () {
                        showTimePicker(
                                context: context, initialTime: TimeOfDay.now())
                            .then((value) {
                          if (value != null) {
                            setState(() {
                              endtime = value.format(context);
                            });
                          }
                        });
                      },
                      decoration: InputDecoration(
                          hintText: endtime,
                          suffixIcon: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.timer_outlined,
                                color: AppColors.blue,
                                size: 20,
                              ))),
                    ),
                  ),
                ],
              ),
              const Gap(20),
              Row(
                children: [
                  Column(
                    children: [
                      Text(
                        'Color',
                        style: getbodyStyle(
                            fontsize: 20, fontWeight: FontWeight.bold,  AppColors.black),
                      ),
                      Row(
                        children: [
                          GestureDetector(
                              onTap: () {
                                setState(() {
                                  SelectionColor = 0;
                                });
                              },
                              child: CircleAvatar(
                                  backgroundColor: AppColors.blue,
                                  child: (SelectionColor == 0)
                                      ? Icon(
                                          Icons.check,
                                          color: AppColors.white,
                                        )
                                      : null)),
                          const Gap(5),
                          GestureDetector(
                              onTap: () {
                                setState(() {
                                  SelectionColor = 1;
                                });
                              },
                              child: CircleAvatar(
                                  backgroundColor: AppColors.red,
                                  child: (SelectionColor == 1)
                                      ? Icon(
                                          Icons.check,
                                          color: AppColors.white,
                                        )
                                      : null)),
                          const Gap(5),
                          GestureDetector(
                              onTap: () {
                                setState(() {
                                  SelectionColor = 2;
                                });
                              },
                              child: CircleAvatar(
                                  backgroundColor: AppColors.orange,
                                  child: (SelectionColor == 2)
                                      ? Icon(
                                          Icons.check,
                                          color: AppColors.white,
                                        )
                                      : null)),
                        ],
                      ),
                    ],
                  ),
                  const Spacer(),
                  SizedBox(
                      height: 60,
                      width: 121,
                      child: ElevatedButton(
                          onPressed: () {
                            if(formKey.currentState!.validate()){
                            String id = DateTime.now().toIso8601String();
                            AppLocalStorage.cacheTaskData(
                                id,
                                TaskModels(
                                    id: id,
                                    title: titleController.text,
                                    description: description.text,
                                    date: date,
                                    starttime: starttime,
                                    endtime: endtime,
                                    colorindex: SelectionColor,
                                    isCompleted: false));
                                    pushWithReplacment(context, const HomeView());
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.blue,
                          ),
                          child: Text(
                            'Create Task',
                            style: getbodyStyle(
                              fontsize: 12,
                              AppColors.white,
                            ),
                          ))),
                          
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
