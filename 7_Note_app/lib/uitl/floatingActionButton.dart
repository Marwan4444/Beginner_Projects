import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_note_app/cubit/todo_cubit/todo_cubit.dart';
import 'package:simple_note_app/model/task_model.dart';
import 'package:simple_note_app/view/add_task_page.dart';

class floatingActionButton extends StatelessWidget {
  const floatingActionButton(BuildContext context, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
  decoration: BoxDecoration(
    gradient: const LinearGradient(
      colors: [
        Color(0xFF0F2027),
        Color(0xFF2C5364),
      ],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
    borderRadius: BorderRadius.circular(30),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.3),
        blurRadius: 8,
        offset: const Offset(2, 4),
      ),
    ],
  ),
  child: FloatingActionButton.extended(
    onPressed: () async {
      final newTask =
          await Navigator.pushNamed(context, AddTaskPage.id) as TaskModel?;

      if (newTask != null) {
        context.read<TaskCubit>().addTask(newTask);
      }
    },
    backgroundColor: Colors.transparent, 
    elevation: 0, 
    icon: const Icon(Icons.add, color: Colors.white),
    label: const Text(
      "Add Task",
      style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 16,
      ),
    ),
  ),
);
  }
}