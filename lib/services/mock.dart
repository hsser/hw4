import 'package:flutter_lorem/flutter_lorem.dart';
import 'dart:math';

class Mock {
  static Random random = Random();

  static String title() {
    int numberOfWords = random.nextInt(5) + 1;
    return lorem(words: numberOfWords, paragraphs: 1).replaceAll(".", "");
  }

  static String author() {
    String firstName = lorem(words: 1, paragraphs: 1).replaceAll(".", "");
    String lastName = lorem(words: 1, paragraphs: 1).replaceAll(".", "");
    return '$firstName $lastName';
  }

  static String description() {
    return lorem(words: 200, paragraphs: 1);
  }
}
