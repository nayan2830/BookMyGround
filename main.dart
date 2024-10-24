import 'package:flutter/material.dart';
import 'available_grounds.dart'; // Import AvailableGroundsScreen

void main() async {
  runApp(const BookMyGround());
}

class BookMyGround extends StatelessWidget {
  const BookMyGround({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const HomeScreen(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.green,
        hintColor: Colors.white,
        textTheme: const TextTheme(
          titleLarge: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          bodyMedium: TextStyle(color: Colors.white),
        ),
      ),
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
        centerTitle: true,
        backgroundColor: Colors.green[800],
        elevation: 0,
      ),
      body: Stack(
        children: [
          // Add aesthetic football-related background image
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/football_bg.jpg'),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(Colors.black45, BlendMode.darken),
              ),
            ),
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.8),
                    hintText: 'Search for a facility...',
                    prefixIcon: const Icon(Icons.search, color: Colors.green),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: ListView(
                  children: const [
                    FacilityCard(
                      facilityName: 'Football Turf',
                      availability: 'Available',
                    ),
                    FacilityCard(
                      facilityName: 'Cricket Ground',
                      availability: 'Unavailable',
                    ),
                    FacilityCard(
                      facilityName: 'Basketball Court',
                      availability: 'Available',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class FacilityCard extends StatelessWidget {
  final String facilityName;
  final String availability;

  const FacilityCard({
    super.key,
    required this.facilityName,
    required this.availability,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      color: availability == 'Available' ? Colors.green[100] : Colors.red[100],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        title: Text(
          facilityName,
          style: TextStyle(
            color: availability == 'Available' ? Colors.green[800] : Colors.red[800],
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          'Availability: $availability',
          style: TextStyle(
            color: availability == 'Available' ? Colors.green[700] : Colors.red[700],
          ),
        ),
        trailing: const Icon(Icons.arrow_forward, color: Colors.black87),
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
