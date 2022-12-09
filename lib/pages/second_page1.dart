
// ignore_for_file: unused_import, use_key_in_widget_constructor, must_be_immutables, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider_app/pages/home_page.dart';

// ignore: must_be_immutable
class Page1 extends StatelessWidget {

  // data에서 userId, id, title 받아와서 출력해야댐

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(40, 20, 40, 20),
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
            onPressed: () => context.go('/'),
            child: Container(
              padding: EdgeInsets.fromLTRB(40, 20, 40, 20),
              child: Text('대충살자',
                style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 20,
                    color: Colors.black
                ),
              ),
            ),
          ),
          const SizedBox(height: 10,),
        ],
      ),
    );
  }
}