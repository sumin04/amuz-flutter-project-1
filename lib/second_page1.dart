
// ignore_for_file: unused_import, use_key_in_widget_constructor, must_be_immutables, use_key_in_widget_constructor, library_private_types_in_public_api, library_private_types_in_public_apis, unnecessary_brace_in_string_interps, duplicate_ignor, unnecessary_newe, unnecessary_ne, duplicate_ignorew, duplicate_ignore, unnecessary_ne, must_be_immutablew, must_be_immutable, use_key_in_widget_constructor, avoid_web_libraries_in_flutter, unused_local_variables, unused_local_variable, non_constant_identifier_names

import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider_app/pages/Details_Page.dart';
import 'package:provider_app/pages/home_page.dart';

import 'fetch_post.dart';

class Page1 extends StatefulWidget {
  var userId;
  var Id;

  Page1({Key? key, required this.userId}) : super(key: key);

  @override
  _UserDataListState createState() => _UserDataListState();
}

class _UserDataListState extends State<Page1> {
  Future<List>? data;
  List<dynamic> list = [];
  List<dynamic> test = [];

  Future<dynamic> init() async {
    final userId = int.parse(widget.userId);
    data = fetchPost(list);
    await data;

    for(var i = 0; i < list.length; i++){
      if(list[i]['userId'] == userId){
        test.add(list[i]);
      }
    }
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
                  valueColor: AlwaysStoppedAnimation<Color>(
                      Colors.blue.shade900),
                  strokeWidth: 20,
                )
            ),
          );
        } else if(snapshot.hasError){
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
                'Error: ${snapshot.error}'
            ),
          );
        }
        else{
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: ListView.builder(
                itemCount: test.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {

                    },
                    child: SizedBox(
                      height: 100,
                      child: Card(
                          color: Color(0xfff5f5f5),
                          margin: EdgeInsets.fromLTRB(5, 10, 5, 10),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: TextButton(
                            onPressed: () async{
                              final person = widget.userId;
                              context.go('/second/${person}/detail/${test[index]['id']}', extra: test[index]);

                              Navigator.pushNamed(context, '/second/${person}/detail/${test[index]['id']}');
                              log('아무말이나${test}');
                            },
                            child: Text('${test[index]['title']}',
                              style: TextStyle(
                                overflow: TextOverflow.ellipsis,
                                color: Colors.grey.shade700,
                                fontSize: 20,
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
      },
    );
  }
}