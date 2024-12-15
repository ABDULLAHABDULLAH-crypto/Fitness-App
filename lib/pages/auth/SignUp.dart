import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fitness_app/pages/mainPage.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  
  // Controllers to get text from TextFormFields
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _rePasswordController = TextEditingController();

  // Function to handle SignUp
  Future<void> _signUp() async {
    if (_passwordController.text != _rePasswordController.text) {
      // If passwords don't match, show an error
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Passwords do not match')),
      );
      return;
    }

    try {
      // Create the user with Firebase Authentication
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );

      // On successful sign up, navigate to MainPage
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => MainPage()),
      );
    } catch (e) {
      // Handle error during sign-up
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(color: Color(0xFF0D1B2A)),
        height: double.infinity,
        width: double.infinity,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: EdgeInsets.all(20),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0)),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Image.asset("assets/images/Back.png")),
          ),
          SizedBox(height: 30),
          const Center(
            child: Text(
              "SIGN UP",
              style: TextStyle(color: Colors.white, fontSize: 60),
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: Container(
                width: 500,
                height: 400,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(20))),
                child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        SizedBox(height: 40),
                        Padding(
                          padding: EdgeInsets.all(20),
                          child: TextFormField(
                            controller: _nameController,
                            decoration: const InputDecoration(
                                labelText: "Enter Your Name",
                                border: OutlineInputBorder(),
                                icon: Icon(Icons.person)),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your name';
                              }
                              return null;
                            },
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(20),
                          child: TextFormField(
                            controller: _emailController,
                            decoration: const InputDecoration(
                                labelText: "Enter Your Email",
                                border: OutlineInputBorder(),
                                icon: Icon(Icons.email)),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your email';
                              }
                              if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                                return 'Please enter a valid email address';
                              }
                              return null;
                            },
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(20),
                          child: TextFormField(
                            controller: _passwordController,
                            obscureText: true,
                            decoration: const InputDecoration(
                                labelText: "Enter Your Password",
                                border: OutlineInputBorder(),
                                icon: Icon(Icons.lock)),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your password';
                              }
                              if (value.length < 6) {
                                return 'Password must be at least 6 characters';
                              }
                              return null;
                            },
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(20),
                          child: TextFormField(
                            controller: _rePasswordController,
                            obscureText: true,
                            decoration: const InputDecoration(
                                labelText: "Re-enter Your Password",
                                border: OutlineInputBorder(),
                                icon: Icon(Icons.lock)),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please re-enter your password';
                              }
                              return null;
                            },
                          ),
                        ),
                        SizedBox(height: 20),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.symmetric(vertical: 30, horizontal: 120),
                              backgroundColor:const Color.fromARGB(255, 28, 47, 68)),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              _signUp();  // Call the signUp function
                            }
                          },
                          child: const Text(
                            'SignUp',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        SizedBox(height: 20),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MainPage()));
                          },
                          child: const Text(
                            "Skip",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ))),
          )
        ]),
      ),
    );
  }
}
