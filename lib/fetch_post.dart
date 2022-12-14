
// ignore_for_file: avoid_init_to_null, unnecessary_ne, unused_local_variablew

import 'dart:async';
import 'dart:convert';

import 'dart:developer';
import 'package:http/http.dart' as http;

class Temp {
  // static이란 일반 객체를 만들 때, 같이 메모리에 저장하는 것이 아닌
  // 따로 메모리를 두어 static 구문을 객체가 공유하여 사용할 수 있게 해주는 구문
  static var temp = null;
}

// Future이란 지금은 없지만 미래에 요청한 데이터 혹은 에러가 담길 그릇
Future<List<dynamic>> fetchPost(List <dynamic> list) async {
  List<dynamic> test = [

  ];

  if(Temp.temp != null){
    for (var i = 0; i < Temp.temp.length; i++){
      list.add(Temp.temp[i]);
    }

    return Temp.temp;
  }

  final response =
  // await이란 비동기처리 요청 후 결과가 올 때까지 기다리라는 키워드 또는 예약어
  await http.get(Uri.parse('https://jsonplaceholder.typicode.com/todos'));

  if(response.statusCode == 200) {
    var datas = json.decode(response.body);

    log("data : ${datas.toString()}");

    for (var i = 0; i < datas.length; i++){
      list.add(datas[i]);
      test.add(datas[i]);
    }

    Temp.temp = test;

    return test;
  } else {
    // throw이란 메서드 내에서 예외처리를 하지 않고 해당 메서드를 사용한 곳에서 예외 처리를 하도록 예외를 위로 던지는 것
    throw Exception('Failed to load post');
  }
}