import 'package:flutter/material.dart';
import 'package:hw4/models/book.dart';

class BookDetail extends StatelessWidget {
  const BookDetail({super.key, required this.book});

  final Book book;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            book.title,
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            book.author,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            book.description,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
