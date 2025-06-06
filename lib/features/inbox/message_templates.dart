import 'package:flutter/material.dart';

class StatCardMessage extends StatelessWidget {
  final String title;
  final String content;
  final List<Widget> actions;
  final IconData? icon;
  final Color? color;

  const StatCardMessage({
    super.key,
    required this.title,
    required this.content,
    required this.actions,
    this.icon,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color ?? Colors.blue[50],
      margin: const EdgeInsets.symmetric(vertical: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (icon != null)
              Row(
                children: [
                  Icon(icon, color: Colors.blue, size: 28),
                  const SizedBox(width: 8),
                  Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                ],
              )
            else
              Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            const SizedBox(height: 8),
            Text(content, style: const TextStyle(fontSize: 15)),
            const SizedBox(height: 12),
            Row(
              children: actions,
            ),
          ],
        ),
      ),
    );
  }
}

class AppointmentPage extends StatelessWidget {
  const AppointmentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Appointments"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            StatCardMessage(
              title: "Appointment Confirmed",
              content:
                  "Booking ID: #123456\nDate: 03-06-2025\nTime: 10:00 AM\nDoctor: Dr. Priya Kumar\nFacility: Sunrise Medical Center",
              actions: [
                ElevatedButton(
                  onPressed: () {
                    // View OP Ticket logic
                  },
                  child: const Text("View OP Ticket"),
                ),
              ],
              icon: Icons.event_available,
            ),
            StatCardMessage(
              title: "Consultation Finished",
              content:
                  "Consultation with Dr. Priya Kumar is complete.\nDate: 03-06-2025\nFacility: Sunrise Medical Center",
              actions: [
                ElevatedButton(
                  onPressed: () {
                    // View OP Ticket logic
                  },
                  child: const Text("View OP Ticket"),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () {
                    // View Prescription logic
                  },
                  child: const Text("View Prescription"),
                ),
              ],
              icon: Icons.assignment_turned_in,
            ),
            StatCardMessage(
              title: "Follow Up",
              content:
                  "Requested by: Dr. Priya Kumar\nDate: 10-06-2025\nFacility: Sunrise Medical Center\nPlease book your follow-up appointment.",
              actions: [
                OutlinedButton(
                  onPressed: () {
                    // Dismiss logic
                  },
                  child: const Text("Dismiss"),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () {
                    // Book Appointment logic
                  },
                  child: const Text("Book Appointment"),
                ),
              ],
              icon: Icons.refresh,
              color: Colors.orange[50],
            ),
          ],
        ),
      ),
    );
  }
}