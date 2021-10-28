import 'dart:io';

import 'package:dummy_task/constants.dart';
import 'package:dummy_task/views/screens/about_us.dart';
import 'package:dummy_task/views/screens/use.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  final int initialChangeIndex;

  const HomeScreen({
    Key? key,
    required this.initialChangeIndex,
  }) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _controller;
  int _currentIndex = 0;
  final int _initialIndex = 1;

  @override
  void initState() {
    super.initState();
    _controller =
        TabController(length: 2, vsync: this, initialIndex: _initialIndex);
    _currentIndex = _initialIndex == 0 ? 0 : _initialIndex;
    super.initState();
  }

  test() {
    setState(() {
      _controller.index == 1 ? exit(0) : _controller.index = 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return test();
      },
      child: SafeArea(
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(100.0),
            child: AppBar(
              backgroundColor: primaryColor,
              title: const Text("Home"),
              bottom: TabBar(
                controller: _controller,
                indicatorColor: Colors.white,
                tabs: <Widget>[
                  SizedBox(
                    width: sizeWidth(context) * 1.5,
                    child: const Tab(text: "About Us"),
                  ),
                   SizedBox(
                    width: sizeWidth(context) * 1.5,
                    child: const Tab(text: "How to use"),
                  ),
                ],
              ),
            ),
          ),
          body: TabBarView(
            controller: _controller,
            children: const [
              AboutUsScreen(),
              UseScreen(),
            ],
          ),
        ),
      ),
    );
  }
}
