import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'sign_in_view.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final _userNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _cofirmPasswordController = TextEditingController();
  var _image;
  final _formKey = GlobalKey<FormState>();
  bool _isPasswordObsecure = true;
  bool _isCofirmPassObsecure = true;
  String pickedFilePath = '';
  Future<void> _pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      pickedFilePath = pickedFile.path;
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5EDE2),
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: _pickImage,
                        child: Container(
                          width: 150,
                          height: 150,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: const LinearGradient(
                              colors: [
                                Color.fromARGB(255, 245, 119, 81),
                                Color(0xFFFF7043)
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.3),
                                blurRadius: 10,
                                offset: const Offset(0, 5),
                              ),
                            ],
                          ),
                          child: _image == null
                              ? const Center(
                                  child: Text(
                                    'Photo+',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                )
                              : ClipOval(
                                  child: Image.file(
                                    _image,
                                    fit: BoxFit.cover,
                                    width: 150,
                                    height: 150,
                                  ),
                                ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 15),
                Container(
                  width: 450,
                  margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Username',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      TextFormField(
                        style: const TextStyle(
                          color: Color.fromARGB(255, 73, 70, 70),
                          fontSize: 22,
                        ),
                        autofocus: true,
                        enableSuggestions: false,
                        autocorrect: false,
                        controller: _userNameController,
                        decoration: const InputDecoration(
                          errorStyle: TextStyle(
                            fontSize: 18,
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'Enter Username ',
                          hintStyle: TextStyle(
                            color: Color.fromARGB(255, 100, 99, 99),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xFFED7A4D),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(30.0),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xFFED7A4D),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(30.0),
                            ),
                          ),
                          suffixIcon: Icon(
                            Icons.person,
                            color: Color.fromARGB(255, 73, 70, 70),
                          ),
                        ),
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              value.length < 5) {
                            return 'Please enter at least 5 characters';
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 25),
                Container(
                  width: 450,
                  margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Email',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      TextFormField(
                        style: const TextStyle(
                          color: Color.fromARGB(255, 73, 70, 70),
                          fontSize: 22,
                        ),
                        autofocus: true,
                        enableSuggestions: false,
                        autocorrect: false,
                        controller: _emailController,
                        decoration: const InputDecoration(
                          errorStyle: TextStyle(
                            fontSize: 18,
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'Enter Email ',
                          hintStyle: TextStyle(
                            color: Color.fromARGB(255, 100, 99, 99),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xFFED7A4D),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(30.0),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xFFED7A4D),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(30.0),
                            ),
                          ),
                          suffixIcon: Icon(
                            Icons.email,
                            color: Color.fromARGB(255, 73, 70, 70),
                          ),
                        ),
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              !RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                            return 'Please enter a valid email';
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 25),
                Container(
                  width: 450,
                  margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Password',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      TextFormField(
                        style: const TextStyle(
                          color: Color.fromARGB(255, 73, 70, 70),
                          fontSize: 22,
                        ),
                        enableSuggestions: false,
                        autocorrect: false,
                        obscureText: _isPasswordObsecure,
                        controller: _passwordController,
                        decoration: InputDecoration(
                          errorStyle: const TextStyle(
                            fontSize: 18,
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'Enter Password ',
                          hintStyle: const TextStyle(
                            color: Color.fromARGB(255, 100, 99, 99),
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xFFED7A4D),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(30.0),
                            ),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xFFED7A4D),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(30.0),
                            ),
                          ),
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                _isPasswordObsecure = !_isPasswordObsecure;
                              });
                            },
                            icon: Icon((_isPasswordObsecure) == true
                                ? Icons.visibility
                                : Icons.visibility_off),
                          ),
                        ),
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              value.length < 5) {
                            return 'Please enter at least 5 characters';
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 25),
                Container(
                  width: 450,
                  margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Confirm Password',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      TextFormField(
                        style: const TextStyle(
                          color: Color.fromARGB(255, 73, 70, 70),
                          fontSize: 22,
                        ),
                        enableSuggestions: false,
                        autocorrect: false,
                        obscureText: _isCofirmPassObsecure,
                        controller: _cofirmPasswordController,
                        decoration: InputDecoration(
                          errorStyle: const TextStyle(
                            fontSize: 18,
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'Repeat Password ',
                          hintStyle: const TextStyle(
                            color: Color.fromARGB(255, 100, 99, 99),
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xFFED7A4D),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(30.0),
                            ),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xFFED7A4D),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(30.0),
                            ),
                          ),
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                _isCofirmPassObsecure = !_isCofirmPassObsecure;
                              });
                            },
                            icon: Icon((_isCofirmPassObsecure) == true
                                ? Icons.visibility
                                : Icons.visibility_off),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a valid password';
                          } else if (value != _passwordController.text) {
                            return 'Please renter the same password';
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 50),
                // sign in Button
                DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [
                        Color.fromARGB(255, 245, 119, 81),
                        Color(0xFFFF7043)
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: TextButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        if (_passwordController.text ==
                            _cofirmPasswordController.text) {
                          Map<String, String> newUser = {
                            'username': _userNameController.text,
                            'password': _passwordController.text,
                            'email': _emailController.text,
                            'image': pickedFilePath,
                          };
                          userData.add(newUser);
                          Navigator.pushNamed(context, 'sign_in_view');
                        }
                      }
                    },
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.fromLTRB(150, 13, 150, 13),
                    ),
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Georgia',
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                // sign up text.
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, 'sign_in_view');
                  },
                  child: const Text(
                    'Already have an account? Click Here!',
                    style: TextStyle(
                      fontSize: 18,
                      color: Color.fromARGB(255, 73, 70, 70),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
