import 'package:flutter/material.dart';

class ExercisesScreen extends StatelessWidget {
  const ExercisesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(
        name: "Alamoudi, Abdullah",
        weight: 80.0,
        weightUnit: "Kg",
        bloodType: "-O",
        age: 23,
        numberOfDays: 1,
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  final String name;
  final double weight;
  final String weightUnit;
  final String bloodType;
  final int age;
  final int numberOfDays;

  const HomePage({
    super.key,
    required this.name,
    required this.weight,
    required this.weightUnit,
    required this.bloodType,
    required this.age,
    required this.numberOfDays,
  });

  List<String> generateDays(int count) {
    return List<String>.generate(
      count,
          (index) => "Day ${index + 1}: ${['Chest Day', 'Back Day', 'Leg Day', 'Arm Day'][index % 4]}",
    );
  }

  @override
  Widget build(BuildContext context) {
    final days = generateDays(numberOfDays);

    return Scaffold(
      backgroundColor: const Color(0xFF12192B),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                // Profile Section
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 6,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: [
                      const SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              name,
                              style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Row(
                              children: [
                                const Icon(Icons.monitor_weight, size: 24, color: Color(0xFF0c2036)),
                                const SizedBox(width: 5),
                                Text(
                                  '$weight $weightUnit',
                                  style: const TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold),
                                ),
                                const Spacer(),
                                const Icon(Icons.bloodtype, size: 24, color: Colors.red),
                                const SizedBox(width: 5),
                                Text(
                                  bloodType,
                                  style: const TextStyle(color: Color(0xFF0c2036), fontSize: 14,fontWeight: FontWeight.bold),
                                ),
                                const Spacer(),
                        const Icon(Icons.person, size: 24, color: Color(0xFF0c2036)),
                        const SizedBox(width: 5),
                        Text(
                          'Age $age',
                          style: const TextStyle(color: Color(0xFF0c2036), fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                // Workout Days
                ...days.map((day) => Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 2,
                            color: Colors.white,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            day, // Dynamic day variable
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            height: 2,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    const WorkoutCard(),
                    const WorkoutCard(hasSettings: true),
                    const SizedBox(height: 20),
                  ],
                )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class WorkoutCard extends StatelessWidget {

  final bool hasSettings;
  const WorkoutCard({super.key, this.hasSettings = false});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          margin: const EdgeInsets.only(bottom: 20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 6,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
                child: Image.asset("assets/images/Recangle 2.jpeg",
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: constraints.maxWidth * 0.5,
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Reps', style: TextStyle(fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold)),
                        Text('8 - 12', style: TextStyle(fontSize: 18, color: Colors.grey,fontWeight: FontWeight.bold)),
                      ],
                    ),
                    Divider(color: Colors.grey, thickness: 0.5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Sets', style: TextStyle(fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold)),
                        Text('3', style: TextStyle(fontSize: 18, color: Colors.grey,fontWeight: FontWeight.bold)),
                      ],
                    ),
                    Divider(color: Colors.grey, thickness: 0.5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Current Weight', style: TextStyle(fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold)),
                        Text('30 KG', style: TextStyle(fontSize: 18, color: Colors.grey,fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        );
      },
    );
  }
}