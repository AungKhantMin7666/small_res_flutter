import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:small_res/models/menuItem.model.dart';
import 'package:small_res/api/api.dart';
import 'package:small_res/widgets/menuItem.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<MenuItem>> getMenuItem;

  @override
  void initState() {
    super.initState();
    getMenuItem = Api().getMenuItem();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<MenuItem>>(
        future: getMenuItem,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          } else if (snapshot.hasError) {
            return Scaffold(
              body: Center(child: Text('Error: ${snapshot.error}')),
            );
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Scaffold(
              body: Center(child: Text('No data found')),
            );
          } else if (snapshot.hasData) {
            return MenuItems(menuItem: snapshot);
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}
