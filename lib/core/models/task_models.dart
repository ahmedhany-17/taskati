import 'package:hive_flutter/hive_flutter.dart';

 part 'task_models.g.dart';

@HiveType(typeId: 1)

class TaskModels {
  @HiveField(0)
  String? id;

  @HiveField(1)
  String? title;

   @HiveField(2)
  String? description;

  @HiveField(3)
  String? date;

   @HiveField(4)
  String? starttime;

  @HiveField(5)
  String? endtime;

   @HiveField(6)
  int? colorindex;

   @HiveField(7)
  bool? isCompleted;

  TaskModels(
  {this.id,
   this.title,
   this.description,
   this.date,
   this.starttime,
   this.endtime,
   this.colorindex,
   this.isCompleted,
});
}
