import 'package:flutter/material.dart';
import 'package:language_learning_app/components/page_item.dart';
import 'package:language_learning_app/models/models.dart';

class NumberPage extends StatelessWidget {
  const NumberPage({super.key});

  @override
  Widget build(BuildContext context) {
final List<Number> numbers = [
  Number(
    englishName: 'one',
    germanName: 'ichi (一)',
    imagePath: 'assets/images/numbers/number_one.png',
    soundPath: 'sounds/numbers/number_one_sound.mp3',
  ),
  Number(
    englishName: 'two',
    germanName: 'ni (二)',
    imagePath: 'assets/images/numbers/number_two.png',
    soundPath: 'sounds/numbers/number_two_sound.mp3',
  ),
  Number(
    englishName: 'three',
    germanName: 'san (三)',
    imagePath: 'assets/images/numbers/number_three.png',
    soundPath: 'sounds/numbers/number_three_sound.mp3',
  ),
  Number(
    englishName: 'four',
    germanName: 'shi/yon (四)',
    imagePath: 'assets/images/numbers/number_four.png',
    soundPath: 'sounds/numbers/number_four_sound.mp3',
  ),
  Number(
    englishName: 'five',
    germanName: 'go (五)',
    imagePath: 'assets/images/numbers/number_five.png',
    soundPath: 'sounds/numbers/number_five_sound.mp3',
  ),
  Number(
    englishName: 'six',
    germanName: 'roku (六)',
    imagePath: 'assets/images/numbers/number_six.png',
    soundPath: 'sounds/numbers/number_six_sound.mp3',
  ),
  Number(
    englishName: 'seven',
    germanName: 'shichi (七)',
    imagePath: 'assets/images/numbers/number_seven.png',
    soundPath: 'sounds/numbers/number_seven_sound.mp3',
  ),
  Number(
    englishName: 'eight',
    germanName: 'hachi (八)',
    imagePath: 'assets/images/numbers/number_eight.png',
    soundPath: 'sounds/numbers/number_eight_sound.mp3',
  ),
  Number(
    englishName: 'nine',
    germanName: 'ku/kyū (九)',
    imagePath: 'assets/images/numbers/number_nine.png',
    soundPath: 'sounds/numbers/number_nine_sound.mp3',
  ),
  Number(
    englishName: 'ten',
    germanName: 'jū (十)',
    imagePath: 'assets/images/numbers/number_ten.png',
    soundPath: 'sounds/numbers/number_ten_sound.mp3',
  ),
];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFE57373),
        shadowColor: Color.fromARGB(255, 0, 0, 0),
        title: Row(
          children: [
            Image.asset(
              'assets/icons/123_24dp_E3E3E3_FILL0_wght400_GRAD0_opsz24.png',
              color: Colors.black,
            ),
            SizedBox(width: 12),
            Text(
              "Numbers",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView.builder(
          itemCount: numbers.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.only(bottom: 10), 
              child: ItemCategory(data: numbers[index],
            
              colorBackground:  Color.fromARGB(184, 233, 107, 107),

              colorButton:  const Color.fromARGB(255, 223, 77, 77),
              colorImage:  const Color.fromARGB(255, 187, 8, 8),
              ),
            );
          },
        ),
      ),
    );
  }
}
