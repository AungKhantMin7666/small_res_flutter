import 'package:flutter/material.dart';
import 'package:small_res/screens/login_screen.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Res extends StatefulWidget {
  const Res({super.key});

  @override
  State<Res> createState() {
    return _ResState();
  }
}

class _ResState extends State<Res> {
  String activeScreen = 'login_screen';

  @override
  Widget build(BuildContext context) {
    Widget screenWidget = const LoginScreen();

    return screenWidget;
  }
}
