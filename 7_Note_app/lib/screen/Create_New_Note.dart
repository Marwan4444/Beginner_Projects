import 'package:flutter/material.dart';


class ToDoScreen extends StatefulWidget {
  const ToDoScreen({super.key});

  @override
  State<ToDoScreen> createState() => _ToDoScreenState();
}

class _ToDoScreenState extends State<ToDoScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFDCE9D4), // اللون الأخضر الفاتح للخلفية
      appBar: AppBar(
        backgroundColor: const Color(0xFF64B5F6), // الأزرق
        elevation: 0,
        title: const Text(
          "To-Do List",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // ====== Dates Row ======
          Container(
            height: 90,
            color: const Color(0xFF64B5F6),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                buildDateBox("30", "SAT", false),
                buildDateBox("31", "SUN", true),
                buildDateBox("1", "MON", false),
                buildDateBox("2", "TUE", false, month: "SEP"),
                buildDateBox("3", "WED", false),
              ],
            ),
          ),

          // ====== Task Card ======
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ListTile(
                    contentPadding:
                        const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                    title: const Text(
                      "day1",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: const Text("study dart"),
                    trailing: Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: Colors.blue.shade300,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Icon(Icons.check, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),

      // ====== Bottom Navigation ======
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 8,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: const Icon(Icons.list),
              onPressed: () {},
            ),
            const SizedBox(width: 40), // مكان زر الإضافة
            IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () {},
            ),
          ],
        ),
      ),

      // ====== Floating Action Button ======
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.blue,
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  // ====== Date Box Widget ======
  Widget buildDateBox(String day, String weekday, bool isSelected, {String? month}) {
    return Container(
      width: 70,
      margin: const EdgeInsets.symmetric(horizontal: 6, vertical: 8),
      decoration: BoxDecoration(
        color: isSelected ? Colors.white : Colors.transparent,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: isSelected ? Colors.grey : Colors.transparent,
          width: 1,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            day,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: isSelected ? Colors.black : Colors.white,
              fontSize: 18,
            ),
          ),
          if (month != null)
            Text(
              month,
              style: TextStyle(
                fontSize: 10,
                color: isSelected ? Colors.black : Colors.white,
              ),
            ),
          Text(
            weekday,
            style: TextStyle(
              fontSize: 12,
              color: isSelected ? Colors.black : Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
