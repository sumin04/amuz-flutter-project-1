// import 'dart:js';

// ignore_for_file: library_private_types_in_public_api, avoid_unnecessary_containers, override_on_non_overriding_member, curly_braces_in_flow_control_structures, unnecessary_brace_in_string_interps, unnecessary_this, unused_element, non_constant_identifier_nam, unused_import, unused_importes, unused_local_variable, empty_statements, camel_case_types

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

// Future이란 지금은 없지만 미래에 요청한 데이터 혹은 에러가 담길 그릇
Future<List> fetchPost(List<dynamic> list) async {
  List<dynamic> test = [];

  final response =
  // await이란 비동기처리 요청 후 결과가 올 때까지 기다리라는 키워드 또는 예약어
  await http.get(Uri.parse('https://jsonplaceholder.typicode.com/todos'));


  if (response.statusCode == 200) {
    var datas = json.decode(response.body);
    log("data : ${datas.toString()}");
    log("data type : ${datas.runtimeType}");

    // print("data size : ${datas.length}");

    for ( var i = 0; i < datas.length; i++){
      list.add(datas[i]);
    }

    return test;

  } else {
    // throw이란 메서드 내에서 예외처리를 하지 않고 해당 메서드를 사용한 곳에서 예외 처리를 하도록 예외를 위로 던지는 것
    throw Exception('Failed to load post');
  }
}

class Post {
  // final이란 최초 선언 시 어떠한 변수형으로도 사용이 가능하지만 선언 이후엔 값조차 변경할 수 없다.
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
  // static이란 일반 객체를 만들 때, 같이 메모리에 저장하는 것이 아닌
  // 따로 메모리를 두어 static 구문을 객체가 공유하여 사용할 수 있게 해주는 구문
  static const String title = '[ Amuz - project ] Home Page';

  // 라우터 세팅
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
          GoRoute(
            path: 'page2/:userId',
            builder: (BuildContext context, GoRouterState state) =>   Page2Screen(userId:state.params["userId"]!),
          ),
        ],
        path: '/',
        builder: (BuildContext context, GoRouterState state) =>
        const FirstPageScreen(),
      ),
    ],
  );
}

// StatelessWidget은 단 한번만 Build를 한다. 한번 그려진 화면은 계속 유지됨
// StatefulWidget은 state를 포함하며, setState가 발생할때마다 Build 과정이 일어나고, 동적 화면을 쉽게 구현이 가능
class FirstPageScreen extends StatelessWidget {
  const FirstPageScreen({Key? key}) : super(key: key);

  @override
  // BuildContext는 위젯의 정보를 가지고 있는것이며,
  // build 메소드에 의해 전해지는 context는 부모 위젯까지의 정보만을 가지고 있다.
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

  List<dynamic> total = [];
  List<dynamic> totals = [];

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

    print('end map');
    return totals;
    // for(var i = 0; i < totals.length; i++){
    //   if(totals[i]['userId'] == 클릭한 유저 아이디 번호){
    //     print(totals[i]);
    //   }
    // }
    // print(total);
    // print(totals);
  }

  @override
  void initState() {
    // 위젯이 생성될때 처음으로 호출되는 메서드
    // initState는 오직 한번 만 호출 된다.또한 반드시 super.initState()를 호출해야 한다.
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
                      itemCount: total.length,
                      itemBuilder: (context, index) {
                        final document = total[index];

                        return Column(
                          children: [
                            Center(
                              child: TextButton(
                                onPressed: (){
                                  var userId = total[index];
                                  context.go('/page2/$userId');
                                },
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

 class _detail extends State<Page2Screen> {

  // var userId = total[index];
  // for(var i = 0; i < totals.length; i++){
  //   if(totals[i]['userId'] == userId){
  //     print(totals[i]);
  //   }
  // }
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('상세데이터 페이지임 ㅅㄱ',
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
              child: Text('안돼 돌아가',
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

class Page2Screen extends StatefulWidget {
  final String userId;
  const Page2Screen({Key? key, required this.userId}) : super(key: key);
  @override
  _detail createState() => _detail();


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