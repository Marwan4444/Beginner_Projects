import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:simple_note_app/model/task_model.dart';
import 'package:simple_note_app/view/task_details_page.dart';

class TodolTile extends StatelessWidget {
  final TaskModel taskModel;
  final Function(bool?)? onChange;
  final Function(BuildContext)? onDelete;
  final Function(BuildContext)? onEdit;

  const TodolTile({
    super.key,
    required this.taskModel,
    required this.onChange,
    required this.onDelete,
    required this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, TaskDetailsPage.id, arguments: taskModel);
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 20.0, right: 20, left: 20),
        child: Slidable(
          startActionPane: ActionPane(
            motion: const StretchMotion(),
            children: [
              SlidableAction(
                onPressed: onEdit,
                icon: Icons.edit,
                label: 'Edit',
                backgroundColor: Colors.yellow.shade700,
                borderRadius: BorderRadius.circular(12),
              ),
            ],
          ),
          endActionPane: ActionPane(
            motion: const StretchMotion(),
            children: [
              SlidableAction(
                onPressed: onDelete,
                icon: Icons.delete,
                label: 'Delete',
                backgroundColor: Colors.red,
                borderRadius: BorderRadius.circular(12),
              ),
            ],
          ),
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              gradient: LinearGradient(
                colors: taskModel.isCompleted
                    ? [Colors.green.shade400, Colors.green.shade700]
                    : [const Color(0xFF2C5364), const Color(0xFF0F2027)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 6,
                  
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Row(
              children: [
                Checkbox(
                  side: const BorderSide(color: Colors.white , width: 2),
                  value: taskModel.isCompleted,
                  onChanged: onChange,
                  checkColor: Colors.green,
                  activeColor: Colors.white,
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        taskModel.taskName,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          decoration: taskModel.isCompleted
                              ? TextDecoration.lineThrough
                              : TextDecoration.none,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        taskModel.description,
                        style: TextStyle(fontSize: 14, color: Colors.white70),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        "📅 ${taskModel.date}",
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.white60,
                        ),
                      ),
                    ],
                  ),
                ),
                if (taskModel.isCompleted)
                  const Chip(
                    label: Text("Done", style: TextStyle(color: Colors.white)),
                    backgroundColor: Colors.green,
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
