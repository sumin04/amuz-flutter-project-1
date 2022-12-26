import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider_app/pages/details_page.dart';
import 'package:provider_app/pages/user_list.dart';
import 'package:provider_app/pages/post_list.dart';
import 'package:provider_app/pages/home_page.dart';

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
        GoRoute(
          name: 'second',
          path: '/second/:userId',
          builder: (BuildContext context, GoRouterState state) {
            return SecondPage(userId: state.params['userId'] as String);
          },
        ),
        GoRoute(
          name: 'detail',
          path: '/second/:userId/detail/:id',
          builder: (BuildContext context, GoRouterState state) {
            return DetailPage(
              userId: state.params['userId'] as String,
              Id: state.params['id'] as String,
              test: state.extra as List,
            );
          },
        )
  ],
);
