
// ignore_for_file: must_be_immutable, library_private_types_in_public_api, unnecessary_string_interpolations

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../fetch_post.dart';

// 클릭한 타이틀의 유저 정보 상세보기 데이터 불러오기
class DetailPage extends StatefulWidget {
  String userId;
  String Id;

  DetailPage({Key? key, required this.userId, required this.Id, required this.test, required this.completed}) : super(key: key);

  final Map test;
  final Map completed;

  @override
  _UserDetail createState() => _UserDetail();
}

class _UserDetail extends State<DetailPage> {

  @override
  Widget build(BuildContext context) {
    Map userData  = widget.test;
    return Scaffold(
        appBar: AppBar(
          title: Text('상세 데이터 페이진데...',
            style: TextStyle(
              fontSize: 23,
            ),
          ),
          leading: IconButton(
              icon: Icon(Icons.arrow_back_ios),
              // 뒤로가기 버튼
              onPressed: () {
                context.go('/second/${widget.userId}');
              }
          ),
          toolbarHeight: 70,
          backgroundColor: Colors.blue.shade700,
        ),
        body: ListView.builder(
            itemCount: widget.userId.length,
            itemBuilder: (context, index){
              return InkWell(
                onTap: (){

                },
                  child: Column(
                    // height: 150,
                    children: [
                      SizedBox(
                        child: Text(
                        '아이디 : ${widget.Id} \n'
                        '유저아이디 : ${widget.userId} \n'
                        '타이틀 : ${userData['title']} \n'
                        '상태 : ${userData['completed']}',
                          style: TextStyle(
                            fontSize: 24,
                          ),
                        ),
                      ),
                      TextButton(onPressed: () => {}, child: Text('이전 글')),
                      TextButton(onPressed: () => {}, child: Text('다음 글'))
                    ],
                  )
              );
            }
        )
    );
  }
}