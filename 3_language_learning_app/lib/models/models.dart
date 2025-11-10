class Number {
  final String englishName;
  final String germanName;
  final String imagePath;
  final String soundPath;

  Number({
    required this.englishName,
    required this.germanName,
    required this.imagePath,
    required this.soundPath,
  });
}

class Family {
  final String englishName;
  final String germanName;
  final String imagePath;
  final String soundPath;

  Family({
    required this.englishName,
    required this.germanName,
    required this.imagePath,
    required this.soundPath,
  });
}




class ColorItem {
  final String englishName;
  final String germanName;
  final String imagePath;
  final String? soundPath; 

  ColorItem({
    required this.englishName,
    required this.germanName,
    required this.imagePath,
    this.soundPath,
  });
}


class Phrase {
  final String englishText;
  final String japaneseText;
  final String? soundPath;
  final String  romajiText;

  Phrase({
    required this.englishText,
    required this.japaneseText,
    required this.romajiText,
    this.soundPath,
  });
}
