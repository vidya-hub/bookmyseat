import 'package:bookmyseat/model/booking_status_model.dart';
import 'package:bookmyseat/utils/enums/booking_status.dart';
import 'package:bookmyseat/utils/screen_config.dart';
import 'package:flutter/material.dart';

class TicketStatusColorWidget extends StatelessWidget {
  const TicketStatusColorWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(
          BookingStatus.values.length,
          (index) => Row(
            children: [
              Container(
                height: 20,
                width: 20,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                    color:
                        BookingStatus.values[index] == BookingStatus.available
                            ? Colors.pinkAccent
                            : Colors.white,
                  ),
                  color: BookingStatusColors.getColor(
                    BookingStatus.values[index],
                  ), // Just for colorful boxes
                ),
              ),
              SizedBox(
                width: ScreenConfig.width * 0.02,
              ),
              Text(BookingStatus.values[index].name),
            ],
          ),
        ),
      ),
    );
  }
}
