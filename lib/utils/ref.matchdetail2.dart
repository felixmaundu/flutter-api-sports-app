// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter6_sports_app/models/eventsModel.dart';
import 'package:flutter6_sports_app/models/fixturesModel.dart';
import 'package:flutter6_sports_app/models/headtoheadModel.dart';
import 'package:flutter6_sports_app/models/predictionModel.dart';
import 'package:flutter6_sports_app/models/statisticsModel.dart';
import 'package:flutter6_sports_app/services/api_service.dart';

// class MatchDetailPage extends StatefulWidget {
//   final Responses response;

class MatchDetailPage extends StatefulWidget {
  final Responses response;

  const MatchDetailPage({super.key, required this.response});
  @override
  _MatchDetailPageState createState() => _MatchDetailPageState();
}

class _MatchDetailPageState extends State<MatchDetailPage>
    with SingleTickerProviderStateMixin {
  EventsModel? eventsModel;
  PredictionModel? predictionModel;
  StatisticsModel? statisticsModel;
  HeadToHeadModel? headToHeadModel;
  bool isLoading = true;
  int _currentIndex = 0;
  final List<Widget> _tabContents = [
    const TabContent(title: 'Events1'),
    // _buildHeadToHead(),
    const TabContent(title: 'Statistics'),
    const TabContent(title: 'predictions'),
    const TabContent(title: 'Head To Head'),
    const TabContent(title: 'Match Info'),
    // TabContent(title: 'predictions'),
  ];

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    fetchMatchData();
    _tabController = TabController(
      length: _tabs.length,
      initialIndex: _currentIndex,
      vsync: this,
    );
  }

  final List<Tab> _tabs = [
    const Tab(text: 'Events2'),
    const Tab(text: 'Statistics'),
    const Tab(text: 'predictions'),
    const Tab(text: 'Head To Head'),
    const Tab(text: 'Match Info'),
  ];

  void fetchMatchData() async {
    try {
      EventsModel eventData =
          await ApiService.fetchEvents(widget.response.fixture!.id!);
      PredictionModel predictionData =
          await ApiService.fetchPredictions(widget.response.fixture!.id!);
      StatisticsModel statisticsModelData =
          await ApiService.fetchStatistics(widget.response.fixture!.id!);
      HeadToHeadModel headToHeadModelData = await ApiService.fetchHeadToHead(
          widget.response.teams!.home!.id!, widget.response.teams!.away!.id!);
      setState(() {
        eventsModel = eventData;
        predictionModel = predictionData;
        statisticsModel = statisticsModelData;
        headToHeadModel = headToHeadModelData;
        isLoading = false;
      });
    } catch (e) {
      // print('Error fetching events and predictions: $e');
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final DateTime matchTime = DateTime.parse(widget.response.fixture!.date!);
    final DateTime matchDate = DateTime.parse(widget.response.fixture!.date!);
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 300.0,
            pinned: true,
            centerTitle: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                '${widget.response.teams!.home!.name} vs ${widget.response.teams!.away!.name}',
                style: const TextStyle(
                    fontSize: 15,
                    fontStyle: FontStyle.normal,
                    color: Colors.black),
              ),
              background: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      if (widget.response.fixture!.status!.long != null)
                        Text(
                          '${widget.response.fixture!.status!.long}',
                          style: const TextStyle(
                              fontSize: 15,
                              fontStyle: FontStyle.normal,
                              color: Colors.black),
                        ),
                      const SizedBox(width: 10),
                      if (widget.response.fixture!.status!.elapsed != null)
                        Text(
                          '${widget.response.fixture!.status!.elapsed}\'',
                          style: const TextStyle(
                              fontSize: 15,
                              fontStyle: FontStyle.normal,
                              color: Colors.black),
                        ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.network(
                        '${widget.response.teams!.home!.logo}',
                        fit: BoxFit.cover,
                        height: 60,
                        width: 60,
                      ),
                      if (widget.response.goals!.home != null)
                        Text(
                          '${widget.response.goals!.home} ',
                          style: const TextStyle(
                              fontSize: 20,
                              fontStyle: FontStyle.normal,
                              color: Colors.black),
                        ),
                      const Text(
                        '-',
                        style: TextStyle(
                          fontSize: 40,
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                      if (widget.response.goals!.away != null)
                        Text(
                          '${widget.response.goals!.away}',
                          style: const TextStyle(
                              fontSize: 20,
                              fontStyle: FontStyle.normal,
                              color: Colors.black),
                        ),
                      Image.network(
                        '${widget.response.teams!.away!.logo}',
                        fit: BoxFit.cover,
                        height: 60,
                        width: 60,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      if (widget.response.fixture!.referee != null)
                        if (widget.response.fixture!.periods != null)
                          Text(
                            '${matchDate.day.toString().padRight(1, '0')}/${matchDate.month.toString().padLeft(2, '0')}/${matchDate.year.toString().padLeft(2, '0')}',
                            style: const TextStyle(
                                fontSize: 15,
                                fontStyle: FontStyle.normal,
                                color: Colors.black),
                          ),
                      const SizedBox(width: 10),
                      if (widget.response.fixture!.periods != null)
                        Text(
                          '${matchTime.hour.toString().padLeft(1, '0')}:${matchTime.minute.toString().padLeft(2, '0')}',
                          style: const TextStyle(
                              fontSize: 15,
                              fontStyle: FontStyle.normal,
                              color: Colors.black),
                        ),
                      const SizedBox(width: 10),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      if (widget.response.league!.country != null)
                        Text(
                          'Country:${widget.response.league!.country}',
                          style: const TextStyle(
                              fontSize: 13,
                              fontStyle: FontStyle.normal,
                              color: Colors.black),
                        ),
                      const SizedBox(
                        width: 5,
                      ),
                      if (widget.response.league!.flag != null)
                        Image.network(
                          '${widget.response.league!.flag}',
                          fit: BoxFit.cover,
                          height: 20,
                          width: 30,
                        ),
                      const SizedBox(
                        width: 5,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      if (widget.response.league!.name != null)
                        Text(
                          ' ${widget.response.league!.name}',
                          style: const TextStyle(
                              fontSize: 13,
                              fontStyle: FontStyle.normal,
                              color: Colors.black),
                        ),
                      const SizedBox(
                        width: 5,
                      ),
                      if (widget.response.league!.logo != null)
                        Image.network(
                          '${widget.response.league!.logo}',
                          fit: BoxFit.cover,
                          height: 20,
                          width: 30,
                        ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      if (widget.response.league!.round != null)
                        Text(
                          'Round: ${widget.response.league!.round}',
                          style: const TextStyle(
                              fontSize: 13,
                              fontStyle: FontStyle.normal,
                              color: Colors.black),
                        ),
                      if (widget.response.league!.season != null)
                        Text(
                          'Season: ${widget.response.league!.season}',
                          style: const TextStyle(
                              fontSize: 13,
                              fontStyle: FontStyle.normal,
                              color: Colors.black),
                        ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      if (widget.response.fixture!.venue!.name != null)
                        Text(
                          'Venue: ${widget.response.fixture!.venue!.name}',
                          style: const TextStyle(
                              fontSize: 13,
                              fontStyle: FontStyle.normal,
                              color: Colors.black),
                        ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      if (widget.response.fixture!.referee != null)
                        Text(
                          'Referee: ${widget.response.fixture!.referee}',
                          style: const TextStyle(
                              fontSize: 13,
                              fontStyle: FontStyle.normal,
                              color: Colors.black),
                        ),
                      const SizedBox(width: 5),
                    ],
                  ),
                ],
              ),

              //     Image.network(
              //   'https://via.placeholder.com/400x200',
              //   fit: BoxFit.cover,
              // ),
            ),
            // leading: IconButton(
            //   icon: const Icon(Icons.settings),
            //   onPressed: () {},
            // ),
            // actions: <Widget>[
            //   IconButton(
            //     icon: const Icon(Icons.settings),
            //     onPressed: () {},
            //   ),
            // ],
          ),
          // SliverList(
          //   delegate: SliverChildBuilderDelegate(
          //     ((context, index) => ListTile(
          //           tileColor:
          //               (index % 2 == 0) ? Colors.white : Colors.green[50],
          //           title: const Center(
          //             child: Text(
          //               'title',
          //               style: TextStyle(
          //                   fontWeight: FontWeight.normal, fontSize: 50),
          //             ),
          //           ),
          //         )),
          //     childCount: 51,
          //   ),
          // ),
          SliverPersistentHeader(
            pinned: true,
            delegate: CustomTabBarDelegate(
              child: TabBar(
                tabs: _tabs,
                // .map((tab) => Tab(
                //       text: tab.title,
                //     ))
                // .toList(),
                onTap: (index) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
                controller: _tabController,
              ),
            ),
          ),

          SliverFillRemaining(
            child: TabBarView(
              controller: _tabController,
              children: _tabContents,
              // controller: TabController(
              //   length: _tabs.length,
              //   initialIndex: _currentIndex,
              // ),
            ),
          ),
        ],
      ),
    );
  }
}

class TabContent extends StatelessWidget {
  final String title;

  const TabContent({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        title,
        style: const TextStyle(fontSize: 24.0),
      ),
    );
  }
}

class CustomTabBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar child;

  CustomTabBarDelegate({required this.child});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.white,
      child: child,
    );
  }

  @override
  double get maxExtent => child.preferredSize.height;

  @override
  double get minExtent => child.preferredSize.height;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
