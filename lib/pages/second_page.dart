
// ignore_for_file: unused_import, prefer_final_field, unnecessary_news, unnecessary_new, prefer_final_field, unused_fields, unused_field, prefer_final_fields


import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider_app/pages/home_page.dart';

import '../second_page1.dart';
import '../second_page2.dart';
import '../second_page3.dart';


class SecondPage extends StatefulWidget {
  final String userId;

  const SecondPage({Key? key, required this.userId}) : super(key: key);

  @override
  SecondPageState createState() => SecondPageState();
}

class SecondPageState extends State<SecondPage> {
  var _index = 0;
  var _pages = [

  ];

  @override
  void initState() {
    _pages = [
      Page1(userId: widget.userId),
      Page2(userId: widget.userId),
      Page3(userId: widget.userId),
    ];
    // TODO: implement initState
    super.initState();
    // log('SecondPage 짜잔${widget.userId}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Post List Page'),
        toolbarHeight: 70,
        backgroundColor: Colors.blue.shade700,
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            // 뒤로가기 버튼
            onPressed: () {
              context.go('/first');
            }
        ),
      ),
      body: _pages[_index],
      bottomNavigationBar: BottomNavigationBar(
        selectedIconTheme: IconThemeData(
          color: Colors.blueAccent,
        ),
        selectedItemColor: Colors.grey,
        onTap: (index) {
          setState(() {
            _index = index;
          });
        },
        currentIndex: _index,
        items: <BottomNavigationBarItem>[
          // 하단 탭 메뉴 구성
          BottomNavigationBarItem(
              label: '전체',
              icon: Icon(Icons.clear_all)
          ),
          BottomNavigationBarItem(
              label: '작성중',
              icon: Icon(Icons.edit)
          ),
          BottomNavigationBarItem(
              label: '완료',
              icon: Icon(Icons.done_all)
          ),
        ],
      ),
    );
  }
}