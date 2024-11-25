import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_5/Home.dart';
import 'package:flutter_application_5/ManagementCats.dart';
import 'package:flutter_application_5/Petprofile.dart';
import 'package:flutter_application_5/sign_in_view.dart';
import 'package:flutter_application_5/sign_up_view.dart';
import 'package:flutter_application_5/welcome_view.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp( const CatPost());
}
class CatPost extends StatelessWidget {
  const CatPost({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,

      theme: ThemeData(
        scaffoldBackgroundColor: Color.fromARGB(0, 0, 0, 0),
      ),
     home: WelcomeView(),
    
      
       initialRoute: "welcome_view",
      routes: {
        'sign_in_view': (context) => const SignInView(),
        'sign_up_view': (context) => const SignUpView(),
        'welcome_view': (context) => const WelcomeView(),
        'management_view': (context) => Management(),
        'home_view': (context) => const Home(),
      },
    );
  }
}
