import 'package:firebase_1/Auth%20Services/auth_service.dart';
import 'package:firebase_1/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPwController = TextEditingController();
  final FirebaseAuthService _authService = FirebaseAuthService();
  bool _isSignIn = true;
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_isSignIn ? 'Sign In' : 'Register')),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Icon(Icons.person, size: 250, color: Color(0x772C00FF)),
                  // SizedBox(height: 10,),
                  Text(
                    'Ryan Puzo',
                    style: TextStyle(
                      fontSize: 25,
                      color: Color(0x772C00FF),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  TextField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      hintText: 'Enter email',
                      hintStyle: TextStyle(color: Colors.grey.shade500),
                      labelText: 'Enter email',
                      labelStyle: TextStyle(color: Colors.grey.shade500),
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 0,
                      ),
                      prefixIcon: Icon(Icons.email, color: Color(0x772C00FF)),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade500),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade500),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade500),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  TextField(
                    controller: _passwordController,
                    obscureText: true,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      hintText: 'Enter password',
                      hintStyle: TextStyle(color: Colors.grey.shade500),
                      labelText: 'Enter password',
                      labelStyle: TextStyle(color: Colors.grey.shade500),
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 0,
                      ),
                      prefixIcon: Icon(Icons.lock, color: Color(0x772C00FF)),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade500),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade500),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade500),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  if (!_isSignIn)
                    Column(
                      children: [
                        TextField(
                          controller: _confirmPwController,
                          obscureText: true,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            hintText: 'Confirm password',
                            hintStyle: TextStyle(color: Colors.grey.shade500),
                            labelText: 'Confirm password',
                            labelStyle: TextStyle(color: Colors.grey.shade500),
                            contentPadding: EdgeInsets.symmetric(
                              vertical: 10,
                              horizontal: 0,
                            ),
                            prefixIcon: Icon(
                              Icons.lock,
                              color: Color(0x772C00FF),
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey.shade500,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey.shade500,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey.shade500,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        TextField(
                          controller: _usernameController,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            hintText: 'Enter username',
                            hintStyle: TextStyle(color: Colors.grey.shade500),
                            labelText: 'Enter username',
                            labelStyle: TextStyle(color: Colors.grey.shade500),
                            contentPadding: EdgeInsets.symmetric(
                              vertical: 10,
                              horizontal: 0,
                            ),
                            prefixIcon: Icon(
                              Icons.person,
                              color: Color(0x772C00FF),
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey.shade500,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey.shade500,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey.shade500,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ElevatedButton(
                    onPressed:
                        _isLoading
                            ? null
                            : () async {
                              if (_isSignIn) {
                                try {
                                  final UserCredential result =
                                      await _authService
                                          .signInWithEmailAndPassword(
                                            _emailController.text,
                                            _passwordController.text,
                                          );
                                  final User? user = result.user;
                                  if (user != null) {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => HomePage(),
                                      ),
                                    );
                                  }
                                } catch (e) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'Invalid email or password',
                                      ),
                                    ),
                                  );
                                } finally {
                                  setState(() {
                                    _isLoading = false;
                                  });
                                }
                              } else {
                                if (_passwordController.text !=
                                    _confirmPwController.text) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text('Passwords do not match'),
                                    ),
                                  );
                                  setState(() {
                                    _isLoading = false;
                                  });
                                  return;
                                }
                                try {
                                  final UserCredential result =
                                      await _authService
                                          .createUserWithEmailAndPassword(
                                            _emailController.text,
                                            _passwordController.text,
                                          );
                                  final User? user = result.user;
                                  if (user != null) {
                                    await _authService.saveUserData(
                                      user,
                                      _usernameController.text,
                                    );
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => HomePage(),
                                      ),
                                    );
                                  }
                                } catch (e) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text('Error Registering user'),
                                    ),
                                  );
                                } finally {
                                  setState(() {
                                    _isLoading = false;
                                  });
                                }
                              }
                            },
                    child:
                        _isLoading
                            ? CircularProgressIndicator(color: Colors.black)
                            : Text(_isSignIn ? 'Sign In' : 'Register'),
                  ),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        _isSignIn = !_isSignIn;
                      });
                    },
                    child: Text(
                      _isSignIn
                          ? "Don't have an account? Register"
                          : "Already have an account? Sign In",
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
