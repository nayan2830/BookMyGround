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
      debugShowCheckedModeBanner: false,  // Remove the debug banner
      home: AvailableGroundsScreen(), // Add const here
    );
  }
}

class AvailableGroundsScreen extends StatelessWidget {
  AvailableGroundsScreen({super.key}); // Add key parameter

  final List<Ground> grounds = [
    Ground(name: 'Ground 1', location: 'North Complex', isAvailable: true),
    Ground(name: 'Ground 2', location: 'East Complex', isAvailable: false),
    Ground(name: 'Ground 3', location: 'West Complex', isAvailable: true),
    Ground(name: 'Ground 4', location: 'South Complex', isAvailable: true),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Available Grounds'),
        backgroundColor: Colors.green,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: grounds.length,
        itemBuilder: (context, index) {
          final ground = grounds[index];
          return GroundCard(ground: ground);
        },
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
      color: ground.isAvailable ? Colors.green[100] : Colors.grey[300],
      child: ListTile(
        title: Text(ground.name),
        subtitle: Text('Location: ${ground.location}'),
        trailing: ground.isAvailable
            ? const Icon(Icons.check_circle, color: Colors.green)
            : const Icon(Icons.cancel, color: Colors.red),
        onTap: ground.isAvailable
            ? () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FacilityDetails(
                facilityName: ground.name,         // Pass ground name as facilityName
                availability: ground.isAvailable ? 'Available' : 'Unavailable',  // Pass availability
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
