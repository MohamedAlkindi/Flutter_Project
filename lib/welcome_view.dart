// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5EDE2),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(0, 50, 15, 0),
            child: Image.asset(
              'images/illustration.png',
              height: 400,
              width: 400,
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(15, 15, 15, 50),
            child: Column(
              children: const [
                Text(
                  'Join us in giving\n every cat a loving home.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w800,
                      fontFamily: 'Georgia'),
                ),
                SizedBox(height: 25),
                Text(
                  'Your new best friend is just one tap away!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Georgia'),
                ),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color.fromARGB(255, 245, 119, 81), Color(0xFFFF7043)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(30),
            ),
            margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
            child: TextButton(
              onPressed: () {
                Navigator.pushNamed(context, 'sign_in_view');
              },
              style: TextButton.styleFrom(
                padding: const EdgeInsets.fromLTRB(150, 13, 150, 13),
              ),
              child: const Text(
                'Sign In',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Georgia',
                ),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color.fromARGB(255, 245, 119, 81), Color(0xFFFF7043)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(30),
            ),
            margin: const EdgeInsets.only(top: 25),
            child: TextButton(
              onPressed: () {
                Navigator.pushNamed(context, 'sign_up_view');
              },
              style: TextButton.styleFrom(
                padding: const EdgeInsets.fromLTRB(150, 13, 150, 13),
              ),
              child: const Text(
                'Sign Up',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Georgia',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
