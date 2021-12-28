// ignore: unused_import
import 'package:flutter/material.dart';
import 'package:regiterphonenumber/registerwithphonenumber.dart';
// ignore: unused_import

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Register',
      theme: ThemeData(
          brightness: Brightness.light,
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity),
      home: const RegisterWithPhoneNumber(),
    );
  }
}
