import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_note_app/cubit/todo_cubit/todo_cubit.dart';
import 'package:simple_note_app/cubit/todo_cubit/todo_state.dart';
import 'package:simple_note_app/uitl/app_bar.dart';

class EditTaskPage extends StatelessWidget {
  static const id = "EditTaskPage";
  final int taskIndex;

  const EditTaskPage({super.key, required this.taskIndex});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<TaskCubit>();

   
    final task = cubit.getTask(taskIndex);
    if (task != null) {
      cubit.setTempFromTask(task);
    }

    return Scaffold(
      appBar: const CustomAppBar(title: "Edit Task"),
      body: BlocBuilder<TaskCubit, TaskState>(
        builder: (context, state) {
          if (state is TaskLoaded) {
            return Container(
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF2C5364), Color(0xFF203A43), Color(0xFF0F2027)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Column(
                children: [
                  _buildTextField(
                    context,
                    cubit.tempTitle,
                    "Task Title",
                    (val) => cubit.updateTempTitle(val),
                  ),
                  const SizedBox(height: 20),
                  _buildTextField(
                    context,
                    cubit.tempDescription,
                    "Description",
                    (val) => cubit.updateTempDescription(val),
                    maxLines: 3,
                  ),
                  const SizedBox(height: 20),
                  _buildDateField(context, cubit.tempDate),
                  const SizedBox(height: 30),

                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal,
                      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () async {
                      await cubit.updateTaskFromTemp(taskIndex);
                      Navigator.pop(context);
                    },
                    child: const Text(
                      "Update Task",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ],
              ),
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  Widget _buildTextField(
    BuildContext context,
    String initialValue,
    String label,
    Function(String) onChanged, {
    int maxLines = 1,
  }) {
    return TextField(
      controller: TextEditingController(text: initialValue)
        ..selection = TextSelection.collapsed(offset: initialValue.length),
      style: const TextStyle(color: Colors.white),
      maxLines: maxLines,
      onChanged: onChanged,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: Colors.white70),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white70),
          borderRadius: BorderRadius.circular(12),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }

  Widget _buildDateField(BuildContext context, String initialDate) {
    final cubit = context.read<TaskCubit>();
    final controller = TextEditingController(text: initialDate);

    return TextField(
      controller: controller,
      style: const TextStyle(color: Colors.white),
      readOnly: true,
      decoration: InputDecoration(
        labelText: "Date (YYYY-MM-DD)",
        labelStyle: const TextStyle(color: Colors.white70),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white70),
          borderRadius: BorderRadius.circular(12),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      onTap: () async {
        DateTime? pickedDate = await showDatePicker(
          context: context,
          initialDate: DateTime.tryParse(initialDate) ?? DateTime.now(),
          firstDate: DateTime(2020),
          lastDate: DateTime(2100),
        );
        if (pickedDate != null) {
          final dateStr = pickedDate.toString().split(" ")[0];
          controller.text = dateStr;
          cubit.updateTempDate(dateStr);
        }
      },
    );
  }
}
