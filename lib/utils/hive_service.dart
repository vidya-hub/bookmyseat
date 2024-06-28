// import 'dart:io';

// import 'package:bookmyseat/model/seat_model.dart';
// import 'package:flutter/foundation.dart';
// import 'package:hive/hive.dart';
// import "package:universal_html/html.dart" as html;
// import 'package:path_provider/path_provider.dart' as path_provider;

// class HiveService {
//   static final HiveService _hiveService = HiveService._internal();
//   static const String _boxName = 'booking_box';
//   static Box<dynamic>? _box;
//   static Map<String, SeatModel> currentSeats = {};
//   HiveService._internal();
//   static Future<void> init() async {
//     if (_box != null && _box!.isOpen) return;
//     final appDocumentDir = await getDirectory();
//     Hive.init(appDocumentDir?.path);
//     await adapterRegistration();
//     _box = await Hive.openBox(_boxName);
//     await setSeats();
//   }

//   static Future<void> saveSeats(Map<String, SeatModel> seats) async {
//     await init();
//     currentSeats = seats;
//     await _box!.put('seats', seats);
//   }

//   static Future<void> updateSeats(Map<String, SeatModel> seats) async {
//     await init();
//     currentSeats = seats;
//     await _box!.put('seats', seats);
//   }

//   static Future<Directory?> getDirectory() async {
//     if (kIsWeb) {
//       return Directory(html.window.navigator.vendor);
//     }
//     return await path_provider.getApplicationDocumentsDirectory();
//   }

//   static Future<void> adapterRegistration() async {
//     Hive.registerAdapter(SeatModelAdapter());
//   }
// }
