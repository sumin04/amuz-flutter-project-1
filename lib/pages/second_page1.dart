
// ignore_for_file: unused_import, use_key_in_widget_constructor, must_be_immutables, use_key_in_widget_constructor, library_private_types_in_public_api, library_private_types_in_public_apis, unnecessary_brace_in_string_interps, duplicate_ignor, unnecessary_newe, unnecessary_ne, duplicate_ignorew, duplicate_ignore, unnecessary_ne, must_be_immutablew, must_be_immutable, use_key_in_widget_constructors

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider_app/pages/home_page.dart';

import '../fetch_post.dart';

class Page1 extends StatefulWidget {
  var userId;
  Page1({Key? key, required this.userId}) : super(key: key);
   // final userId;

  @override
  _UserDataListState createState() => _UserDataListState();
  // State<StatefulWidget> createState() => new _UserDataListState();
}

class _UserDataListState extends State<Page1> {
  // dynamic userIdTest = userId;
  Future<List>? data;
  List<dynamic> list = [];

  List<dynamic> test = [];
  List<dynamic> total = [];

  Future<dynamic> init() async {
    data = fetchPost(list);
    await data;

    // for(var i = 1; i < list.length; i++){
    //   if(list[i]['userId'] == 1){
    //     test.add(list[i]);
    //   }
    // }

    for(var i = 1; i < list.length; i++){
      if(list[i]['userId'] == 1){
        test.add(list[i]);
      }
    }
    print('test');

    // print(userId);

    // print(test.length);
  }

  @override
  void initState() {
    super.initState();
    init();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
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
                itemCount: test.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {

                    },
                    child: Text(test[index].toString(),
                      style: TextStyle(
                        fontSize: 10,
                      ),
                    ),
                  );
                }
            ),
          );
        }
      },
    );
  }
}