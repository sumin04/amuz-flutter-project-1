
// ignore_for_file: unused_import, prefer_final_fields

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider_app/pages/home_page.dart';

import 'second_page1.dart';
import 'second_page2.dart';
import 'second_page3.dart';

class SecondPage extends StatefulWidget {
  final String userId;
  final List totals;
  const SecondPage({Key? key, required this.userId, required this.totals}) : super(key: key);

  @override
  SecondPageState createState() => SecondPageState();
}
class SecondPageState extends State<SecondPage> {

  var _index = 0;
  var _pages = [
    Page1(),
    Page2(),
    Page3(),
  ];

  get totals => totals;


  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: Text(totals),
      toolbarHeight: 70,
      backgroundColor: Colors.black54,
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
      onTap: (index){
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
            // icon: Icon(Icons.clear_all)
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
  // void Test(){
  //   print(totals);
  // }
}

// class SecondPage extends StatefulWidget {
//   final String userId;
//   const SecondPage({Key? key, required this.userId}) : super(key: key);
//   @override
//   SecondPageState createState() => SecondPageState();
// }
// class SecondPageState extends State<SecondPage> {
//   var _index = 0;
//
//   @override
//   Widget build(BuildContext context) => Scaffold(
//     appBar: AppBar(title: const Text('Post List Page'),
//       toolbarHeight: 70,
//       backgroundColor: Colors.black54,
//       leading: IconButton(
//           icon: Icon(Icons.arrow_back_ios),
//           // 뒤로가기 버튼
//           onPressed: () {
//             // Navigator.pop(context);
//             context.go('/first');
//           }
//       ),
//     ),
//     body: Container(
//       margin: EdgeInsets.symmetric(vertical: 20.0),
//       alignment: Alignment.center,
//       child: Column(
//         children: <Widget>[
//           ElevatedButton(
//             style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.white60,
//                 side: BorderSide(width:1, color:Colors.grey), //border width and color
//                 elevation: 4,
//                 shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(15)
//                 )
//             ),
//             onPressed: () => context.go('/'),
//             child: Container(
//               padding: EdgeInsets.fromLTRB(40, 20, 40, 20),
//               child: Text('안돼 홈페이지로 돌아가',
//                 style: TextStyle(fontWeight: FontWeight.normal,fontSize: 20, color: Colors.black),
//               ),
//             ),
//           ),
//           const SizedBox(height: 10,),
//         ],
//       ),
//     ),
//     bottomNavigationBar: BottomNavigationBar(
//       selectedIconTheme: IconThemeData(
//         color: Colors.black26,
//       ),
//       selectedItemColor: Colors.grey,
//       onTap: (index){
//         setState(() {
//           _index = index;
//         });
//       },
//       currentIndex: _index,
//       items: <BottomNavigationBarItem>[
//         // 하단 탭 메뉴 구성
//         BottomNavigationBarItem(
//             label: '전체',
//             icon: Icon(Icons.home)
//         ),
//         BottomNavigationBarItem(
//             label: '작성중',
//             icon: Icon(Icons.home)
//         ),
//         BottomNavigationBarItem(
//             label: '완료',
//             icon: Icon(Icons.home)
//         ),
//       ],
//     ),
//   );
// }