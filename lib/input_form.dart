// ignore_for_file: library_private_types_in_public_api, unused_element, unnecessary_null_comparison, unused_import, sort_child_properties_last, deprecated_member_use

import 'package:flutter/material.dart';
import 'views/bottom_navigation.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Landing Page',
      home: LandingPage(),
    );
  }
}

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavagation(tabKey: 0),
      backgroundColor: Color.fromARGB(255, 225, 222, 235),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/background.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Image.asset(
              //   'assets/logo.png',
              //   height: 100,
              // ),
              SizedBox(height: 16),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Text(
                    'Welcome to Demotrations App',
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 32),
              ElevatedButton(
                onPressed: () {},
                child: Text('Get Started',
                    style: TextStyle(
                      color: Colors.white,
                    )),
                style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(255, 205, 12, 239),
                  padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                  textStyle: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
