import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_note_app/cubit/todo_cubit/todo_cubit.dart';
import 'package:simple_note_app/cubit/todo_cubit/todo_state.dart';
import 'package:simple_note_app/helper/constants.dart';
import 'package:simple_note_app/uitl/app_bar.dart';

import 'package:simple_note_app/uitl/floatingActionButton.dart';
import 'package:simple_note_app/uitl/todol_tile.dart';

import 'package:simple_note_app/view/edit_task_page.dart';

class HomePage extends StatelessWidget {
  static const String id = "HomePage";

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'To Do List'),
      body: BlocBuilder<TaskCubit, TaskState>(
        builder: (context, state) {
          if (state is TaskInitial) {
            context.read<TaskCubit>().loadTasks();
            return Container(
              decoration: const BoxDecoration(
                gradient: AppColors.defaultGradient,
              ),
            );
          } else if (state is TaskLoaded) {
            final tasks = state.tasks;

            if (tasks.isEmpty) {
              return Container(
                decoration: const BoxDecoration(
                  gradient: AppColors.defaultGradient,
                ),
                child: const Center(
                  // child: Text(
                  //   "Well done! You have no tasks.",
                  //   style: TextStyle(
                  //     color: Colors.white,
                  //     fontSize: 20,
                  //     fontWeight: FontWeight.bold,
                  //   ),
                  // ),
                ),
              );
            }
            return Container(
              decoration: const BoxDecoration(
                gradient: AppColors.defaultGradient,
              ),
              child: ListView.builder(
                itemCount: tasks.length,
                itemBuilder: (context, index) {
                  final task = tasks[index];
                  return TodolTile(
                    taskModel: task,
                    onChange: (_) =>
                        context.read<TaskCubit>().toggleTask(index),
                    onDelete: (_) =>
                        context.read<TaskCubit>().deleteTask(index),
                    onEdit: (_) {
                      Navigator.pushNamed(
                        context,
                        EditTaskPage.id,
                        arguments: index,
                      );
                    },
                  );
                },
              ),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: floatingActionButton(context),
    );
  }
}
