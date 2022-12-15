// ignore_for_file: library_private_types_in_public_api, must_be_immutable, unused_local_variable, unnecessary_brace_in_string_interps

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../fetch_post.dart';

// 클릭한 타이틀의 유저 정보 상세보기 데이터 불러오기
class DetailPage extends StatefulWidget {
  var userId;

  DetailPage({Key? key, required this.userId}) : super(key: key);

  @override
  _UserDetail createState() => _UserDetail();
}

class _UserDetail extends State<DetailPage>{
  Future<List>? data;
  List<dynamic> list = [];
  List<dynamic> test = [];

  var userId;

  Future<dynamic> init() async {
    final userId  = int.parse(widget.userId);
    data = fetchPost(list);

    await data;

    for(var i = 0; i < list.length; i++){
      if(list[i]['userId'] == userId){
        test.add(list[i]);
      }
      log('${list}');
    }
  }

  @override
  void initState() {
    super.initState();
    init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('상세 데이터 페이진데 먼가 이상하다 데이터를 못 받아온다',
            style: TextStyle(
              fontSize: 23,
            ),
          ),
          leading: IconButton(
              icon: Icon(Icons.arrow_back_ios),
              // 뒤로가기 버튼
              onPressed: () {
                // Navigator.pop(context);
                context.go('/first');
              }
          ),
        ),
        body: Container(
          child: (
              SizedBox(
                child: TextButton(
                  onPressed: (){
                    context.go('/first');
                  },
                  child: Text('대충 그럴싸한 글자\n{ } 빼고 데이터 띄우고 싶어요 힝구리핑퐁',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              )
          ),
        )
    );
  }
}
