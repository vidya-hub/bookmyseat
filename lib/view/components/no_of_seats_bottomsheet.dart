import 'package:bookmyseat/controller/booking_provider.dart';
import 'package:bookmyseat/utils/screen_config.dart';
import 'package:bookmyseat/view/booking_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

Future showSeatBookingBottomSheet(BuildContext context) async {
  showModalBottomSheet(
    context: context,
    showDragHandle: true,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(25.0),
      ),
    ),
    builder: (BuildContext context) {
      return const SeatBookingBottomSheet();
    },
  );
}

class SeatBookingBottomSheet extends StatefulWidget {
  const SeatBookingBottomSheet({super.key});

  @override
  SeatBookingBottomSheetState createState() => SeatBookingBottomSheetState();
}

class SeatBookingBottomSheetState extends State<SeatBookingBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: ScreenConfig.height * 0.6,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Consumer<BookingProvider>(
          builder: (context, provider, _) {
            return Stack(
              children: [
                SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        'Select Number of Seats',
                        style: TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 16.0),
                      Image.asset(
                        "assets/cinema.png",
                        height: ScreenConfig.height * 0.3,
                        width: ScreenConfig.height * 0.3,
                      ),
                      SizedBox(
                        height: 30.0,
                        width: ScreenConfig.width,
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: List<Widget>.generate(
                            provider.rangeOfSelectedSeats,
                            (int index) => GestureDetector(
                              onTap: () {
                                provider.setUserRequiredSeats = index + 1;
                              },
                              child: Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                padding: const EdgeInsets.all(16.0),
                                decoration: BoxDecoration(
                                  color: provider.userRequiredSeats == index + 1
                                      ? Colors.pink
                                      : Colors.grey[300],
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                child: Text(
                                  '${index + 1}',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                    color:
                                        provider.userRequiredSeats == index + 1
                                            ? Colors.white
                                            : Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16.0),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.pink,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const BookingPage(),
                        ),
                      );
                    },
                    child: const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      child: Text(
                        'Confirm',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
