import 'package:hive/hive.dart';

part 'task_model.g.dart';

@HiveType(typeId: 0)
class TaskModel extends HiveObject {
  @HiveField(0)
  String taskName;

  @HiveField(1)
  String description;

  @HiveField(2)
  String date;

  @HiveField(3)
  bool isCompleted;

  TaskModel({
    required this.taskName,
    required this.description,
    required this.date,
    this.isCompleted = false,
  });

  /// toggle الحالة و حفظ الاوبجكت في الـ box (لأننا بنورث HiveObject)
  void toggle() {
    isCompleted = !isCompleted;
    save();
  }
}
