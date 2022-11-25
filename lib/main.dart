import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter를 이용한 프론트엔드 과제 1'),
          centerTitle: true,
        ),

        // 데이터 값
        body: Container(
          // alignment: Alignment.bottomCenter,
          child: Container(
            width: double.infinity, height: 50,
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.black12)
            ),
            child: Text('데이터 값 불러오기',
              style: TextStyle(fontWeight: FontWeight.w700),
            ),

          ),
        ),
        bottomNavigationBar: BottomAppBar(
          // 컨테이너 보다 가볍다
          child: SizedBox(
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(Icons.phone),
                Icon(Icons.message),
                Icon(Icons.contact_page),
              ],
            ),
          ),
        ),
      ),
    );
  }
}