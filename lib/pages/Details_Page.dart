
// ignore_for_file: must_be_immutable, library_private_types_in_public_api, unnecessary_string_interpolations

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../fetch_post.dart';

// 클릭한 타이틀의 유저 정보 상세보기 데이터 불러오기
class DetailPage extends StatefulWidget {
  String userId;
  String Id;

  DetailPage({Key? key, required this.userId, required this.Id,required this.test }) : super(key: key);
  final Map test;

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
                  child: Container(
                    margin: EdgeInsets.fromLTRB(20, 40, 20, 40),
                    child: Column(
                        children: <Widget>[
                          SizedBox(
                            child : Text('빈 공백이 너무 많아서 채우기 위한 글 \n',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.grey.shade500,
                              ),)
                          ),
                          Text(
                            '아이디 : ${widget.Id}',
                            style: TextStyle(
                              fontSize: 22,
                            ),
                          ),
                          Text(
                            '유저아이디 : ${widget.userId}',
                            style: TextStyle(
                              fontSize: 22,
                            ),
                          ),
                          Text(
                            '타이틀 : ${userData['title']}',
                            style: TextStyle(
                              fontSize: 22,
                            ),
                          ),
                          Text(
                            '상태 : ${userData['completed']}',
                            style: TextStyle(
                              fontSize: 22,
                            ),
                          ),
                          Container(
                              height: 100,
                              margin: EdgeInsets.only(top: 30),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Expanded(
                                      child: TextButton(
                                        onPressed: () => {

                                        },
                                        child: Text('이전 글',
                                          style: TextStyle(
                                              fontSize: 20
                                          ),
                                        ),
                                      )
                                  ),
                                  Expanded(
                                      child: TextButton(
                                        onPressed: () => {

                                        },
                                        child: Text('다음 글',
                                          style: TextStyle(
                                              fontSize: 20
                                          ),
                                        ),
                                      )
                                  ),
                                ],
                              )
                          )
                        ],
                    ),
                  ),
              );
            }
        )
    );
  }
}