import 'package:fitness_app/pages/auth/SignUp.dart';
import 'package:fitness_app/pages/mainPage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _formKey = GlobalKey<FormState>();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Controllers to get text from TextFormFields
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Function to handle SignIn
  Future<void> _signIn() async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );

      // On successful sign-in, navigate to MainPage
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => MainPage()),
      );
    } catch (e) {
      // Handle error during sign-in
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
                    padding:
                        const EdgeInsets.symmetric(horizontal: 0, vertical: 0)),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Image.asset("assets/images/Back.png")),
          ),
          SizedBox(height: 30),
          const Center(
            child: Text(
              "LOGIN",
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
                            controller: _emailController,
                            decoration: const InputDecoration(
                                labelText: "Enter Your Email",
                                border: OutlineInputBorder(),
                                icon: Icon(Icons.person)),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your email';
                              }
                              if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
                                  .hasMatch(value)) {
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
                              return null;
                            },
                          ),
                        ),
                        SizedBox(height: 40),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.symmetric(
                                  vertical: 30, horizontal: 120),
                              backgroundColor:
                                  const Color.fromARGB(255, 28, 47, 68)),
                          onPressed: () {
                            // Validate returns true if the form is valid, or false otherwise.
                            if (_formKey.currentState!.validate()) {
                              // If the form is valid, proceed to sign-in
                              _signIn();
                            }
                          },
                          child: const Text(
                            'Login',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text("Don’t have an account?"),
                              GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => SignUp()));
                                  },
                                  child: Text(
                                    "Sign Up",
                                    style: TextStyle(color: Colors.blue[600]),
                                  ))
                            ],
                          ),
                        ),
                        SizedBox(height: 40),
                        GestureDetector(
                          onTap: () {
                            // Handle Skip action
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
