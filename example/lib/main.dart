import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:horizontal_calendar/horizontal_calendar.dart';
import 'package:horizontal_calendar/utils/app_color.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String selectedDate = "";

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      selectedDate = DateFormat('dd MMMM, yyyy').format(DateTime.now());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.purplePrimaryColor,
          title: const Text(
            'Horizontal Calender',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              HorizontalCalenderWidget(
                onSelected: (DateTime date) {
                  setState(() {
                    selectedDate = DateFormat('dd MMMM, yyyy').format(date);
                  });
                },
              ),
              const SizedBox(
                height: 40,
              ),
              const Text(
                "Selected Date:",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                ),
                textAlign: TextAlign.center,
              ),
              Text(
                selectedDate,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
