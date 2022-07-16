import 'package:flutter/material.dart';
import 'package:netflixapp/presentation/mainpage/main_page.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.black,
        backgroundColor: Colors.white,
        textTheme:
        Theme.of(context).textTheme.apply(
      bodyColor: Colors.white,
      // displayColor: Colors.pinkAccent,
    ),
        primarySwatch: Colors.red,
      ),
      home:  ScreenMainPage(),
    );
  }
}

