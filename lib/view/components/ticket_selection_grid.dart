import 'package:bookmyseat/controller/booking_provider.dart';
import 'package:bookmyseat/model/booking_status_model.dart';
import 'package:bookmyseat/model/seat_model.dart';
import 'package:bookmyseat/utils/enums/booking_status.dart';
import 'package:bookmyseat/utils/screen_config.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TicketSelectionGrid extends StatelessWidget {
  const TicketSelectionGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<BookingProvider>(builder: (
      context,
      provider,
      child,
    ) {
      return InteractiveViewer(
        // scaleFactor: 0.1,
        // minScale: 0.1,
        // maxScale: 10.0,
        child: GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.symmetric(
            horizontal: ScreenConfig.width * 0.05,
            vertical: 10,
          ),
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisSpacing: 3,
            crossAxisSpacing: 3,
            crossAxisCount: provider.noOfColumns + 1,
          ),
          itemCount: provider.seats.length,
          itemBuilder: (context, index) {
            String seatKey = provider.seats.keys.toList()[index];
            SeatModel seatModel = provider.seats.values.toList()[index];

            if (seatModel.seatRow == 0 && seatModel.seatColumn == 0) {
              return Container();
            } else if (seatModel.isSeat) {
              return Center(
                child: Text(
                  seatKey,
                  style: const TextStyle(
                      fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
              ); // Column header
            } else {
              return InkWell(
                onTap: () {
                  provider.selectSeat(seatKey);
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                      color: seatModel.bookingStatus == BookingStatus.occupied
                          ? Colors.white
                          : Colors.pinkAccent,
                    ),
                    color: BookingStatusColors.getColor(
                      seatModel.bookingStatus,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      seatKey,
                      style: TextStyle(
                        fontSize: 7.0,
                        color:
                            seatModel.bookingStatus == BookingStatus.available
                                ? Colors.black
                                : Colors.white,
                      ),
                    ),
                  ),
                ),
              );
            }
          },
        ),
      );
    });
  }
}
