import 'package:flutter/material.dart';
import 'package:gym_tool_kit/SignUp_LoginPage/Login_Screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
    scaffoldBackgroundColor:Colors.grey[100],
    primarySwatch: Colors.deepPurple,
  ),
      home: LoginScreen(),
    );
  }
}
