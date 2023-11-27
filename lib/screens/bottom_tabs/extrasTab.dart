import 'package:flutter/material.dart';

class ExtrasTab extends StatefulWidget {
  ExtrasTab({Key? key}) : super(key: key);

  @override
  State<ExtrasTab> createState() => _ExtrasTabState();
}

class _ExtrasTabState extends State<ExtrasTab> {
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
          body: const TabBarView(children: [
            Center(child: Text('some dt1')),
            Center(child: Text('some dt2')),
            Center(child: Text('some dt3')),
          ]),
        ),
      ),
    );
  }
}
