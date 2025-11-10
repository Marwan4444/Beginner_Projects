import 'package:flutter/material.dart';
import 'package:language_learning_app/components/page_item.dart';

import 'package:language_learning_app/models/models.dart';

class FamilyPage extends StatelessWidget {
  const FamilyPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Family> familyMembers = [
      Family(
        englishName: 'Father',
        germanName: 'Chichi (父)',
        imagePath: 'assets/images/family_members/family_father.png',
        soundPath: 'sounds/family_members/father.wav',
      ),
      Family(
        englishName: 'Mother',
        germanName: 'Haha (母)',
        imagePath: 'assets/images/family_members/family_mother.png',
        soundPath: 'sounds/family_members/mother.wav',
      ),
      Family(
        englishName: 'Son',
        germanName: 'Musuko (息子)',
        imagePath: 'assets/images/family_members/family_son.png',
        soundPath: 'sounds/family_members/son.wav',
      ),
      Family(
        englishName: 'Daughter',
        germanName: 'Musume (娘)',
        imagePath: 'assets/images/family_members/family_daughter.png',
        soundPath: 'sounds/family_members/daughter.wav',
      ),
      Family(
        englishName: 'Grandfather',
        germanName: 'Sofu (祖父)',
        imagePath: 'assets/images/family_members/family_grandfather.png',
        soundPath: 'sounds/family_members/grand father.wav',
      ),
      Family(
        englishName: 'Grandmother',
        germanName: 'Sobo (祖母)',
        imagePath: 'assets/images/family_members/family_grandmother.png',
        soundPath: 'sounds/family_members/grand mother.wav',
      ),
      Family(
        englishName: 'Older Brother',
        germanName: 'Ani (兄)',
        imagePath: 'assets/images/family_members/family_older_brother.png',
        soundPath: 'sounds/family_members/older bother.wav',
      ),
      Family(
        englishName: 'Older Sister',
        germanName: 'Ane (姉)',
        imagePath: 'assets/images/family_members/family_older_sister.png',
        soundPath: 'sounds/family_members/older sister.wav',
      ),
      Family(
        englishName: 'Younger Brother',
        germanName: 'Otōto (弟)',
        imagePath: 'assets/images/family_members/family_younger_brother.png',
        soundPath: 'sounds/family_members/younger brohter.wav',
      ),
      Family(
        englishName: 'Younger Sister',
        germanName: 'Imōto (妹)',
        imagePath: 'assets/images/family_members/family_younger_sister.png',
        soundPath: 'sounds/family_members/younger sister.wav',
      ),
    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFFDD835),
        shadowColor: Color.fromARGB(255, 0, 0, 0),
        title: Row(
          children: [
            Image.asset(
              'assets/icons/family_restroom_24dp_E3E3E3_FILL0_wght400_GRAD0_opsz24.png',
              color: Colors.black,
            ),
            SizedBox(width: 12),
            Text(
              "Family Members",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView.builder(
          itemCount: familyMembers.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: ItemCategory(
                data: familyMembers[index],

                colorBackground: const Color.fromARGB(72, 208, 250, 1),
                colorButton: const Color.fromARGB(148, 136, 161, 10),
                colorImage: const Color.fromARGB(255, 181, 148, 27),
              ),
            );
          },
        ),
      ),
    );
  }
}
