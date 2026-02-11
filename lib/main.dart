import 'package:flutter/material.dart';
import 'homeScreen.dart'; // yoki fayl noming qanday bo‘lsa

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(   // ❌ const ni olib tashla
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
