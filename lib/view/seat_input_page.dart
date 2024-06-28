import 'package:bookmyseat/controller/booking_provider.dart';
import 'package:bookmyseat/utils/screen_config.dart';
import 'package:bookmyseat/view/components/no_of_seats_bottomsheet.dart';
import 'package:bookmyseat/view/components/row_column_textfield.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SeatInputPage extends StatefulWidget {
  const SeatInputPage({super.key});

  @override
  State<SeatInputPage> createState() => _SeatInputPageState();
}

class _SeatInputPageState extends State<SeatInputPage> {
  @override
  void initState() {
    Future.delayed(Duration.zero, () {
      ScreenConfig.initiaLize(context);
    });

    super.initState();
  }

  TextEditingController rowsController = TextEditingController();
  TextEditingController columnsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Create Seat Layout",
                  style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 30.0),
              RowColumnTextField(
                controller: rowsController,
                label: 'Enter No of Rows',
              ),
              const SizedBox(height: 10.0),
              RowColumnTextField(
                controller: columnsController,
                label: 'Enter No of Columns',
              ),
              const SizedBox(height: 30.0),
              ElevatedButton(
                onPressed: () {
                  if (rowsController.text.isEmpty ||
                      columnsController.text.isEmpty) {
                    return;
                  }
                  context.read<BookingProvider>().setRowsAndColumns(
                        rows: int.parse(rowsController.text),
                        columns: int.parse(columnsController.text),
                      );
                  showSeatBookingBottomSheet(context);
                },
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Submit'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
