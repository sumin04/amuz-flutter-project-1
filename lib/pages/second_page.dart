
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider_app/pages/home_page.dart';

class SecondPage extends StatefulWidget {
  final String userId;
  const SecondPage({Key? key, required this.userId}) : super(key: key);
  @override
  SecondPageState createState() => SecondPageState();
}
class SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('상세데이터 페이지임',
    ),
      toolbarHeight: 70,
      backgroundColor: Colors.black54,
    ),
    body: Container(
      margin: EdgeInsets.symmetric(vertical: 20.0),
      alignment: Alignment.center,
      child: Column(
        children: <Widget>[
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white60,
                side: BorderSide(width:1, color:Colors.grey), //border width and color
                elevation: 4,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)
                )
            ),
            // onPressed: () => context.go('/'),
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
            },
            child: Container(
              padding: EdgeInsets.fromLTRB(40, 20, 40, 20),
              child: Text('안돼 돌아가',
                style: TextStyle(fontWeight: FontWeight.normal,fontSize: 20, color: Colors.black),
              ),
            ),
          ),
          const SizedBox(height: 10,),
        ],
      ),
    ),
  );
}
