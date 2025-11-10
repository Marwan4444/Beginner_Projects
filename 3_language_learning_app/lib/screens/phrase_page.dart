import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:language_learning_app/models/models.dart';

class PhrasePage extends StatelessWidget {
  const PhrasePage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Phrase> phrases = [
      Phrase(
        englishText: 'Are you coming?',
        japaneseText: '来ますか？',
        romajiText: 'Kimasu ka?',
        soundPath: 'sounds/phrases/are_you_coming.wav',
      ),
      Phrase(
        englishText: 'Don\'t forget to subscribe.',
        japaneseText: '登録を忘れないでね',
        romajiText: 'Tōroku o wasurenaide ne',
        soundPath: 'sounds/phrases/dont_forget_to_subscribe.wav',
      ),
      Phrase(
        englishText: 'How are you feeling?',
        japaneseText: '気分はどう？',
        romajiText: 'Kibun wa dō?',
        soundPath: 'sounds/phrases/how_are_you_feeling.wav',
      ),
      Phrase(
        englishText: 'I love anime.',
        japaneseText: 'アニメが大好き',
        romajiText: 'Anime ga daisuki',
        soundPath: 'sounds/phrases/i_love_anime.wav',
      ),
      Phrase(
        englishText: 'I love programming.',
        japaneseText: 'プログラミングが大好き',
        romajiText: 'Puroguramingu ga daisuki',
        soundPath: 'sounds/phrases/i_love_programming.wav',
      ),
      Phrase(
        englishText: 'Programming is easy.',
        japaneseText: 'プログラミングは簡単です',
        romajiText: 'Puroguramingu wa kantan desu',
        soundPath: 'sounds/phrases/programming_is_easy.wav',
      ),
      Phrase(
        englishText: 'What is your name?',
        japaneseText: 'あなたの名前は何ですか？',
        romajiText: 'Anata no namae wa nan desu ka?',
        soundPath: 'sounds/phrases/what_is_your_name.wav',
      ),
      Phrase(
        englishText: 'Where are you going?',
        japaneseText: 'どこへ行くの？',
        romajiText: 'Doko e iku no?',
        soundPath: 'sounds/phrases/where_are_you_going.wav',
      ),
      Phrase(
        englishText: 'Yes, I\'m coming.',
        japaneseText: 'はい、行きます',
        romajiText: 'Hai, ikimasu',
        soundPath: 'sounds/phrases/yes_im_coming.wav',
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF7986CB),
        shadowColor: Color.fromARGB(255, 0, 0, 0),
        title: Row(
          children: [
            Image.asset(
              'assets/icons/quick_phrases_24dp_E3E3E3_FILL0_wght400_GRAD0_opsz24.png',
              color: Colors.black,
            ),
            SizedBox(width: 12),
            Text(
              "Phrases",
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: phrases.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: itemPhrase(data: phrases[index]),
            );
          },
        ),
      ),
    );
  }
}

class itemPhrase extends StatelessWidget {
  const itemPhrase({super.key, required this.data});

  final dynamic data;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      decoration: BoxDecoration(
        color: Color.fromARGB(176, 72, 94, 206), // color background
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            flex: 6,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    data.japaneseText,
                    style: const TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    data.romajiText,
                    style: const TextStyle(
                      color: Color.fromARGB(255, 74, 73, 73),
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    data.englishText,
                    style: const TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),

          Container(
            height: double.infinity,
            width: 90,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Color.fromARGB(255, 93, 76, 200), // color button
            ),
            child: Padding(
              padding: const EdgeInsets.only(right: 15),
              child: IconButton(
                icon: const Icon(
                  Icons.play_arrow,
                  color: Color.fromARGB(255, 78, 255, 84),
                  size: 40,
                ),
                onPressed: () async {
                  try {
                    final player = AudioPlayer();
                    await player.play(AssetSource(data.soundPath));
                  } catch (e) {
                    print('حدث خطأ أثناء تشغيل الصوت: $e');
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('فشل تشغيل الصوت 😓')),
                    );
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
