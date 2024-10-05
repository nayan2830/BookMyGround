import 'package:flutter/material.dart';
import 'available_grounds.dart'; // Import AvailableGroundsScreen

void main() async {
  runApp(const BookMyGround());
}

class BookMyGround extends StatelessWidget {
  const BookMyGround({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BookMyGround'),
        backgroundColor: Colors.green,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search for a facility...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: const [
                FacilityCard(facilityName: 'Football Turf', availability: 'Available'),
                FacilityCard(facilityName: 'Cricket Ground', availability: 'Unavailable'),
                FacilityCard(facilityName: 'Basketball Court', availability: 'Available'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class FacilityCard extends StatelessWidget {
  final String facilityName;
  final String availability;

  const FacilityCard({super.key, required this.facilityName, required this.availability});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(facilityName),
        subtitle: Text('Availability: $availability'),
        trailing: const Icon(Icons.arrow_forward),
        onTap: () {
          // Navigate to AvailableGroundsScreen when a facility is tapped
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AvailableGroundsScreen(),
            ),
          );
        },
      ),
    );
  }
}
