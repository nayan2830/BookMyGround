import 'package:flutter/material.dart';
import 'booking_confirmation.dart';

void main() {
  runApp(const facilityDetails());
}

class facilityDetails extends StatelessWidget {
  const facilityDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,  // Remove the debug banner
      home: FacilityDetails(facilityName: 'Sports Complex', availability: 'Available'),
    );
  }
}

class FacilityDetails extends StatelessWidget {
  final String facilityName;
  final String availability;

  const FacilityDetails({super.key, required this.facilityName, required this.availability});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(facilityName),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Availability: $availability',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            const Text(
              'Available Slots:',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView(
                children: const [
                  SlotCard(time: '8:00 AM - 9:00 AM', isAvailable: true),
                  SlotCard(time: '9:00 AM - 10:00 AM', isAvailable: false),
                  SlotCard(time: '10:00 AM - 11:00 AM', isAvailable: true),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SlotCard extends StatelessWidget {
  final String time;
  final bool isAvailable;

  const SlotCard({super.key, required this.time, required this.isAvailable});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: isAvailable ? Colors.green[100] : Colors.grey[300],
      child: ListTile(
        title: Text(time),
        trailing: isAvailable
            ? const Icon(Icons.check_circle, color: Colors.green)
            : const Icon(Icons.cancel, color: Colors.red),
        onTap: isAvailable
            ? () {
          // Show a dialog for booking confirmation
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text('Confirm Booking'),
                content: Text('Do you want to book the slot at $time?'),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context); // Close dialog
                    },
                    child: const Text('Cancel'),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context); // Close dialog
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BookingConfirmationScreen(time: time),
                        ),
                      );
                    },
                    child: const Text('Confirm'),
                  ),
                ],
              );
            },
          );
        }
            : null,
      ),
    );
  }
}
