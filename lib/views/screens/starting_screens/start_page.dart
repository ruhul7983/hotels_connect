import 'package:flutter/material.dart';
import 'package:hotels_connect/views/screens/starting_screens/starting_1.dart';
import 'package:hotels_connect/views/screens/starting_screens/starting_2.dart';
import 'package:hotels_connect/views/screens/starting_screens/starting_3.dart';

class StartPage extends StatefulWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  final controller = PageController(
    initialPage: 0,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: controller,
        children: [
          Starting1(),
          Starting2(),
          Starting3(),
        ],
      ),
    );
  }
}
