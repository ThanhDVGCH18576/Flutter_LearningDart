// ignore_for_file: unused_field, unused_import, implementation_imports, unnecessary_import

import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class BottomNavagation extends StatefulWidget {
  final int tabKey;

  const BottomNavagation({super.key, required this.tabKey});

  @override
  State<BottomNavagation> createState() => _BottomNavagationState();
}

class _BottomNavagationState extends State<BottomNavagation> {
  //Navbar bottom
  late int _selectedIndex = widget.tabKey;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 20, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    Text(
      'Index 2: Add item',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
        Navigator.of(context).pushNamedAndRemoveUntil(
          '/home-screen/',
          (route) => false,
        );
        break;
      case 1:
        Navigator.of(context).pushNamedAndRemoveUntil(
          '/note/',
          (route) => false,
        );
        break;
      case 2:
        Navigator.of(context).pushNamedAndRemoveUntil(
          '/input_form/',
          (route) => false,
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.business),
          label: 'Chart',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.add_business),
          label: 'Add item',
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.amber[800],
      onTap: _onItemTapped,
    );
  }
}
