import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hw4/navigation/router.dart';

class ScaffoldWithNavBar extends StatelessWidget {
  const ScaffoldWithNavBar({required this.child, super.key});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outlined),
            label: 'ByAuthor',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.text_fields_outlined),
            label: 'ByTitle',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_outlined),
            label: 'Profile',
          ),
        ],
        currentIndex: _calculateCurrentIndex(context),
        onTap: (index) => _onItemTapped(context, index),
      ),
    );
  }

  static int _calculateCurrentIndex(BuildContext context) {
    final String location = GoRouterState.of(context).uri.path;

    if (location.startsWith('/byAuthor')) {
      return 0;
    } else if (location.startsWith('/byTitle')) {
      return 1;
    } else if (location.startsWith('/profile')) {
      return 2;
    } else {
      return 0;
    }
  }

  void _onItemTapped(BuildContext context, int index) {
    switch (index) {
      case 0:
        GoRouter.of(context).goNamed(RouteName.byAuthor);
      case 1:
        GoRouter.of(context).goNamed(RouteName.byTitle);
      case 2:
        GoRouter.of(context).goNamed(RouteName.profile);
    }
  }
}
