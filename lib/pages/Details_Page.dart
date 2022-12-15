
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// 클릭한 타이틀의 유저 정보 상세보기 데이터 불러오기
class DetailPage extends StatefulWidget {
  String userId;

  DetailPage({Key? key, required this.userId}) : super(key: key);

  @override
  _UserDetail createState() => _UserDetail();
}

class _UserDetail extends State<DetailPage>{


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('상세 데이터 페이진데 먼가 이상하다...',
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
      body: Container(
        child: (
            SizedBox(
              child: TextButton(
                onPressed: (){
                  context.go('/second/${widget.userId}');
                },
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

    //     body: Container(
    //       child: (
    //           SizedBox(
    //             child: TextButton(
    //               onPressed: (){
    //                 context.go('/second/${widget.userId}');
    //               },
    //               child: Text('${widget.userId}',
    //                 style: TextStyle(
    //                   fontSize: 20,
    //                 ),
    //               ),
    //             ),
    //           )
    //       ),
    //     )
    // );
  }
}
