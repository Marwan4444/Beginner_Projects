import 'package:flutter/material.dart';


class CategoryButton extends StatelessWidget {
  final String? text;
  final Color? color;
  final VoidCallback? onTap;

  const CategoryButton({Key? key, this.text, this.color, this.onTap})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      height: 55,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 6,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Center(
            child: Text(
              text ?? '', 
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CategoryPage extends StatelessWidget {
  final String? name;
  final Color? color;
  const CategoryPage({super.key, this.name, this.color});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: color,
        shadowColor: Color.fromARGB(255, 0, 0, 0),
        title: Text(
          name ?? '',
          style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
