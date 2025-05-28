import 'package:flutter/material.dart';
import 'package:ticketbookingapp/screens/ticket_details_screen.dart';
import 'package:ticketbookingapp/screens/login_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  final List<Map<String, String>> tickets = const [
    {"title": "Bus to Leading University", "time": "9:00 AM", "price": "\$5"},
    {"title": "Bus to Surma Tower", "time": "1:00 PM", "price": "\$15"},
    {"title": "Bus to Tilaghor", "time": "6:30 PM", "price": "\$8"},
  ];
  void _logout(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const LoginScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F4F6),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 34, 37, 41),
        title: const Text("Available Buses"),
        centerTitle: true,
        foregroundColor: Colors.white,
        actions: [
          PopupMenuButton<String>(
            onSelected: (value) {
              if (value == 'logout') {
                _logout(context);
              }
            },
            icon: const Icon(Icons.more_vert),
            itemBuilder: (BuildContext context) => [
              const PopupMenuItem<String>(
                value: 'logout',
                child: Row(
                  children: [
                    Icon(Icons.logout, color: Colors.red),
                    SizedBox(width: 10),
                    Text(
                      "Logout",
                      style: TextStyle(fontSize: 30),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: tickets.length,
        padding: const EdgeInsets.all(16),
        itemBuilder: (context, index) {
          final ticket = tickets[index];
          return GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => TicketDetailsScreen(ticket: ticket),
              ),
            ),
            child: Container(
              margin: const EdgeInsets.only(bottom: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 8,
                    offset: Offset(0, 4),
                  )
                ],
              ),
              child: ListTile(
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                leading: CircleAvatar(
                  radius: 26,
                  backgroundColor: const Color(0xFF1E40AF),
                  child: const Icon(Icons.event_seat, color: Colors.white),
                ),
                title: Text(
                  ticket['title']!,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 6.0),
                  child: Row(
                    children: [
                      Icon(Icons.access_time,
                          size: 16, color: Colors.grey[600]),
                      const SizedBox(width: 4),
                      Text(
                        ticket['time']!,
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                      const SizedBox(width: 16),
                      Icon(Icons.attach_money,
                          size: 16, color: Colors.grey[600]),
                      const SizedBox(width: 4),
                      Text(
                        ticket['price']!,
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                    ],
                  ),
                ),
                trailing: const Icon(Icons.arrow_forward_ios_rounded,
                    color: Colors.grey),
              ),
            ),
          );
        },
      ),
    );
  }
}
