import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hw4/blocs/authentication/bloc/authentication_bloc.dart';
import 'package:hw4/models/book.dart';
import 'package:hw4/utilities/stream_to_listenable.dart';
import 'package:hw4/pages/pages_export.dart';
import 'package:hw4/widgets/scaffold_with_nav_bar.dart';

class RouteName {
  static const String home = 'home';
  static const String byAuthor = 'byAuthor';
  static const String byTitle = 'byTitle';
  static const String byAuthorDetail = 'byAuthorDetail';
  static const String byTitleDetail = 'byTitleDetail';
  static const String profile = 'profile';
  static const String login = 'login';
}

final GlobalKey<NavigatorState> rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: "Root");
final GlobalKey<NavigatorState> shellNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: "Shell");

void sortBooksByAuthor(List<Book> books) {
  books.sort((a, b) => a.author.compareTo(b.author));
}

void sortBooksByTitle(List<Book> books) {
  books.sort((a, b) => a.title.compareTo(b.title));
}

GoRouter router(AuthenticationBloc authenticationBloc) {
  List<Book> books = List.generate(5, (index) => Book.createMockBook());
  sortBooksByAuthor(books);
  return GoRouter(
    navigatorKey: rootNavigatorKey,
    initialLocation: '/byAuthor',
    refreshListenable: StreamToListenable([authenticationBloc.stream]),
    redirect: (context, state) {
      if (authenticationBloc.state is AuthenticationLoggedOut &&
          (!(state.fullPath?.startsWith("/login") ?? false))) {
        return "/login";
      } else {
        if ((state.fullPath?.startsWith("/login") ?? false) &&
            authenticationBloc.state is AuthenticationLoggedIn) {
          return "/byAuthor";
        }
      }
      return null;
    },
    routes: [
      GoRoute(
        path: '/login',
        name: RouteName.login,
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        path: '/',
        name: RouteName.home,
        builder: (context, state) {
          return const HomePage();
        },
        routes: [
          ShellRoute(
            navigatorKey: shellNavigatorKey,
            builder: (BuildContext context, GoRouterState state, Widget child) {
              return ScaffoldWithNavBar(child: child);
            },
            routes: <RouteBase>[
              GoRoute(
                  path: 'byAuthor',
                  name: RouteName.byAuthor,
                  builder: (BuildContext context, GoRouterState state) {
                    sortBooksByAuthor(books);
                    return ByAuthorPage(books: books);
                  },
                  routes: [
                    GoRoute(
                      path: 'detail',
                      name: RouteName.byAuthorDetail,
                      parentNavigatorKey: rootNavigatorKey,
                      builder: (BuildContext context, GoRouterState state) {
                        final book = state.extra as Book;
                        return BookDetailPage(book: book);
                      },
                    ),
                  ]),
              GoRoute(
                path: 'byTitle',
                name: RouteName.byTitle,
                builder: (BuildContext context, GoRouterState state) {
                  sortBooksByTitle(books);
                  return ByTitlePage(books: books);
                },
                routes: [
                  GoRoute(
                    path: 'detail',
                    name: RouteName.byTitleDetail,
                    parentNavigatorKey: rootNavigatorKey,
                    builder: (BuildContext context, GoRouterState state) {
                      final book = state.extra as Book;
                      return BookDetailPage(book: book);
                    },
                  )
                ],
              ),
              GoRoute(
                path: 'profile',
                name: RouteName.profile,
                builder: (BuildContext context, GoRouterState state) {
                  return const ProfilePage();
                },
              ),
            ],
          )
        ],
      ),
    ],
  );
}
