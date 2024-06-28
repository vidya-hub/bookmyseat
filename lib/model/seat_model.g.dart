// // GENERATED CODE - DO NOT MODIFY BY HAND

// part of 'seat_model.dart';

// // **************************************************************************
// // TypeAdapterGenerator
// // **************************************************************************

// class SeatModelAdapter extends TypeAdapter<SeatModel> {
//   @override
//   final int typeId = 0;

//   @override
//   SeatModel read(BinaryReader reader) {
//     final numOfFields = reader.readByte();
//     final fields = <int, dynamic>{
//       for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
//     };
//     return SeatModel(
//       seatId: fields[0] as String,
//       bookingStatus: fields[1] as BookingStatus,
//     );
//   }

//   @override
//   void write(BinaryWriter writer, SeatModel obj) {
//     writer
//       ..writeByte(2)
//       ..writeByte(0)
//       ..write(obj.seatId)
//       ..writeByte(1)
//       ..write(obj.bookingStatus);
//   }

//   @override
//   int get hashCode => typeId.hashCode;

//   @override
//   bool operator ==(Object other) =>
//       identical(this, other) ||
//       other is SeatModelAdapter &&
//           runtimeType == other.runtimeType &&
//           typeId == other.typeId;
// }
