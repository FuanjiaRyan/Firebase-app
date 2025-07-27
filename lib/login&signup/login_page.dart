import 'package:firebase_1/Bottom%20Nav%20Bar/bottom_nav_bar_screen.dart';
import 'package:firebase_1/Other%20signin%20pages/google_signin_page.dart';
import 'package:firebase_1/login&signup/forgot_password_screen.dart';
import 'package:firebase_1/login&signup/signup_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool _isLoading = false;

  Future<void> loginWithEmailAndPassword(String email, String password) async{
    setState(() {
      _isLoading = true;
    });
    try {
      final UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email,
          password: password,
      );
      final User? user = userCredential.user;
      print('User logged in: ${user?.uid}');
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => BottomNavBarScreen()));
    } on FirebaseAuthException catch (e) {
      setState(() {
        _isLoading = false;
      });
      if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('No user found with that email')));
      } else if (e.code == 'wrong password') {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Wrong password provided')));
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Error: ${e.message}')));
      }

    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Error: $e')));
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _isLoading?
      Center(
        child: CircularProgressIndicator(),
      )
      : Column(
        children: [
          SizedBox(
            height: 80,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(35, 0, 0, 0,),
                child: Text(
                  'Welcome Back',
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
                  //Email field
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
                  SizedBox(
                    height: 20,
                  ),

                  //Password field
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: TextFormField(
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

                  //forgot password
                  SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ForgotPasswordScreen()));
                    },
                    child: Text(
                      'Forgot Password',
                      style: TextStyle(
                        color: Colors.greenAccent.shade700,
                        fontSize: 18,
                      ),
                    ),
                  ),

                  //Submit Button
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
                          final String password =
                          _passwordController.text.trim();
                          if (_formKey.currentState!.validate()) {
                            await loginWithEmailAndPassword(
                            email, password);
                            _formKey.currentState!.save();
                          }
                        },
                        child: Text(
                          'Submit',
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
                        "Don't have an account?",
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
                                  builder: (context) => SignupPage()));
                        },
                        child: Text(
                          'sign up',
                          style: TextStyle(
                            color: Colors.greenAccent.shade700,
                            fontSize: 18,
                          ),
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
                          'Or login with',
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
                                        builder: (context) => GoogleSigninPage()));
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
                      Text('By proceeding, you are agreeing to',
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
    );
  }
}
