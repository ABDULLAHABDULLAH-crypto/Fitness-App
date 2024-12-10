import 'package:fitness_app/pages/adding_screen.dart';
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
        numberOfDays: 3, // Change number of days dynamically
      ),
    );
  }
}

class HomePage extends StatefulWidget {
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

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentDayIndex = 0;

  // Unique exercises for each day
  final Map<int, List<Map<String, dynamic>>> exercisesByDay = {
    0: [
      {"name": "Push-ups", "reps": "10 - 15", "sets": 3, "weight": "Bodyweight"},
      {"name": "Bench Press", "reps": "8 - 12", "sets": 3, "weight": "40 KG"},
    ],
    1: [
      {"name": "Pull-ups", "reps": "10 - 12", "sets": 3, "weight": "Bodyweight"},
      {"name": "Deadlift", "reps": "6 - 8", "sets": 4, "weight": "70 KG"},
    ],
    2: [
      {"name": "Squats", "reps": "12 - 15", "sets": 3, "weight": "50 KG"},
      {"name": "Lunges", "reps": "10 - 12", "sets": 3, "weight": "Bodyweight"},
    ],
  };

  void _goToNextDay() {
    if (currentDayIndex < widget.numberOfDays - 1) {
      setState(() {
        currentDayIndex++;
      });
    }
  }

  void _goToPreviousDay() {
    if (currentDayIndex > 0) {
      setState(() {
        currentDayIndex--;
      });
    }
  }

  void _addExercise(Map<String, dynamic> newExercise) {
    setState(() {
      exercisesByDay[currentDayIndex]!.add(newExercise);
    });
  }

  @override
  Widget build(BuildContext context) {
    final exercises = exercisesByDay[currentDayIndex] ?? [];

    return Scaffold(
      backgroundColor: const Color(0xFF12192B),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
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
                            widget.name,
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Row(
                            children: [
                              const Icon(Icons.monitor_weight,
                                  size: 24, color: Color(0xFF0c2036)),
                              const SizedBox(width: 5),
                              Text(
                                '${widget.weight} ${widget.weightUnit}',
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold),
                              ),
                              const Spacer(),
                              const Icon(Icons.bloodtype,
                                  size: 24, color: Colors.red),
                              const SizedBox(width: 5),
                              Text(
                                widget.bloodType,
                                style: const TextStyle(
                                    color: Color(0xFF0c2036),
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold),
                              ),
                              const Spacer(),
                              const Icon(Icons.person,
                                  size: 24, color: Color(0xFF0c2036)),
                              const SizedBox(width: 5),
                              Text(
                                'Age ${widget.age}',
                                style: const TextStyle(
                                    color: Color(0xFF0c2036),
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold),
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

              // Day Navigation
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back_ios,
                        color: Colors.white, size: 24),
                    onPressed: currentDayIndex > 0 ? _goToPreviousDay : null,
                  ),
                  Text(
                    "Day ${currentDayIndex + 1}",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.arrow_forward_ios,
                        color: Colors.white, size: 24),
                    onPressed: currentDayIndex < widget.numberOfDays - 1
                        ? _goToNextDay
                        : null,
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // Workout Cards
              Expanded(
                child: ListView(
                  children: exercises
                      .map((exercise) => WorkoutCard(
                            exerciseName: exercise["name"],
                            reps: exercise["reps"],
                            sets: exercise["sets"],
                            weight: exercise["weight"],
                          ))
                      .toList(),
                ),
              ),

              // Add Exercise Button
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AddingScreen(
                        onSubmit: _addExercise,
                      ),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  shape: const CircleBorder(),
                  padding: const EdgeInsets.all(12),
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
                        offset: const Offset(0, 5),
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
            ],
          ),
        ),
      ),
    );
  }
}

class WorkoutCard extends StatelessWidget {
  final String exerciseName;
  final String reps;
  final int sets;
  final String weight;

  const WorkoutCard({
    super.key,
    required this.exerciseName,
    required this.reps,
    required this.sets,
    required this.weight,
  });

  @override
  Widget build(BuildContext context) {
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
            child: Image.asset(
              "assets/images/Recangle 2.jpeg", // Fixed image for all cards
              fit: BoxFit.cover,
              width: double.infinity,
              height: 200,
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Exercise:',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black)),
                    Text(exerciseName,
                        style: const TextStyle(
                            fontSize: 16, color: Colors.grey)),
                  ],
                ),
                const Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Reps:',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black)),
                    Text(reps,
                        style: const TextStyle(
                            fontSize: 16, color: Colors.grey)),
                  ],
                ),
                const Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Sets:',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black)),
                    Text('$sets',
                        style: const TextStyle(
                            fontSize: 16, color: Colors.grey)),
                  ],
                ),
                const Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Weight:',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black)),
                    Text(weight,
                        style: const TextStyle(
                            fontSize: 16, color: Colors.grey)),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

