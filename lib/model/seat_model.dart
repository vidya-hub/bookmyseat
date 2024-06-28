import 'package:bookmyseat/utils/enums/booking_status.dart';
// import 'package:hive/hive.dart';

// part 'seat_model.g.dart';

// @HiveType(typeId: 0)
class SeatModel {
  int seatRow;
  int seatColumn;
  BookingStatus bookingStatus;
  bool isSeat;
  bool showSeat;
  SeatModel({
    required this.seatColumn,
    required this.seatRow,
    required this.bookingStatus,
    this.isSeat = true,
    this.showSeat = true,
  });
  SeatModel copyWith({
    int? seatRow,
    int? seatColumn,
    BookingStatus? bookingStatus,
    bool? isSeat,
    bool? showSeat,
  }) {
    SeatModel seatModel = SeatModel(
      seatRow: seatRow ?? this.seatRow,
      seatColumn: seatColumn ?? this.seatColumn,
      bookingStatus: bookingStatus ?? this.bookingStatus,
      isSeat: isSeat ?? this.isSeat,
      showSeat: showSeat ?? this.showSeat,
    );
    return seatModel;
  }
}
