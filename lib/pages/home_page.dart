// ignore_for_file: avoid_unnecessary_containers, unused_import

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  // BuildContext는 위젯의 정보를 가지고 있는것이며,
  // build 메소드에 의해 전해지는 context는 부모 위젯까지의 정보만을 가지고 있다.
  Widget build(BuildContext context) => MaterialApp(
    home: Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(title: const Text('[ Amuz - project ] Home Page',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
        toolbarHeight: 70,
        backgroundColor: Colors.black54,
      ),
      body: SingleChildScrollView(
        child:Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              margin: EdgeInsets.fromLTRB(0, 40, 0, 80),
              alignment: Alignment.center,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white60,
                    side: BorderSide(
                        width:1,
                        color:Colors.grey
                    ),
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)
                    )
                ),
                onPressed: (){
                  context.go('/first');
                },
                child: Container(
                  padding: EdgeInsets.fromLTRB(40, 20, 40, 20),
                  child: Text('User List Page로 이동하기',
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 20,
                      color: Colors.black
                    ),
                  ),
                ),
              ),
            ),
            Container(
              child: Image(image: AssetImage('assets/amuz-project-1.png')),
            ),
          ],
        ),
      )
    ),
  );
}
