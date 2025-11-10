import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';


class ItemCategory extends StatelessWidget {
  const ItemCategory({
    super.key,
    required this.data,
    required this.colorBackground,
    required this.colorButton,
    required this.colorImage,
   
  });

  final dynamic data;
  final Color colorBackground;
  final Color colorImage;
  final Color colorButton;
 

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      decoration: BoxDecoration(
        color: colorBackground, // color background
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: 100,
            height: double.infinity,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Container(
                decoration: BoxDecoration(
                  color: colorImage, // color image
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Image.asset(
                  data.imagePath,
                  height: 60,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          const Spacer(flex: 2),
          Expanded(
            flex: 6,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    data.englishName,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    data.germanName,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Spacer(flex: 2),
          Container(
            height: double.infinity,
            width: 110,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: colorButton, // color button
            ),

            child: Padding(
              padding: const EdgeInsets.only(right: 15),
              child: IconButton(
                icon: const Icon(
                  Icons.play_arrow,
                  color: Color.fromARGB(255, 78, 255, 84),
                  size: 40,
                ),
                onPressed: () {
                  final player = AudioPlayer();
                 player.play(AssetSource(data.soundPath));
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
