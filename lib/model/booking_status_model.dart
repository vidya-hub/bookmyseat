import 'package:bookmyseat/utils/enums/booking_status.dart';
import 'package:flutter/material.dart';

class BookingStatusColors {
  static Color getColor(
    BookingStatus status,
  ) {
    switch (status) {
      case BookingStatus.available:
        return Colors.white;
      case BookingStatus.occupied:
        return Colors.grey;
      case BookingStatus.selected:
        return Colors.pinkAccent;
      default:
        return Colors.black; // Default color, if needed
    }
  }
}
