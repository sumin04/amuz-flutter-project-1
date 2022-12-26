// ignore_for_file: avoid_web_libraries_in_flutter, use_key_in_widget_constructors, recursive_getters

// import 'dart:js';

// ignore_for_file: library_private_types_in_public_api, avoid_unnecessary_containers, override_on_non_overriding_member, curly_braces_in_flow_control_structures, unnecessary_brace_in_string_interps, unnecessary_this, unused_element, non_constant_identifier_nam, unused_import, unused_importes, unused_local_variable, empty_statements, camel_case_types, sized_box_for_whitespace, sort_child_properties_last

import 'dart:async';
// import 'dart:collection';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'package:go_router/go_router.dart';
import 'package:provider_app/pages/home_page.dart';
import 'package:provider_app/pages/user_list.dart';
import 'package:provider_app/pages/post_list.dart';
import 'package:provider_app/router.dart';

import 'package:url_strategy/url_strategy.dart';

void main() {
  setPathUrlStrategy();
  runApp (MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routerConfig: router,
    );
  }
}

// error
class ErrorScreen extends StatelessWidget {
  final Exception? error;
  const ErrorScreen({Key? key, required this.error}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Error"),
      ),
      body: Center(
        child: Text(
            error.toString()
        ),
      ),
    );
  }
}