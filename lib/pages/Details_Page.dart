import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('페이지 이동',
            style: TextStyle(
              fontSize: 23,
            ),
        ),
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            // 뒤로가기 버튼
            onPressed: () {
              // Navigator.pop(context);
              context.go('/first');
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
              child: Text('대충 그럴싸한 글자\n{ } 빼고 데이터 띄우고 싶어요 힝구리핑퐁',
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
