import 'package:flutter/material.dart';
import 'package:flutter_application_route/page1.dart';
import 'package:flutter_application_route/page2.dart';
import 'package:flutter_application_route/page3.dart';
import 'package:flutter_application_route/page4.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<BottomNavigationBarItem> bottom_items = [
    const BottomNavigationBarItem(label: 'Home', icon: Icon(Icons.home)),
    const BottomNavigationBarItem(label: 'Chat', icon: Icon(Icons.chat)),
    const BottomNavigationBarItem(
        label: 'Shop', icon: Icon(Icons.shop_rounded)),
    const BottomNavigationBarItem(label: 'My', icon: Icon(Icons.people)),
  ];

  int now = 0; // 현재 0번 인덱스
  List pages = [const Page1(), const Page2(), const Page3(), const Page4()];
  var now_Page;
  void change_Page(int page) {
    setState(() {
      now = page;
      now_Page = pages[page];
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: now_Page,
        bottomNavigationBar: BottomNavigationBar(
            onTap: (value) {
              change_Page(value);
            },
            currentIndex: now,
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.cyan,
            items: bottom_items),
      ),
    );
  }
}
