import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:simple_note_app/helper/constants.dart';

import 'package:simple_note_app/model/task_model.dart';
import 'package:simple_note_app/uitl/app_bar.dart';

class TaskDetailsPage extends StatelessWidget {
  static const id = "TaskDetailsPage";
  final TaskModel taskModel;

  const TaskDetailsPage({super.key, required this.taskModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Tasks Details',),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          gradient: AppColors.defaultGradient,
        ),
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          elevation: 6,
          color: Colors.white.withOpacity(0.1),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                
                Text(
                  taskModel.taskName,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: taskModel.isCompleted
                        ? Colors.white54
                        : Colors.white,
                    decoration: taskModel.isCompleted
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                  ),
                ),
                const SizedBox(height: 15),

                // الوصف
                Text(
                  taskModel.description,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.white70,
                  ),
                ),
                const SizedBox(height: 20),

                // التاريخ
                Row(
                  children: [
                    const Icon(Icons.calendar_today,
                        size: 18, color: Colors.white60),
                    const SizedBox(width: 8),
                    Text(
                      taskModel.date,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.white60,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                
                Row(
                  children: [
                    const Icon(Icons.check_circle,
                        size: 20, color: Colors.white60),
                    const SizedBox(width: 8),
                    Text(
                      taskModel.isCompleted ? "Completed" : "Pending",
                      style: TextStyle(
                        fontSize: 16,
                        color: taskModel.isCompleted
                            ? Colors.greenAccent
                            : Colors.orangeAccent,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
