import 'dart:math';

class GameUtils {
  static final List<String> _words = [
    'リンゴ',
    'バナナ',
    'みかん',
    'ぶどう',
    'メロン',
    'イチゴ',
    'もも',
    'なし',
    'すいか',
    'パイナップル',
    'キウイ',
    'レモン',
    'オレンジ',
    'グレープフルーツ',
    'さくらんぼ',
  ];

  static String getRandomWord() {
    final random = Random();
    return _words[random.nextInt(_words.length)];
  }
}
