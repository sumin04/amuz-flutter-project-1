
// ignore_for_file: must_be_immutable, library_private_types_in_public_api, unnecessary_string_interpolations

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../fetch_post.dart';

// 클릭한 타이틀의 유저 정보 상세보기 데이터 불러오기
class DetailPage extends StatefulWidget {
  String userId;
  String Id;

  DetailPage({Key? key, required this.userId, required this.Id}) : super(key: key);

  @override
  _UserDetail createState() => _UserDetail();
}

class _UserDetail extends State<DetailPage> {

  @override
  Widget build(BuildContext context) {
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
              child: Card(
                  color: Color(0xfff5f5f5),
                  margin: EdgeInsets.fromLTRB(5, 10, 5, 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: SizedBox(
                    height: 70,
                    child: TextButton(
                      onPressed: () {
                        context.go('/second/${widget.userId}');
                      },
                      child: Text(
                        '아이디 : ${widget.Id} \n'
                        '유저아이디 : ${widget.userId} \n'
                        // '글 : ${widget.title} \n'
                        ,
                      // child: Text('유저 아이디 : ' + widget.userId.toString(),
                        style: TextStyle(
                          fontSize: 24,
                        ),
                      ),
                    ),
                  )
                )
              );
            }
        )
    );
  }
}