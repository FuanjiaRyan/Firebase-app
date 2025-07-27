import 'package:firebase_1/Bottom%20Nav%20Bar/bottom_nav_bar_screen.dart';
import 'package:firebase_1/Other%20signin%20pages/google_signin_page.dart';
import 'package:firebase_1/login&signup/login_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  bool _isLoading = false;

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _confirmPwController = TextEditingController();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Future<void> signUpWithEmailAndPassword(String email, String password) async {
    setState(() {
      _isLoading = true;
    });
    try {
      final UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);

      final User? user = userCredential.user;
      print('User created: ${user?.uid}');
      await createUserDocument(user, _usernameController.text);
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Sign up was successful')));
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => BottomNavBarScreen()));
      setState(() {
        _isLoading = false;
      });
    } on FirebaseAuthException catch (e) {
      print('Error: $e');
    }
  }

  Future<void> createUserDocument(User? user, String username) async {
    if (user != null && user.email != null) {
      await _firestore
          .collection('users')
          .doc(user.uid)
          .set({'email': user.email, 'username': username, 'uid': user.uid});
    } else {
      print('user or user email is not null');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _isLoading? Center(
        child: CircularProgressIndicator(),
      )
      : SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 70,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(
                    35,
                    0,
                    0,
                    0,
                  ),
                  child: Text(
                    'Lets get started',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.greenAccent.shade700,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    //username
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                      child: TextFormField(
                        controller: _usernameController,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.person),
                          labelText: 'Enter username',
                          hintText: 'Enter username',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'please enter your username';
                          }
                          if (value.length < 4) {
                            return 'username must be at least 4 characters';
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),

                    //email
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                      child: TextFormField(
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.email),
                          labelText: 'Enter Email',
                          hintText: 'Enter email',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please Enter email';
                          }
                          if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                              .hasMatch(value)) {
                            return 'Please enter a valid email';
                          }
                          return null;
                        },
                      ),
                    ),

                    //password
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                      child: TextFormField(
                        obscureText: true,
                        controller: _passwordController,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.lock),
                          labelText: 'Enter Password',
                          errorMaxLines: 2,
                          hintText: 'Enter Password',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        validator: (value) {
                          String pattern = r'^(?=.*[A-Z])(?=.*\d).{8,}$';
                          RegExp regExp = RegExp(pattern);
                          if (value!.isEmpty) {
                            return 'Please Enter a password';
                          } else if (!regExp.hasMatch(value)) {
                            return 'Password must be at least 8 characters, a capital letter and a number';
                          }
                          return null;
                        },
                      ),
                    ),

                    //confirm password
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                      child: TextFormField(
                        obscureText: true,
                        controller: _confirmPwController,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.lock),
                          labelText: 'confirm Password',
                          errorMaxLines: 2,
                          hintText: 'Confirm Password',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'please confirm your password';
                          }
                          if (value != _passwordController.text) {
                            return 'passwords do not match';
                          }
                          return null;
                        },
                      ),
                    ),

                    //register button
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                      child: SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.greenAccent.shade700,
                          ),
                          onPressed: () async{
                            final String email = _emailController.text.trim();
                            final String password = _passwordController.text.trim();
                            if (_formKey.currentState!.validate()) {
                              await signUpWithEmailAndPassword(email, password);
                              _formKey.currentState!.save();
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => BottomNavBarScreen()));
                            }
                          },
                          child: Text(
                            'Register',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Already have an account?",
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginPage()));
                          },
                          child: Text(
                            'Login',
                            style: TextStyle(
                                color: Colors.greenAccent.shade700,
                                fontSize: 18),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: Divider(
                          thickness: 1,
                          color: Colors.greenAccent.shade700,
                        )),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Or sign in with',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Expanded(
                            child: Divider(
                          thickness: 1,
                          color: Colors.greenAccent.shade700,
                        )),
                      ],
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            CircleAvatar(
                              radius: 25,
                              backgroundColor: Colors.white,
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              GoogleSigninPage()));
                                },
                                child: Image.asset(
                                  'assets/google.png',
                                  width: 25,
                                  height: 25,
                                ),
                              ),
                            ),
                            Text('Google'),
                          ],
                        ),
                        Column(
                          children: [
                            CircleAvatar(
                              radius: 25,
                              backgroundColor: Colors.white,
                              child: GestureDetector(
                                onTap: () {},
                                child: Image.asset(
                                  'assets/apple2.png',
                                  width: 25,
                                  height: 25,
                                ),
                              ),
                            ),
                            Text('Apple'),
                          ],
                        ),
                        Column(
                          children: [
                            CircleAvatar(
                              radius: 25,
                              backgroundColor: Colors.white,
                              child: GestureDetector(
                                onTap: () {},
                                child: Image.asset(
                                  'assets/facebook.png',
                                  width: 25,
                                  height: 25,
                                  color: Colors.blueAccent.shade700,
                                ),
                              ),
                            ),
                            Text('Facebook'),
                          ],
                        ),
                        Column(
                          children: [
                            CircleAvatar(
                              radius: 25,
                              backgroundColor: Colors.white,
                              child: GestureDetector(
                                onTap: () {},
                                child: Image.asset(
                                  'assets/phone.png',
                                  width: 25,
                                  height: 25,
                                ),
                              ),
                            ),
                            Text('Phone'),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Wrap(
                      children: <Widget>[
                        Text(
                          'By proceeding, you are agreeing to',
                          style: TextStyle(
                            wordSpacing: 5,
                          ),
                        ),
                        SizedBox(width: 10),
                        GestureDetector(
                          onTap: () {},
                          child: Text(
                            'Terms and Conditions',
                            style: TextStyle(
                              wordSpacing: 5,
                              fontWeight: FontWeight.bold,
                              color: Colors.greenAccent.shade700,
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Text('and'),
                        SizedBox(width: 10),
                        GestureDetector(
                          onTap: () {},
                          child: Text(
                            'Privacy Policy',
                            style: TextStyle(
                              wordSpacing: 5,
                              fontWeight: FontWeight.bold,
                              color: Colors.greenAccent.shade700,
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
