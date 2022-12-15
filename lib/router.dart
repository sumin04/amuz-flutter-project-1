import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider_app/pages/Details_Page.dart';
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
    ),
        GoRoute(
          name: 'first',
          path: '/first',
          builder: (BuildContext context, GoRouterState state) {
            return FirstPage();
          },
        ),
        // GoRoute(
        //   name: 'two',
        //   path: '/second',
        //   builder: (BuildContext context, GoRouterState state) {
        //     return SecondPage(userId: state.params['userId'] as String);
        //   },
        // ),
        GoRoute(
          name: 'second',
          path: '/second/:userId',
          builder: (BuildContext context, GoRouterState state) {
            // log('로그 테스트${state.params['userId']}');
            return SecondPage(userId: state.params['userId'] as String);
            // return SecondPage(userId: state.params['userId'] as String);
          },
        ),
        GoRoute(
          name: 'detail',
          path: '/second/:userId/detail',
          builder: (BuildContext context, GoRouterState state) {
            return DetailPage(userId: state.params['userId'] as String);
          },
        )
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
