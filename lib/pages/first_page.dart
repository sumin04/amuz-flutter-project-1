
// ignore_for_file: library_private_types_in_public_api, sort_child_properties_last, unused_local_variable, unused_import, unnecessary_brace_in_string_interps

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider_app/pages/home_page.dart';

import '../fetch_post.dart';
import 'second_page.dart';

class FirstPage extends StatefulWidget  {
  FirstPage({Key? key}) : super(key: key);

  @override
  _FirstPageState createState() => _FirstPageState();
// static이란 일반 객체를 만들 때, 같이 메모리에 저장하는 것이 아닌
// 따로 메모리를 두어 static 구문을 객체가 공유하여 사용할 수 있게 해주는 구문
}

class _FirstPageState extends State<FirstPage> {
  Future<List>? data;
  List<dynamic> list = [];

  List<dynamic> total = [];
  List<dynamic> totals = [];

  Future<dynamic> init() async {
    data = fetchPost(list);
    await data;

    for(var i = 0 ; i < list.length ; i++){
      totals.add(list[i]);
      if(list[i]['userId'] == list[i]['userId']){
        total.remove(list[i]['userId']);
      }
      total.add(list[i]['userId']);
    }

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
    init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('User List Page',
            style: TextStyle(
              fontSize: 23,
            ),
          ),
          automaticallyImplyLeading: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            // 뒤로가기 버튼
            onPressed: () {
              // Navigator.pop(context);
              context.go('/');
            }
          ),
            toolbarHeight: 70,
          ),
          body: FutureBuilder(
            future: data,
            builder: (BuildContext context, AsyncSnapshot snapshot){
              if(snapshot.hasData == false){
                return Center(
                  child: SizedBox(
                    width: 200,
                    height: 200,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.blue.shade900),
                      strokeWidth: 20,
                    )
                  ),
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
                            height: 110,
                            child: Card(
                              margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: TextButton(
                                onPressed: (){
                                //   var userId = total[index];
                                  log('아무거나${total[index]}');
                                  context.go('/second/${total[index]}');
                                // context.push(
                                //   '/second/:${total[index]}',
                                //   arguments: (totals),
                                // );
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
    );
  }
}