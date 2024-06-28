import 'package:bookmyseat/utils/screen_config.dart';
import 'package:bookmyseat/view/booking_page.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ConfirmedBookingPage extends StatelessWidget {
  ConfirmedBookingPage({super.key, this.bookedSeatKeys = const []});
  List<String> bookedSeatKeys = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Your Booking is confirmed....🥳",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            SizedBox(
              height: 30,
              width: ScreenConfig.width,
            ),
            Text(
              bookedSeatKeys.join(" , "),
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(
              height: 40,
            ),
            TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const BookingPage(),
                  ),
                );
              },
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.arrow_back_rounded,
                    size: 25,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "Book Again ",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
