import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:simple_note_app/cubit/todo_cubit/todo_state.dart';
import 'package:simple_note_app/model/task_model.dart';

class TaskCubit extends Cubit<TaskState> {
  final Box<TaskModel> taskBox;

  TaskCubit(this.taskBox) : super(TaskInitial());

  // Vars مؤقتة عشان Add/Edit pages
  String tempTitle = "";
  String tempDescription = "";
  String tempDate = DateTime.now().toString().split(" ")[0];

  /// load all tasks from Hive
  void loadTasks() {
    emit(TaskLoading());
    try {
      final tasks = taskBox.values.toList();
      emit(TaskLoaded(tasks));
    } catch (e) {
      emit(TaskError('Failed to load tasks: $e'));
    }
  }

  /// add a new task directly
  Future<void> addTask(TaskModel task) async {
    try {
      await taskBox.add(task);
      loadTasks();
    } catch (e) {
      emit(TaskError('Failed to add task: $e'));
    }
  }

  /// update task at index directly
  Future<void> updateTask(int index, TaskModel updated) async {
    try {
      await taskBox.putAt(index, updated);
      loadTasks();
    } catch (e) {
      emit(TaskError('Failed to update task: $e'));
    }
  }

  /// delete task at index
  Future<void> deleteTask(int index) async {
    try {
      await taskBox.deleteAt(index);
      loadTasks();
    } catch (e) {
      emit(TaskError('Failed to delete task: $e'));
    }
  }

  /// toggle completion (uses TaskModel.toggle which calls save())
  void toggleTask(int index) {
    final task = taskBox.getAt(index);
    if (task != null) {
      task.toggle(); // toggle + save()
      loadTasks();
    } else {
      emit(TaskError('Task not found'));
    }
  }

  /// get single task (nullable)
  TaskModel? getTask(int index) {
    if (index < 0 || index >= taskBox.length) return null;
    return taskBox.getAt(index);
  }

  // ----------------------------
  //       Temp Values APIs
  // ----------------------------

  void updateTempTitle(String value) {
    tempTitle = value;
  }

  void updateTempDescription(String value) {
    tempDescription = value;
  }

  void updateTempDate(String value) {
    tempDate = value;
  }

  /// Add new task from temp values
  Future<void> addTaskFromTemp() async {
    if (tempTitle.trim().isEmpty) return;
    final newTask = TaskModel(
      taskName: tempTitle.trim(),
      description: tempDescription.trim().isEmpty
          ? "No description"
          : tempDescription.trim(),
      date: tempDate,
    );
    await addTask(newTask);
  }

  /// Update existing task from temp values
  Future<void> updateTaskFromTemp(int index) async {
    if (tempTitle.trim().isEmpty) return;
    final updatedTask = TaskModel(
      taskName: tempTitle.trim(),
      description: tempDescription.trim().isEmpty
          ? "No description"
          : tempDescription.trim(),
      date: tempDate,
      isCompleted: getTask(index)?.isCompleted ?? false,
    );
    await updateTask(index, updatedTask);
  }

  /// prefill temp values before editing
  void setTempFromTask(TaskModel task) {
    tempTitle = task.taskName;
    tempDescription = task.description;
    tempDate = task.date;
  }
}
