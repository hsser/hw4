import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hw4/models/book.dart';
import 'package:hw4/navigation/router.dart';

class ByTitlePage extends StatelessWidget {
  const ByTitlePage({required this.books, super.key});
  final List<Book> books;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Sorted by Title',
                  style: TextStyle(
                    fontSize: 25, // Adjust font size as needed
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(10),
                itemCount: books.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(books[index].title),
                    subtitle: Text(books[index].author),
                    //tileColor: ThemeData().colorScheme.surfaceContainer,
                    onTap: () {
                      context.goNamed(RouteName.byTitleDetail,
                          extra: books[index]);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
