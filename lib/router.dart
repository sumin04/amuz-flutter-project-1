import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider_app/pages/home_page.dart';
import 'package:provider_app/pages/first_page.dart';
import 'package:provider_app/pages/second_page.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => HomePage(),
      routes: [
        GoRoute(
            path: 'first/:userId',
          builder: (BuildContext context, GoRouterState state) {
            return FirstPage(
              userId: state.params['userId'] as int,
            );
          },
        ),
        GoRoute(
          path: 'second',
          builder: (BuildContext context, GoRouterState state) {
            return SecondPage(userId: '',);
          },
        ),
      ],
    ),
  ],
);