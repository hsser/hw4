import 'package:flutter/material.dart';
import 'package:hw4/models/book.dart';
import 'package:hw4/widgets/book_detail.dart';

class BookDetailPage extends StatelessWidget {
  const BookDetailPage({required this.book, super.key});
  final Book book;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Book"),
        actions: [
          IconButton(
            icon: const Icon(Icons.account_circle_rounded),
            onPressed: () {},
          ),
        ],
      ),
      body: Container(
        height: double.infinity,
        color: Colors.white,
        child: BookDetail(book: book),
      ),
    );
  }
}
