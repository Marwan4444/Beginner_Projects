import 'package:flutter/material.dart';
import 'package:language_learning_app/components/Category_Item.dart';
import 'package:language_learning_app/screens/color_page.dart';
import 'package:language_learning_app/screens/family-page.dart';
import 'package:language_learning_app/screens/number_page.dart';
import 'package:language_learning_app/screens/phrase_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        title: const Text(
          'Toku',
          style: TextStyle(
            fontStyle: FontStyle.italic,
            fontSize: 36,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 182, 56, 11),
        centerTitle: true,
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/download.jpeg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const Spacer(flex: 2),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.deepOrange.withOpacity(0.9),
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(.3),
                      blurRadius: 12,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: const Text(
                  "Welcome to Toku to learn Japanese",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    letterSpacing: 1.1,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const Spacer(flex: 2),

              // Custom Styled Button Builder
              CategoryButton(
                text: "Numbers",
                color: Color(0xFFE57373),
                onTap:
                    () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return NumberPage();
                        },
                      ),
                    ),
              ),

              const SizedBox(height: 16),
              CategoryButton(
                text: "Family Members",
                color: Color(0xFFFDD835),
                onTap:
                    () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return FamilyPage();
                        },
                      ),
                    ),
              ),

              const SizedBox(height: 16),
              CategoryButton(
                text: "Colors",
                color: Color(0xFF4DB6AC),
                onTap:
                    () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return ColorPage();
                        },
                      ),
                    ),
              ),
              const SizedBox(height: 16),
              CategoryButton(
                text: "Phrases",
                color: Color(0xFF7986CB),
                onTap:
                    () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return PhrasePage();
                        },
                      ),
                    ),
              ),

              const Spacer(flex: 3),
            ],
          ),
        ),
      ),
    );
  }
}
