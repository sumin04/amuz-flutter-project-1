// ignore_for_file: library_private_types_in_public_api, must_be_immutable, unused_local_variable, unnecessary_brace_in_string_interps

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider_app/pages/first_page.dart';
import 'package:provider_app/pages/second_page.dart';

import '../fetch_post.dart';

// 클릭한 타이틀의 유저 정보 상세보기 데이터 불러오기
class DetailPage extends StatefulWidget {
  var userId;

  DetailPage({Key? key, required this.userId}) : super(key: key);

  @override
  _UserDetail createState() => _UserDetail();
}

class _UserDetail extends State<DetailPage>{


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('상세 데이터 페이진데 먼가 이상하다... 라우터도 먼가 이상하다 힝구리퐁퐁',
            style: TextStyle(
              fontSize: 23,
            ),
          ),
          leading: IconButton(
              icon: Icon(Icons.arrow_back_ios),
              // 뒤로가기 버튼
              onPressed: () {
                context.go('/second/${widget.userId}');
                // Navigator.pop(context);
                // Navigator.push(context, MaterialPageRoute(
                //     builder: (context) => SecondPage(userId: widget.userId)))
                //     .then((value) => setState((){}));
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
                  // child: Text('대충 그럴싸한 글자\n{ } 빼고 데이터 띄우고 싶어요 힝구리핑퐁',
                  child: Text('${widget.userId}',
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
