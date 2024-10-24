import 'package:flutter/material.dart';
import 'facility_details.dart'; // Import the FacilityDetails page

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Remove the debug banner
      home: AvailableGroundsScreen(), // Add const here
    );
  }
}

class AvailableGroundsScreen extends StatelessWidget {
  AvailableGroundsScreen({super.key}); // Add key parameter

  final List<Ground> grounds = [
    Ground(name: 'Football Ground 1', location: 'North Complex', isAvailable: true),
    Ground(name: 'Football Ground 2', location: 'East Complex', isAvailable: false),
    Ground(name: 'Football Ground 3', location: 'West Complex', isAvailable: true),
    Ground(name: 'Football Ground 4', location: 'South Complex', isAvailable: true),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Available Football Grounds'),
        backgroundColor: Colors.green[800],
        centerTitle: true,
      ),
      body: Stack(
        children: [
          // Background image related to football
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/cricket_bg.jpg'), // Add your background image here
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Main content with a translucent background
          Container(
            color: Colors.black.withOpacity(0.6), // Semi-transparent background to make text readable
            child: ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: grounds.length,
              itemBuilder: (context, index) {
                final ground = grounds[index];
                return GroundCard(ground: ground);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class GroundCard extends StatelessWidget {
  final Ground ground;

  const GroundCard({super.key, required this.ground}); // Add key parameter

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      color: ground.isAvailable ? Colors.green[200]?.withOpacity(0.9) : Colors.red[200]?.withOpacity(0.9),
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        title: Text(
          ground.name,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        subtitle: Text(
          'Location: ${ground.location}',
          style: const TextStyle(color: Colors.white70),
        ),
        trailing: ground.isAvailable
            ? const Icon(Icons.check_circle, color: Colors.white)
            : const Icon(Icons.cancel, color: Colors.white),
        onTap: ground.isAvailable
            ? () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FacilityDetails(
                facilityName: ground.name, // Pass ground name as facilityName
                availability: ground.isAvailable ? 'Available' : 'Unavailable', // Pass availability
              ),
            ),
          );
        }
            : null,
      ),
    );
  }
}

class Ground {
  final String name;
  final String location;
  final bool isAvailable;

  Ground({
    required this.name,
    required this.location,
    required this.isAvailable,
  });
}
