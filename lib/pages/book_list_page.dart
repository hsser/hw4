import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hw4/models/book.dart';
import 'package:hw4/navigation/router.dart';

class BookListPage extends StatelessWidget {
  const BookListPage({required this.books, required this.title, super.key});
  final List<Book> books;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        leading: const Icon(Icons.menu),
        title: const Text("Books"),
        actions: [
          IconButton(
            icon: const Icon(Icons.account_circle_rounded),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 30, // Adjust font size as needed
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.all(10),
              itemCount: books.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    books[index].title,
                    style: const TextStyle(fontSize: 20),
                  ),
                  subtitle: Text(books[index].author),
                  tileColor: ThemeData().colorScheme.surface,
                  onTap: () {
                    context.goNamed(RouteName.byAuthorDetail,
                        extra: books[index]);
                  },
                );
              },
              separatorBuilder: (context, index) {
                return const Divider(height: 10, color: Colors.transparent);
              },
            ),
          ),
        ],
      ),
    );
  }
}
