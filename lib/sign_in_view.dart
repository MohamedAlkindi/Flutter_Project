import 'package:flutter/material.dart';

class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

List<Map<String, String>> userData = [];

class _SignInViewState extends State<SignInView> {
  final _userNameController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isObsecure = true;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        backgroundColor: const Color(0xFFF5EDE2),
        body: Center(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.65,
                    height: MediaQuery.of(context).size.height * 0.25,
                    child: Image.asset(
                      'images/cat-lover.png',
                    ),
                  ),
                  const Text(
                    "PurrfectMatch",
                    style: TextStyle(
                      fontSize: 42,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Georgia',
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  Container(
                    width: 450,
                    margin: const EdgeInsets.fromLTRB(10, 20, 10, 15),
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
                        const SizedBox(height: 8),
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
                            hintText: 'Enter Username',
                            hintStyle: TextStyle(
                              color: Color.fromARGB(255, 100, 99, 99),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFFCE9C46),
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
                            if (value == null || value.isEmpty) {
                              return 'Please enter your username';
                            } else if (!userData
                                .any((user) => user['username'] == value)) {
                              return 'Username not found';
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 450,
                    margin: const EdgeInsets.fromLTRB(10, 0, 10, 15),
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
                        const SizedBox(height: 8),
                        TextFormField(
                          style: const TextStyle(
                            color: Color.fromARGB(255, 73, 70, 70),
                            fontSize: 22,
                          ),
                          enableSuggestions: false,
                          autocorrect: false,
                          obscureText: _isObsecure,
                          controller: _passwordController,
                          decoration: InputDecoration(
                            errorStyle: const TextStyle(
                              fontSize: 18,
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'Enter Password',
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
                                  _isObsecure = !_isObsecure;
                                });
                              },
                              icon: Icon(_isObsecure
                                  ? Icons.visibility
                                  : Icons.visibility_off),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your password';
                            } else if (_userNameController.text.isNotEmpty) {
                              final user = userData.firstWhere(
                                  (user) =>
                                      user['username'] ==
                                      _userNameController.text,
                                  orElse: () => {});
                              if (user.isEmpty|| value
                              != 'admin') {
                                return 'Username not found';
                              } else if (user['password'] != value) {
                                return 'Incorrect password';
                              }
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                  ),
                  Container(
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
                    margin: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                    child: TextButton(
                      onPressed: () {
                        if (_userNameController.text == 'admin' &&
                            _passwordController.text == 'admin') {
                          Navigator.pushNamed(context, 'management_view');
                        }
                        if (_formKey.currentState!.validate())
                        {
                            Navigator.pushNamed(context, 'home_view');
                        }
                      },
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.fromLTRB(150, 13, 150, 13),
                      ),
                      child: const Text(
                        'Sign In',
                        style: TextStyle(
                          fontSize: 22,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Georgia',
                        ),
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, 'sign_up_view');
                    },
                    child: const Text(
                      'Not registered? Click Here!',
                      style: TextStyle(
                        fontSize: 18,
                        color: Color.fromARGB(255, 73, 70, 70),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );

  }
}
