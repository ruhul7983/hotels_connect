import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hotels_connect/constants.dart';
import 'package:hotels_connect/views/screens/bottom_nav/booking.dart';
import 'package:hotels_connect/views/screens/bottom_nav/profile.dart';
import 'package:hotels_connect/views/screens/bottom_nav/search_screen.dart';

import 'home_page.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({Key? key}) : super(key: key);

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  final _page = [HomePage(), Search(), Booking(), Profile()];
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: mainColor,
        backgroundColor: Colors.black,
        unselectedItemColor: Colors.black,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.home),label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.search),label: "Search"),
          BottomNavigationBarItem(icon: Icon(Icons.list_alt_outlined),label: "Booking"),
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.profile_circled),label: "Profile"),
        ],
        onTap: (index){
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      body: _page[_currentIndex],
    );
  }
}

