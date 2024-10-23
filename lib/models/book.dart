import 'dart:convert';
import 'package:hw4/services/mock.dart';

class Book {
  final String title;
  final String author;
  final String description;

  Book({
    required this.title,
    required this.author,
    required this.description,
  });

  Book copyWith({
    String? title,
    String? author,
    String? description,
  }) {
    return Book(
      title: title ?? this.title,
      author: author ?? this.author,
      description: description ?? this.description,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'author': author,
      'description': description,
    };
  }

  factory Book.fromMap(Map<String, dynamic> map) {
    return Book(
      title: map['title'] as String,
      author: map['author'] as String,
      description: map['description'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Book.fromJson(String source) =>
      Book.fromMap(json.decode(source) as Map<String, dynamic>);

  static Book createMockBook() {
    return Book(
      title: Mock.title(),
      author: Mock.author(),
      description: Mock.description(),
    );
  }

  @override
  String toString() {
    return 'Book(title: $title, author: $author, description: $description)';
  }

  @override
  bool operator ==(covariant Book other) {
    if (identical(this, other)) return true;

    return other.title == title &&
        other.author == author &&
        other.description == description;
  }

  @override
  int get hashCode {
    return title.hashCode ^ author.hashCode ^ description.hashCode;
  }
}
