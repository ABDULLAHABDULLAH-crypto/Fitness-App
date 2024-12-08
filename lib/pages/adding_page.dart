import 'package:flutter/material.dart';

class AddingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0D1B2A), // Dark navy background
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SafeArea(
        child: Column(
          children: [
            // User Info Card
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 10,
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Alamoudi, Abdrhman",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.monitor_weight, color: Colors.black),
                            SizedBox(width: 4),
                            Text("80 Kg"),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.bloodtype, color: Colors.red),
                            SizedBox(width: 4),
                            Text("+O"),
                          ],
                        ),
                        Text("Age 23"),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            // Title
            Text(
              "Day 2 : Back Day",
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            // Exercise Info Card
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 10,
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    // Exercise Image
                    ClipRRect(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(16.0),
                      ),
                      child: Image.network(
                        'https://images.pexels.com/photos/17840/pexels-photo.jpg', // Replace with your image URL
                        fit: BoxFit.cover,
                        height: 200,
                        width: double.infinity,
                      ),
                    ),
                    // Exercise Details
                    const Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Reps",
                                  style: TextStyle(color: Colors.black)),
                              Text("8 - 12",
                                  style: TextStyle(color: Colors.black)),
                            ],
                          ),
                          Divider(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Sets",
                                  style: TextStyle(color: Colors.black)),
                              Text("3", style: TextStyle(color: Colors.black)),
                            ],
                          ),
                          Divider(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Current Weight",
                                  style: TextStyle(color: Colors.black)),
                              Text("30 KG",
                                  style: TextStyle(color: Colors.black)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16),
            // Add Button
            ElevatedButton(
              onPressed: () {
                // Add button action
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                shape: CircleBorder(),
                padding: EdgeInsets.all(12),
                shadowColor: Colors.transparent,
              ),
              child: Container(
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: const LinearGradient(
                    colors: [Color(0xFF4A90E2), Color(0xFF007AFF)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blueAccent.withOpacity(0.5),
                      blurRadius: 10,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                child: const Center(
                  child: Icon(
                    Icons.add,
                    size: 32,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Spacer(),
            // Bottom Navigation Bar
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(16.0),
                ),
              ),
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(Icons.fitness_center, color: Colors.black, size: 32),
                  Icon(Icons.settings, color: Colors.grey, size: 32),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
