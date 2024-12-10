import 'dart:async';
import 'package:flutter/material.dart';
import 'package:fitness_app/pages/auth/SignIn.dart';
import 'package:fitness_app/pages/auth/SignUp.dart';
import 'package:fitness_app/pages/mainPage.dart';

class OnBoarding extends StatefulWidget {
  @override
  _OnboardingState createState() => _OnboardingState();
}

class _OnboardingState extends State<OnBoarding> {
  // List of images and titles for the animation
  final List<Map<String, String>> onboardingData = [
    {
      "image": "assets/images/Rectangle 1.png",
      "title": "Where Strength is Tracked",
    },
    {
      "image": "assets/images/Recangle 2.jpeg",
      "title": "Achieve Your Fitness Goals",
    },
    {
      "image": "assets/images/Rectangle 3.png",
      "title": "Stay Consistent, Stay Strong",
    },
  ];

  int currentIndex = 0;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    // Start the timer for automatic image and text switching
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      setState(() {
        currentIndex = (currentIndex + 1) % onboardingData.length;
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Animated Background Image
          AnimatedSwitcher(
            duration: const Duration(seconds: 1),
            child: Image.asset(
              onboardingData[currentIndex]["image"]!,
              key: ValueKey<int>(currentIndex),
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
          ),
          // Bottom Fixed Container
          Positioned(
            bottom: 0,
            height: 400,
            width: MediaQuery.of(context).size.width,
            child: Container(
              decoration: const BoxDecoration(
                color: Color(0xFF0D1B2A), // Background color
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Animated Motivation Text
                    AnimatedSwitcher(
                      duration: const Duration(seconds: 1),
                      child: Text(
                        onboardingData[currentIndex]["title"]!,
                        key: ValueKey<int>(currentIndex),
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const Spacer(), // Push buttons to the bottom
                    // Buttons
                    Column(
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 50, vertical: 20),
                          ),
                          child: const Text(
                            "Sign In",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SignIn(),
                              ),
                            );
                          },
                        ),
                        const SizedBox(height: 20),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 50, vertical: 20),
                          ),
                          child: const Text(
                            "Sign Up",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SignUp(),
                              ),
                            );
                          },
                        ),
                        const SizedBox(height: 20),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MainPage(),
                              ),
                            );
                          },
                          child: const Text(
                            "Skip",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
