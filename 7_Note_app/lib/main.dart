import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:simple_note_app/cubit/todo_cubit/todo_cubit.dart';
import 'package:simple_note_app/model/task_model.dart';
import 'package:simple_note_app/view/add_task_page.dart';
import 'package:simple_note_app/view/edit_task_page.dart';
import 'package:simple_note_app/view/home_page.dart';
import 'package:simple_note_app/view/task_details_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  Hive.registerAdapter(TaskModelAdapter());

  final box = await Hive.openBox<TaskModel>('tasksBox');

  runApp(
    BlocProvider(
      create: (_) {
        final cubit = TaskCubit(box);
        cubit.loadTasks();
        return cubit;
      },
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: HomePage.id,
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case HomePage.id:
            return MaterialPageRoute(builder: (_) => const HomePage());

          case AddTaskPage.id:
            return MaterialPageRoute(builder: (_) => const AddTaskPage());

          case EditTaskPage.id:
            final taskIndex = settings.arguments as int;
            return MaterialPageRoute(
              builder: (_) => EditTaskPage(taskIndex: taskIndex),
            );

          case TaskDetailsPage.id:
            final task = settings.arguments as TaskModel;
            return MaterialPageRoute(
              builder: (_) => TaskDetailsPage(taskModel: task),
            );

          default:
            return null;
        }
      },
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}
