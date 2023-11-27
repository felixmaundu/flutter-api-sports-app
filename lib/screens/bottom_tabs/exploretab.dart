import 'package:flutter/material.dart';
import 'package:flutter6_sports_app/screens/top_tabs/countriesPage.dart';

class ExplorePage extends StatelessWidget {
  const ExplorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Explore'),
          bottom: const TabBar(
            tabs: <Widget>[
              Tab(text: 'Countries'),
              Tab(text: 'Leagues'),
              Tab(text: 'Seasons'),
            ],
          ),
        ),
        body: const TabBarView(
          children: <Widget>[
            CoutriesPage(),
            Center(child: Text('Leagues Tab')),
            Center(child: Text('Seasons Tab')),
          ],
        ),
      ),
    );
  }
}
