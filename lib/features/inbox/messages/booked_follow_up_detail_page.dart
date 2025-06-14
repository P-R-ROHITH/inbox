import 'package:flutter/material.dart';
import 'package:inbox/features/inbox/messages/follow_up_data.dart';

class BookedFollowUpDetailPage extends StatelessWidget {
  final FollowUpData data;

  const BookedFollowUpDetailPage({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            CircleAvatar(
              radius: 40,
              backgroundImage: NetworkImage(data.doctorProfilePic),
            ),
            const SizedBox(height: 12),
            Text(
              data.doctorName,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            ),
            const SizedBox(height: 4),
            const Text(
              "FOLLOW-UP",
              style: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              data.token,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 36),
            ),
            const Text(
              "Token",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Text(
                "Booked",
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.check_circle, color: Colors.green),
                    const SizedBox(width: 8),
                    Text(
                      data.paymentStatus,
                      style: const TextStyle(color: Colors.green, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.calendar_today, color: Colors.blue),
                    const SizedBox(width: 8),
                    Text(
                      data.date,
                      style: const TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blue.shade100),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Booking id: ${data.bookingId}",
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      const Icon(Icons.local_hospital, color: Colors.blue),
                      const SizedBox(width: 8),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            data.facilityName,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.blue,
                            ),
                          ),
                          Text(
                            data.facilityAddress,
                            style: const TextStyle(color: Colors.black54),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      const Icon(Icons.access_time, color: Colors.black54),
                      const SizedBox(width: 8),
                      const Text("Time (Expected)"),
                      const Spacer(),
                      Text(
                        data.time,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      const Icon(Icons.payment, color: Colors.black54),
                      const SizedBox(width: 8),
                      const Text("Payment"),
                      const Spacer(),
                      Text(
                        data.paymentMode,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        // Cancel follow up logic
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text(
                        "Cancel Follow-Up",
                        style: TextStyle(color: Colors.white), // Make text white
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}