import 'package:flutter/material.dart';
import 'screens/login_screen.dart';

void main() {
  runApp(const TicketBookingApp());
}

class TicketBookingApp extends StatelessWidget {
  const TicketBookingApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ticket Booking App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const LoginScreen(),
    );
  }
}
