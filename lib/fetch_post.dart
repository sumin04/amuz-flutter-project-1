
import 'dart:convert';

import 'dart:developer';
import 'package:http/http.dart' as http;
// Future이란 지금은 없지만 미래에 요청한 데이터 혹은 에러가 담길 그릇
Future<List> fetchPost(List<dynamic> list) async {
  List<dynamic> test = [

  ];

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