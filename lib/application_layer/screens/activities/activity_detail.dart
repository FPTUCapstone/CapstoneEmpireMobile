import 'package:empiregarage_mobile/application_layer/screens/activities/qrcode.dart';
import 'package:flutter/material.dart';

class ActivityDetailPage extends StatelessWidget {
  final int bookingId;

  const ActivityDetailPage({
    super.key,
    required this.bookingId,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Booking Detail'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Booking ID: $bookingId',
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => const QRCodePage(
                          bookingId: 42,
                        )));
              },
              child: const Text('Check In'),
            ),
          ],
        ),
      ),
    );
  }
}
