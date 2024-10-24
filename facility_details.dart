import 'package:flutter/material.dart';
import 'main.dart'; // Import the main.dart file
import 'payment_page.dart';

void main() {
  runApp(const FacilityDetailsApp());
}

class FacilityDetailsApp extends StatelessWidget {
  const FacilityDetailsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false, // Remove the debug banner
      home: FacilityDetails(
        facilityName: 'Sports Complex',
        availability: 'Available',
      ),
    );
  }
}

class FacilityDetails extends StatelessWidget {
  final String facilityName;
  final String availability;

  const FacilityDetails(
      {super.key, required this.facilityName, required this.availability});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(facilityName),
        backgroundColor: Colors.green[800],
      ),
      body: Stack(
        children: [
          // Background image related to football or sports
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/volleyball_bg.jpg'), // Use your image path
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Semi-transparent layer for better text readability
          Container(
            color: Colors.black.withOpacity(0.5),
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Availability: $availability',
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Available Slots:',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white70,
                  ),
                ),
                const SizedBox(height: 10),
                Expanded(
                  child: ListView(
                    children: [
                      SlotCard(
                        time: '8:00 AM - 9:00 AM',
                        isAvailable: true,
                        facilityName: facilityName,
                        availability: availability,
                      ),
                      SlotCard(
                        time: '9:00 AM - 10:00 AM',
                        isAvailable: false,
                        facilityName: facilityName,
                        availability: availability,
                      ),
                      SlotCard(
                        time: '10:00 AM - 11:00 AM',
                        isAvailable: true,
                        facilityName: facilityName,
                        availability: availability,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20), // Add some spacing before the button
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const BookMyGround(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green[700], // Button color
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24.0, vertical: 12.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text('Go to Home Screen'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text(
                  'Contact Us',
                  style: TextStyle(color: Colors.white), // Text color
                ),
                content: const Text(
                  'You can reach us at contact@sportscomplex.com',
                  style: TextStyle(color: Colors.white), // Text color
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context); // Close dialog
                    },
                    child: const Text(
                      'Close',
                      style: TextStyle(color: Colors.white), // Text color
                    ),
                  ),
                ],
                backgroundColor: Colors.black, // Black background
              );
            },
          );
        },
        backgroundColor: Colors.green,
        tooltip: 'Contact',
        child: const Icon(Icons.contact_phone),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}

class SlotCard extends StatelessWidget {
  final String time;
  final bool isAvailable;
  final String facilityName;
  final String availability;

  const SlotCard({
    super.key,
    required this.time,
    required this.isAvailable,
    required this.facilityName,
    required this.availability,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8, // Elevation for shadow effect
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      color: isAvailable ? Colors.green[200]?.withOpacity(0.8) : Colors.red[200]?.withOpacity(0.8),
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16.0),
        title: Text(
          time,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        trailing: isAvailable
            ? const Icon(Icons.check_circle, color: Colors.white)
            : const Icon(Icons.cancel, color: Colors.white),
        onTap: isAvailable
            ? () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text(
                  'Confirm Booking',
                  style: TextStyle(color: Colors.white), // Text color
                ),
                content: Text(
                  'Do you want to book the slot at $time?',
                  style: const TextStyle(color: Colors.white), // Text color
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context); // Close dialog
                    },
                    child: const Text(
                      'Cancel',
                      style: TextStyle(color: Colors.white), // Text color
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context); // Close dialog
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PaymentPage(
                            time: time,
                            facilityName: facilityName,
                            availability: availability,
                          ),
                        ),
                      );
                    },
                    child: const Text(
                      'Confirm',
                      style: TextStyle(color: Colors.white), // Text color
                    ),
                  ),
                ],
                backgroundColor: Colors.black, // Black background
              );
            },
          );
        }
            : null,
      ),
    );
  }
}
