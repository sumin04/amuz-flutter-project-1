
// ignore_for_file: library_private_types_in_public_api, sort_child_properties_last, unused_local_variable

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../fetch_post.dart';

class FirstPage extends StatefulWidget  {
  FirstPage({Key? key, required int userId}) : super(key: key);

  @override
  _FirstPageState createState() => _FirstPageState();
// static이란 일반 객체를 만들 때, 같이 메모리에 저장하는 것이 아닌
// 따로 메모리를 두어 static 구문을 객체가 공유하여 사용할 수 있게 해주는 구문
// static const String title = '[ Amuz - project ] Home Page';

// 라우터 세팅

}
// the screen of the 1 page
class _FirstPageState extends State<FirstPage> {
  late Future<List> test;
  List<dynamic> list = [];

  List<dynamic> total = [];
  List<dynamic> totals = [];

  Future<dynamic> init() async {
    test = fetchPost(list);
    await test;

    print('start map');
    for(var i = 1 ; i < list.length ; i++){
      totals.add(list[i-1]);
      if(list[i-1]['userId'] == list[i]['userId']){
        total.remove(list[i-1]['userId']);

      }
      total.add(list[i]['userId']);
    }

    print('end map');
    return totals;
    // for(var i = 0; i < totals.length; i++){
    //   if(totals[i]['userId'] == 클릭한 유저 아이디 번호){
    //     print(totals[i]);
    //   }
    // }
    // print(total);
    // print(totals);
  }

  @override
  void initState() {
    // 위젯이 생성될때 처음으로 호출되는 메서드
    // initState는 오직 한번 만 호출 된다.또한 반드시 super.initState()를 호출해야 한다.
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),

      home: Scaffold(
        appBar: AppBar(
          title: Text('User List Page',
            style: TextStyle(
              fontSize: 23,
              color: Colors.black,
            ),
          ),
          automaticallyImplyLeading: true,
          leading: IconButton(
              icon: Icon(Icons.arrow_back_ios),
              // onPressed: () { Get.back(); }),
              onPressed: () { context.pop(); }),
          toolbarHeight: 70,
        ),
        body: FutureBuilder(
            future: test,
            builder: (BuildContext context, AsyncSnapshot snapshot){
              if(snapshot.hasData == false){
                return SizedBox(
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.blueAccent,
                    strokeWidth: 20,
                  ),
                  width: 200,
                  height: 200,
                );
              } else if(snapshot.hasError){
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                      'Error: ${snapshot.error}'
                  ),
                );
              }
              else{
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView.builder(
                      itemCount: total.length,
                      itemBuilder: (context, index) {
                        final document = total[index];
                        return InkWell(
                          onTap: () {

                          },
                          child: SizedBox(
                            width: 200,
                            height: 150,
                            child: Card(
                                margin: EdgeInsets.fromLTRB(0, 20, 0, 20),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child: TextButton(
                                  onPressed: (){
                                    var userId = total[index];
                                    context.go('/first/$userId');
                                  },
                                  child: Text(total[index].toString(),
                                    style: TextStyle(
                                      fontSize: 30,
                                    ),
                                  ),
                                )
                            ),
                          ),
                        );
                      }
                  ),
                );
              }
            }
        ),
      ),
    );
  }
}

