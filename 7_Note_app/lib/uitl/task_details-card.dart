import 'package:flutter/material.dart';



class MyWidget extends StatelessWidget {
  final String taskName;
  final String description;
  final String date;
  final bool isCompleted;
  
  const MyWidget({super.key, required this.taskName, required this.description, required this.date, required this.isCompleted});

  @override
  Widget build(BuildContext context) {
    return  Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          elevation: 6,
          color: Colors.white.withOpacity(0.1),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                
                Text(
                  taskName,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: isCompleted
                        ? Colors.white54
                        : Colors.white,
                    decoration:isCompleted
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                  ),
                ),
                const SizedBox(height: 15),

                // الوصف
                Text(
                 description,
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
                      date,
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
                     isCompleted ? "Completed" : "Pending",
                      style: TextStyle(
                        fontSize: 16,
                        color: isCompleted
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
        );  
  }
}