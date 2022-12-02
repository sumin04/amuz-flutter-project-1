// import 'dart:js';

// ignore_for_file: library_private_types_in_public_api, avoid_unnecessary_containers

import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
// import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'package:go_router/go_router.dart';

void main() {
  return runApp(App());
}
// Future<Post>
Future<List> fetchPost(List<dynamic> list) async {
   List<dynamic> test = [];
   // List<dynamic> test2 = [];
  final response =
    await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));


  if (response.statusCode == 200) {
    var datas = json.decode(response.body);
    log("data : ${datas.toString()}");
    log("data type : ${datas.runtimeType}");

    print("data size : ${datas.length}");

    for ( var i = 0; i < datas.length; i++){
      list.add(datas[i]);
      // test.add(datas[i]);
    }
    // test2.add(test[0].split(','));
    // test2.add(test[0].split(''));
    // print(test2);

    return test;


    // print(Post.fromJson(json.decode(response.body)));
    // print(json.decode(response.body));
    // return json.decode(response.body);
  } else {
    throw Exception('Failed to load post');
  }
}

class Post {
  final int userId;
  final int id;
  final String title;
  final String body;


  Post({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }
}

// void main() => runApp(App());

class Apps extends StatefulWidget {
  Apps({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class App extends StatelessWidget  {
  App({Key? key}) : super(key: key);

  static const String title = '[ Amuz - project ] Home Page';

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
            builder: (BuildContext context, GoRouterState state) =>  Apps(),
          ),
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
  const Page1Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text(App.title)),
    body: Center(
      child: Column(
        children: <Widget>[
          ElevatedButton(
            onPressed: () => context.go('/page2'),
            child: const Text('User List Page'),
          ),
          const SizedBox(height: 10,),
        ],
      ),
    ),
  );
}

// the screen of the 2 page

class _MyAppState extends State<Apps> {
  late Future<List> test;
  List<dynamic> list = [];

  @override
  void initState(){
    test = fetchPost(list);
    super.initState();
  }
  // super.initState();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // throw UnimplementedError();
    return MaterialApp(
      // title: 'Fetch Data Example',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),

      home: Scaffold(
        appBar: AppBar(
            title: Text('User List Page')
        ),
        body: FutureBuilder (
          future: test,
          builder: (BuildContext context, AsyncSnapshot snapshot){
            if(snapshot.hasData == false){
              return CircularProgressIndicator();
            } else if(snapshot.hasError){
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Error: ${snapshot.error}'
                ),
              );
            }
            else{
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                  itemCount: list.length,
                    itemBuilder: (context, index) {
                      final document = list[index];

                      return Row(
                        children: [
                          Container(
                            child: Text(document["userId"].toString()),
                          ),
                          Container(
                            child: Text(document["id"].toString()),
                          ),
                          Container(
                            child: Text(document["title"]),
                          ),
                          Container(
                            child: Text(document["body"]),
                          )
                        ],
                        // child: Center(
                        //   child: Column(
                        //     children: <Widget>[
                        //       ElevatedButton(
                        //           onPressed: () => context.go('/'),
                        //           style: ElevatedButton.styleFrom(
                        //             primary: Colors.grey,
                        //           ),
                        //           child: const Text('Go Home')),
                        //     ],
                        //   ),
                        // ),
                      );
                    }
                )
                // child : Text(snapshot.data.toString()),
              );
            }
          }
        ),

        // Center(
        //   child: Column(
        //     children: <Widget>[
        //       ElevatedButton(
        //           onPressed: () => context.go('/'),
        //           style: ElevatedButton.styleFrom(
        //             primary: Colors.grey,
        //
        //           ),
        //           child: const Text('Go Home')),
        //     ],
        //   ),
        // ),
      ),
      // ),
    );
  }
}

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