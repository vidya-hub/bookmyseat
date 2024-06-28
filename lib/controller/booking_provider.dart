import 'package:bookmyseat/model/seat_model.dart';
import 'package:bookmyseat/utils/enums/booking_status.dart';
import 'package:flutter/material.dart';

class BookingProvider extends ChangeNotifier {
  int noOfRows = 10;
  int noOfColumns = 10;
  get noOfSeats => (noOfRows + 1) * (noOfColumns + 1);
  int userRequiredSeats = 1;
  Map<String, SeatModel> seats = {};
  int rangeOfSelectedSeats = 5;
  List<String> selectedSeatsKeys = [];

  bool get canBook => selectedSeatsKeys.length == userRequiredSeats;
  num get remainingSeatsToBook => userRequiredSeats - selectedSeatsKeys.length;
  set setUserRequiredSeats(int value) {
    userRequiredSeats = value;
    notifyListeners();
  }

  // void selectSeat(String selectedSeatKey) {
  //   SeatModel? selectedSeat = seats[selectedSeatKey];
  //   if (selectedSeat == null) return;
  //   if (selectedSeat.bookingStatus == BookingStatus.occupied) {
  //     print("Occupied Seat");
  //     return;
  //   }
  //   selectedSeat = selectedSeat.copyWith(
  //     bookingStatus: selectedSeat.bookingStatus == BookingStatus.available
  //         ? BookingStatus.selected
  //         : BookingStatus.available,
  //   );
  //   seats[selectedSeatKey] = selectedSeat;
  //   notifyListeners();
  // }

  void selectSeat(String selectedSeatKey) {
    SeatModel? selectedSeat = seats[selectedSeatKey];
    if (selectedSeat == null) return;

    // Reset if already selected required seats
    if (selectedSeatsKeys.length == userRequiredSeats) {
      print("Already selected Required seats");
      for (String key in selectedSeatsKeys) {
        seats[key] =
            seats[key]!.copyWith(bookingStatus: BookingStatus.available);
      }
      selectedSeatsKeys = [];
      notifyListeners();
    }

    // If the seat is occupied, return
    if (selectedSeat.bookingStatus == BookingStatus.occupied) {
      print("Occupied Seat");
      return;
    }

    // If the seat is already selected, deselect it
    if (selectedSeat.bookingStatus == BookingStatus.selected) {
      selectedSeat =
          selectedSeat.copyWith(bookingStatus: BookingStatus.available);
      selectedSeatsKeys.remove(selectedSeatKey);
      seats[selectedSeatKey] = selectedSeat;
    } else {
      // Attempt to select the required number of consecutive seats
      List<String> consecutiveSeats = [];
      int seatRow = selectedSeat.seatRow;
      int startColumn = selectedSeat.seatColumn;

      for (int col = startColumn;
          col < (startColumn + userRequiredSeats) - selectedSeatsKeys.length;
          col++) {
        String key = '${String.fromCharCode(64 + seatRow)}$col';
        if (seats[key]?.bookingStatus == BookingStatus.available) {
          consecutiveSeats.add(key);
        } else {
          break;
        }
      }

      // Select seats if we have the required number of consecutive seats
      if (consecutiveSeats.length == userRequiredSeats) {
        for (String key in consecutiveSeats) {
          if (seats[key]?.bookingStatus != BookingStatus.available) {
            return;
          }
          seats[key] =
              seats[key]!.copyWith(bookingStatus: BookingStatus.selected);
          selectedSeatsKeys.add(key);
        }
      } else {
        // Remove previously selected seats if they meet the userRequiredSeats condition
        if (selectedSeatsKeys.length == userRequiredSeats) {
          for (String key in selectedSeatsKeys) {
            seats[key] =
                seats[key]!.copyWith(bookingStatus: BookingStatus.available);
          }
          selectedSeatsKeys = [];
        }

        // Select the available consecutive seats
        for (String key in consecutiveSeats) {
          if (seats[key]?.bookingStatus != BookingStatus.available) {
            return;
          }
          seats[key] =
              seats[key]!.copyWith(bookingStatus: BookingStatus.selected);
          selectedSeatsKeys.add(key);
        }
      }
    }

    notifyListeners();
  }

  void resetPreviouslySelectedSeats() {
    for (String key in selectedSeatsKeys) {
      seats[key] = seats[key]!.copyWith(bookingStatus: BookingStatus.occupied);
    }
    selectedSeatsKeys = [];
    notifyListeners();
  }

  void setRowsAndColumns({
    required int rows,
    required int columns,
  }) {
    noOfRows = rows;
    noOfColumns = columns;

    seats = {
      for (int index = 0; index < noOfSeats; index++)
        _seatKey(index): SeatModel(
          bookingStatus: BookingStatus.available,
          seatRow: index ~/ (noOfColumns + 1),
          seatColumn: index % (noOfColumns + 1),
          showSeat: (index ~/ (noOfColumns + 1)) != 0 &&
              (index % (noOfColumns + 1)) != 0,
          isSeat: (index ~/ (noOfColumns + 1)) == 0 ||
              (index % (noOfColumns + 1)) == 0,
        )
    };

    notifyListeners();
  }

  String _seatKey(int index) {
    int row = index ~/ (noOfColumns + 1);
    int col = index % (noOfColumns + 1);

    if (row == 0 && col == 0) return "empty";
    if (row == 0) return '$col';
    if (col == 0) return String.fromCharCode(64 + row);

    return '${String.fromCharCode(64 + row)}$col';
  }
}
