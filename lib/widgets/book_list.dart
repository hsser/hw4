import 'package:flutter/material.dart';
import 'package:hw4/models/book.dart';

class BookList extends StatelessWidget {
  final List<Book> books;
  const BookList({required this.books, super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(20),
      itemCount: books.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(books[index].title),
          subtitle: Text(books[index].author),
          onTap: () {
            //context.goNamed(RouteName.detail, extra: books[index]);
          },
        );
      },
    );
  }
}
