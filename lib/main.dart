// import 'dart:js';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() {
  return runApp(App());
}

class App extends StatelessWidget {
  App({Key? key}) : super(key: key);

  static const String title = '[ Amuz - project ] User List Page';

  @override
  Widget build(BuildContext context) => MaterialApp.router(
    routerDelegate: _router.routerDelegate,
    routeInformationParser: _router.routeInformationParser,
    routeInformationProvider: _router.routeInformationProvider,

  );

  final GoRouter _router = GoRouter(
    errorBuilder: (context, state) => ErrorScreen(error:state.error),
      routes: <GoRoute>[

        GoRoute(
            routes: <GoRoute>[
              GoRoute(
                path: 'page2',
                builder: (BuildContext context, GoRouterState state) =>
                const Page2Screen(),
              ),
              // GoRoute(
              //   path: 'page3',
              //   builder: (BuildContext context, GoRouterState state) =>
              //   const Page3Screen(),
              // ),
              // GoRoute(
              //   path: 'page4',
              //   builder: (BuildContext context, GoRouterState state) =>
              //   const Page4Screen(),
              // ),
            ],
            path: '/',
              builder: (BuildContext context, GoRouterState state) =>
              const Page1Screen(),
        ),
    ],

  );
}

// the screen of the first page
class Page1Screen extends StatelessWidget {
  // Creates a [Page1Screen]
  const Page1Screen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text(App.title)),
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ElevatedButton(
            onPressed: () => context.go('/page2'),
            child: const Text('User Post Page'),
          ),
          const SizedBox(height: 10,),
          // ElevatedButton(
          //   onPressed: () => context.go('/page3'),
          //   child: const Text('Go to page 3'),
          // ),
        ],
      ),
    ),
  );
}

// the screen of the 2 page
class Page2Screen extends StatelessWidget {
  // Creates a [Page1Screen]
  const Page2Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('User Post Page')),
    body: Center(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
        ElevatedButton(
            onPressed: () => context.go('/'),
            child: const Text('Go Home')),
        ],
      ),
    ),
  );
}

// the screen of the 3 page
class Page3Screen extends StatelessWidget {
  // Creates a [Page1Screen]
  const Page3Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text(App.title)),
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ElevatedButton(
              onPressed: () => context.go('/'),
              child: const Text('Go To Home Page'))
        ],
      ),
    ),
  );
}

// the screen of the 4 page
// class Page4Screen extends StatelessWidget {
//   // Creates a [Page2Screen]
//   const Page4Screen({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     final router = GoRouter.of(context);
//     return Scaffold(
//       appBar: AppBar(title: Text(router.location.toString())),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             ElevatedButton(
//                 onPressed: () => context.go('/'),
//                 child: const Text('Go Home'))
//         ],
//       ),
//     ),
//   );}
// }

// error
class ErrorScreen extends StatelessWidget {
  final Exception? error;
  const ErrorScreen( {Key? key, required this.error}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Error"),

      ),
      body: Center(
        child: Text(
          error.toString()
        ),
      ),
    );
  }
}