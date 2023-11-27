// ignore_for_file: library_private_types_in_public_api, file_names

import 'package:flutter/material.dart';
import 'package:flutter6_sports_app/screens/bottom_tabs/hometab.dart';
import 'package:flutter6_sports_app/widgets/buildMatchesMinusOneDay.dart';
import 'package:flutter6_sports_app/widgets/buildMatchesMinusTwoDays.dart';
import 'package:flutter6_sports_app/widgets/buildMatchesPlusOneDay.dart';
import 'package:flutter6_sports_app/widgets/buildMatchesPlusTwoDay.dart';
import 'package:intl/intl.dart'; // Import intl package for date formatting

class HomeTabN extends StatefulWidget {
  const HomeTabN({super.key});

  @override
  _HomeTabNState createState() => _HomeTabNState();
}

class _HomeTabNState extends State<HomeTabN> {
  DateTime _selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nova Sports'),
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.calendar_today),
            onPressed: () => _selectDate(context),
          ),
        ],
      ),
      body: DefaultTabController(
        length: 5,
        initialIndex: 2, // Index 2 represents today's date
        child: Column(
          children: [
            Container(
              constraints: const BoxConstraints.expand(height: 50),
              child: TabBar(
                tabs: [
                  Tab(child: getTabText(-2)),
                  Tab(child: getTabText(-1)),
                  Tab(child: getTabText(0)),
                  Tab(child: getTabText(1)),
                  Tab(child: getTabText(2)),
                ],
              ),
            ),
            const Expanded(
              child: TabBarView(
                children: [
                  // buildTabContent(-2),
                  BuildMatchesMinusTwoDays(),
                  BuildMatchesMinusOneDay(),
                  // buildTabContent(-1),
                  // buildTabContent(0),
                  HomeTab(),
                  // buildTabContent(1),
                  BuildMatchesPlusOneDay(),
                  // buildTabContent(2),
                  BuildMatchesPlusTwoDay(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget getTabText(int dayOffset) {
    DateTime currentDate = DateTime.now().add(Duration(days: dayOffset));
    String dayOfWeek = DateFormat('EEE').format(currentDate).toLowerCase();
    String dateAndMonth = DateFormat('d/MM').format(currentDate);

    return Column(
      children: [
        Text(
          dayOfWeek,
          style: const TextStyle(fontSize: 14),
        ),
        Text(
          dateAndMonth,
          style: const TextStyle(fontSize: 12),
        ),
      ],
    );
  }

  Widget buildTabContent(int dayOffset) {
    DateTime currentDate = DateTime.now().add(Duration(days: dayOffset));
    String formattedDate = DateFormat('EEEE, d').format(currentDate);

    return Center(
      child: Text(
        formattedDate,
        style: const TextStyle(fontSize: 24),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        // print("Selected date: $_selectedDate");
      });
    }
  }
}
