import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider_app/pages/home_page.dart';
import 'package:provider_app/pages/first_page.dart';
import 'package:provider_app/pages/second_page.dart';

import 'main.dart';

final router = GoRouter(
  initialLocation: '/',
  errorBuilder: (context, state) => ErrorScreen(error:state.error),
  routes: <GoRoute>[
    GoRoute(
      path: '/',
      builder: (context, state) => HomePage(),
      routes: <GoRoute>[
        GoRoute(
          path: 'first',
          builder: (BuildContext context, GoRouterState state) {
            // return FirstPage(userId: state.params['userId'] as List<String>);
            return FirstPage();
          },
        ),
        GoRoute(
          name: 'second',
          path: 'second/:userId',
          builder: (BuildContext context, GoRouterState state) {
            return SecondPage(userId: state.params['userId']);
          },
        ),
      ],
    ),
  ],
);
// class routes extends StatefulWidget {
//   const routes({Key? key}) : super(key: key);
//
//
//   // @override
//   // Widget build(BuildContext context) {
//   //   return _router;
//   // }
// }
