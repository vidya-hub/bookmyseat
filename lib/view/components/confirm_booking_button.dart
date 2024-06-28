import 'package:bookmyseat/controller/booking_provider.dart';
import 'package:bookmyseat/utils/toast.dart';
import 'package:bookmyseat/view/confirmed_booking_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ConfirmBookingButton extends StatelessWidget {
  const ConfirmBookingButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<BookingProvider>(builder: (context, provider, _) {
      return ElevatedButton(
        onPressed: () async {
          if (!provider.canBook) {
            showToast(
              context,
              "${provider.remainingSeatsToBook} seats are remaining to book!",
            );
            return;
          }
          await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ConfirmedBookingPage(
                bookedSeatKeys: provider.selectedSeatsKeys,
              ),
            ),
          );
          // ignore: use_build_context_synchronously
          provider.resetPreviouslySelectedSeats();
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.pinkAccent,
        ),
        child: const Text(
          'Confirm Booking',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      );
    });
  }
}
