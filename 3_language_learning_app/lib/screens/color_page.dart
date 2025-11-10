import 'package:flutter/material.dart';
import 'package:language_learning_app/components/page_item.dart';
import 'package:language_learning_app/models/models.dart';


class ColorPage extends StatelessWidget {
  const ColorPage({super.key});

  @override
Widget build(BuildContext context) {
 final List<ColorItem> colorItems = [
  ColorItem(
    englishName: 'Black',
    germanName: 'Kuro (黒)',
    imagePath: 'assets/images/colors/color_black.png',
    soundPath: 'sounds/colors/black.mp3', 
  ),
  ColorItem(
    englishName: 'Brown',
    germanName: 'Chairo (茶色)',
    imagePath: 'assets/images/colors/color_brown.png',
    soundPath: 'sounds/colors/brown.wav',
  ),
  ColorItem(
    englishName: 'Dusty Yellow',
    germanName: 'Kasshoku (かっしょく)',
    imagePath: 'assets/images/colors/color_dusty_yellow.png',
   soundPath: 'sounds/colors/dusty yellow.wav', 
  ),
  ColorItem(
    englishName: 'Gray',
    germanName: 'Haiiro (灰色)',
    imagePath: 'assets/images/colors/color_gray.png',
    soundPath: 'sounds/colors/gray.wav', 
  ),
  ColorItem(
    englishName: 'Green',
    germanName: 'Midori (緑)',
    imagePath: 'assets/images/colors/color_green.png',
    soundPath: 'sounds/colors/green.wav',
  ),
  ColorItem(
    englishName: 'Red',
    germanName: 'Aka (赤)',
    imagePath: 'assets/images/colors/color_red.png',
    soundPath: 'sounds/colors/red.wav', 
  ),
  ColorItem(
    englishName: 'White',
    germanName: 'Shiro (白)',
    imagePath: 'assets/images/colors/color_white.png',
    soundPath: 'sounds/colors/white.wav',
  ),
  ColorItem(
    englishName: 'Yellow',
    germanName: 'Kiiro (黄色)',
    imagePath: 'assets/images/colors/yellow.png',
    soundPath: 'sounds/colors/yellow.wav',
  ),
];
  return Scaffold(
    appBar: AppBar(
      backgroundColor:const Color(0xFF4DB6AC),
      title: Row(
        children: [
          Image.asset('assets/icons/palette_24dp_E3E3E3_FILL0_wght400_GRAD0_opsz24.png', width: 40 , color: Colors.black,), // أيقونة مخصصة
          SizedBox(width: 10),
          Text("Colors",
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),

    ),
                body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView.builder(
          itemCount: colorItems.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: ItemCategory(data: colorItems[index],
              
              colorBackground:  const Color.fromARGB(69, 66, 232, 216),
              colorButton:  const Color.fromARGB(255, 24, 120, 111),
              colorImage: const Color.fromARGB(255, 4, 180, 162),)
            );
          },
          ),
          ),    
  );
}
}

