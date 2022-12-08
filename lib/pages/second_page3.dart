
// ignore_for_file: unused_import, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider_app/pages/home_page.dart';

class Page3 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        '완료된 데이터 띄워라',
        style: TextStyle(fontSize: 30),
      ),
    );
  }
}