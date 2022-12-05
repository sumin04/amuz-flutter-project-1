// import 'dart:js';

// ignore_for_file: library_private_types_in_public_api, avoid_unnecessary_containers, override_on_non_overriding_member, curly_braces_in_flow_control_structures, unnecessary_brace_in_string_interps, unnecessary_this, unused_element, non_constant_identifier_nam, unused_import, unused_importes, unused_local_variable, empty_statements

import 'dart:async';
// import 'dart:collection';
import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
// import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'package:go_router/go_router.dart';

void main() {
  return runApp(App());
}

Future<List> fetchPost(List<dynamic> list) async {
  List<dynamic> test = [];

  final response =
  await http.get(Uri.parse('https://jsonplaceholder.typicode.com/todos'));


  if (response.statusCode == 200) {
    var datas = json.decode(response.body);
    log("data : ${datas.toString()}");
    log("data type : ${datas.runtimeType}");

    print("data size : ${datas.length}");

    for ( var i = 0; i < datas.length; i++){
      list.add(datas[i]);
    }

    return test;

  } else {
    throw Exception('Failed to load post');
  }
}

class Post {
  final int userId;

  Post({
    required this.userId,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      userId: json['userId'],
    );
  }
}

class Apps extends StatefulWidget {
  Apps({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class App extends StatelessWidget  {
  App({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();

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
            path: 'page1',
            builder: (BuildContext context, GoRouterState state) =>  Apps(),
          ),
        ],
        path: '/',
        builder: (BuildContext context, GoRouterState state) =>
        const FirstPageScreen(),
      ),
    ],
  );
}

// the screen of the first page
class FirstPageScreen extends StatelessWidget {
  const FirstPageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text(App.title,
      style: TextStyle(fontWeight: FontWeight.bold),
    ),
      toolbarHeight: 70,
      backgroundColor: Colors.black54,
    ),
    body: Container(
      margin: EdgeInsets.symmetric(vertical: 20.0),
      alignment: Alignment.center,
      child: Column(
        children: <Widget>[
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white60,
                side: BorderSide(width:1, color:Colors.grey), //border width and color
                elevation: 4,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)
                )
            ),
            onPressed: () => context.go('/page1'),
            child: Container(
              padding: EdgeInsets.fromLTRB(40, 20, 40, 20),
              child: Text('User List Page로 이동하기',
                style: TextStyle(fontWeight: FontWeight.normal,fontSize: 20, color: Colors.black),
              ),
            ),
          ),
          const SizedBox(height: 10,),
        ],
      ),
    ),
  );
}

// the screen of the 1 page
class _MyAppState extends State<Apps> {
  late Future<List> test;
  List<dynamic> list = [];

  List<dynamic> totals = [];
  List<dynamic> total = [];

  Future<dynamic> init() async {
    test = (fetchPost(list));
    await test;

    print('start map');
    for(var i = 1 ; i < list.length ; i++){
      totals.add(list[i-1]);
      if(list[i-1]['userId'] == list[i]['userId']){
        total.remove(list[i-1]['userId']);

      }
      total.add(list[i]['userId']);
    };
    // for(var i = 0; i < totals.length; i++){
    //   if(totals[i]['userId'] == 클릭한 유저 아이디 번호){
    //     print(totals[i]);
    //   }
    // }
    // print(total);
    // print(totals);

    print('end map');
  }

  @override
  void initState() {
    super.initState();
    this.init();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // throw UnimplementedError();
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),

      home: Scaffold(
        appBar: AppBar(
          title: Text('User List Page',
            style: TextStyle(fontWeight: FontWeight.bold,
              fontSize: 23,
              color: Colors.black54,
            ),
          ),
          toolbarHeight: 70,
        ),
        body: FutureBuilder(
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
                    // itemCount: list.length,
                      itemCount: total.length,
                      itemBuilder: (context, index) {
                        final document = total[index];

                        return Column(
                          children: [
                            Center(
                              child: Container(
                                child: Text(total[index].toString(),
                                style: TextStyle(
                                  fontSize: 30,
                                  decoration: TextDecoration.underline,
                                ),
                                ),
                              )
                            ),
                          ],
                        );

                        // child: Center(
                        //   child: Column(
                        //     children: <Widget>[
                        //       ElevatedButton(
                        //           onPressed: () => context.go('/'),
                        //           style: ElevatedButton.styleFrom(
                        //             primary: Colors.grey,
                        //           ),
                        //           child: const Text('Go Home')
                        //       ),
                        //     ],
                        //   ),
                        // ),
                        //   ],
                        // );
                      }
                  ),
                );
              }
            }
        ),
      ),
    );
  }
}

class Page2Screen extends StatelessWidget {
  const Page2Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text(App.title,
      style: TextStyle(fontWeight: FontWeight.bold),
    ),
      toolbarHeight: 70,
      backgroundColor: Colors.black54,
    ),
    body: Container(
      margin: EdgeInsets.symmetric(vertical: 20.0),
      alignment: Alignment.center,
      child: Column(
        children: <Widget>[
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white60,
                side: BorderSide(width:1, color:Colors.grey), //border width and color
                elevation: 4,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)
                )
            ),
            onPressed: () => context.go('/'),
            child: Container(
              padding: EdgeInsets.fromLTRB(40, 20, 40, 20),
              child: Text('상세데이터 페이지임 ㅅㄱ',
                style: TextStyle(fontWeight: FontWeight.normal,fontSize: 20, color: Colors.black),
              ),
            ),

          ),
          const SizedBox(height: 10,),
        ],
      ),
    ),
  );
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