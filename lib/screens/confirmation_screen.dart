import 'package:flutter/material.dart';

class ConfirmationScreen extends StatelessWidget {
  final Map<String, String> ticket;
  final String seatNo;

  const ConfirmationScreen({
    super.key,
    required this.ticket,
    required this.seatNo,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Booking Confirmed")),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Your Ticket is Confirmed!",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Text("Trip: ${ticket['title']}",
                style: const TextStyle(fontSize: 18)),
            Text("Time: ${ticket['time']}",
                style: const TextStyle(fontSize: 18)),
            Text("Price: ${ticket['price']}",
                style: const TextStyle(fontSize: 18)),
            Text("Seat No: $seatNo", style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 40),
            Center(
              child: ElevatedButton(
                onPressed: () =>
                    Navigator.popUntil(context, (route) => route.isFirst),
                child: const Text("Back to Home"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
