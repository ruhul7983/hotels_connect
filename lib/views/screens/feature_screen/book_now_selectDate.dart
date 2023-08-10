import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotels_connect/constants.dart';
import 'package:hotels_connect/controller/counterController.dart';
import 'package:hotels_connect/views/screens/widgets/custom_text_form_field.dart';
import 'package:intl/intl.dart';

import '../../../main.dart';

class BookNowSelectDate extends StatefulWidget {
  final String postId;
  final String hotelName;
  final String hotelRent;
  final String image;

  const BookNowSelectDate(
      {Key? key,
      required this.postId,
      required this.hotelName,
      required this.hotelRent, required this.image})
      : super(key: key);

  @override
  State<BookNowSelectDate> createState() => _BookNowSelectDateState();
}

class _BookNowSelectDateState extends State<BookNowSelectDate> {
  final CounterController counterController = CounterController();

  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  //select date range function
  DateTimeRange selectedDate =
      DateTimeRange(start: DateTime.now(), end: DateTime.now());

  //custom text form field

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            "Select Date",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Center(
                          child: Text(
                        "Check in",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )),
                      Text(
                        DateFormat('MMMM d, yy').format(selectedDate.start),
                        style: TextStyle(fontSize: 17),
                      ),
                    ],
                  ),
                  Center(
                    child: ElevatedButton(
                      child: Text("Choose Date"),
                      onPressed: () async {
                        final DateTimeRange? dateTimeRange =
                            await showDateRangePicker(
                          context: context,
                          firstDate: DateTime.now(),
                          lastDate: DateTime(2025),
                        );
                        if (dateTimeRange != null) {
                          setState(() {
                            selectedDate = dateTimeRange;
                          });
                        }
                      },
                    ),
                  ),
                  Column(
                    children: [
                      Text(
                        "Check out",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        DateFormat('MMMM d, yy').format(selectedDate.end),
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                ],
              ),
              Text(
                "Guest",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                        onPressed: () {
                          counterController.increment();
                        },
                        icon: Icon(Icons.add)),
                    Obx(() => Text(counterController.value.toString())),
                    IconButton(
                        onPressed: () {
                          counterController.decrement();
                        },
                        icon: Icon(Icons.remove)),
                  ],
                ),
              ),
              CustomTextFormField(
                  icon: Icon(Icons.person),
                  controller: fullNameController,
                  label: " Full Name"),
              CustomTextFormField(
                  icon: Icon(Icons.email_outlined),
                  controller: emailController,
                  label: " Email"),
              CustomTextFormField(
                  icon: Icon(Icons.lock),
                  controller: phoneController,
                  label: " Phone Number"),
              InkWell(
                onTap: () {
                  DateTime checkIn = selectedDate.start;
                  DateTime checkOut = selectedDate.end;
                  hotelBooking.BookedHotel(
                      fullNameController.text,
                      emailController.text,
                      phoneController.text,
                      counterController.toString(),
                      checkIn,
                      checkOut,
                      widget.postId,
                    widget.hotelName,
                    widget.hotelRent,
                    widget.image,
                  );
                },
                child: Container(
                  height: 60,
                  width: mq.width * 0.95,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Color(0xFF1AB65C),
                  ),
                  child: Center(
                      child: Text(
                    "Book!",
                    style: TextStyle(fontSize: 17, color: Colors.white),
                  )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
