import 'package:bookmyseat/controller/booking_provider.dart';
import 'package:bookmyseat/utils/screen_config.dart';
import 'package:bookmyseat/view/components/confirm_booking_button.dart';
import 'package:bookmyseat/view/components/ticket_selection_grid.dart';
import 'package:bookmyseat/view/components/ticket_status_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BookingPage extends StatefulWidget {
  const BookingPage({super.key});

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<BookingProvider>(builder: (context, provider, child) {
        return SafeArea(
          child: Column(
            children: [
              const Expanded(
                child: TicketSelectionGrid(),
              ),
              const TicketStatusColorWidget(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: SizedBox(
                  height: ScreenConfig.height * 0.1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      RichText(
                        text: TextSpan(
                            text: "Selected Seats - ",
                            children: [
                              TextSpan(
                                  text:
                                      "${provider.selectedSeatsKeys.length}/${provider.userRequiredSeats}",
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ))
                            ],
                            style: const TextStyle(color: Colors.black)),
                      ),
                      const ConfirmBookingButton(),
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      }),
    );
  }
}
