import 'package:flutter/material.dart';
import 'package:flutter6_sports_app/screens/top_tabs/newstab.dart';
import 'package:flutter6_sports_app/screens/top_tabs/livewatch.dart';

class UpdatesTab extends StatefulWidget {
  UpdatesTab({Key? key}) : super(key: key);

  @override
  State<UpdatesTab> createState() => _UpdatesTabState();
}

class _UpdatesTabState extends State<UpdatesTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: const TabBar(
                // isScrollable: true,
                tabs: [
                  Tab(
                    text: 'live watch',
                  ),
                  Tab(
                    text: 'Updates',
                  ),
                  Tab(
                    text: 'something else',
                  ),
                ]),
          ),
          body: TabBarView(
            children: [
              LiveWatch(),
              NewsTab(),
              Center(child: Text('some dt3')),
            ],
          ),
        ),
      ),
    );
  }
}
