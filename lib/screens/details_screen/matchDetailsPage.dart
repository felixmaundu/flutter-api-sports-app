// ignore_for_file: prefer_const_constructors_in_immutables, file_names, use_key_in_widget_constructors, unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:flutter6_sports_app/models/eventsModel.dart';
import 'package:flutter6_sports_app/models/fixturesModel.dart';
import 'package:flutter6_sports_app/models/headtoheadModel.dart';
import 'package:flutter6_sports_app/models/predictionModel.dart';
import 'package:flutter6_sports_app/models/statisticsModel.dart';
import 'package:flutter6_sports_app/services/api_service.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MatchDetailPage extends StatefulWidget {
  // final Responses response;
  final dynamic response; // Change the type to dynamic

  MatchDetailPage({required this.response});

  @override
  State<MatchDetailPage> createState() => _MatchDetailPageState();
}

class _MatchDetailPageState extends State<MatchDetailPage> {
  EventsModel? eventsModel;
  PredictionModel? predictionModel;
  StatisticsModel? statisticsModel;
  HeadToHeadModel? headToHeadModel;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchMatchData();
  }

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
    if (widget.response is Responses) {
      // Responses response = widget.response as Responses;
      // Handle using response as Responses
    } else if (widget.response is ResponseH2H) {
      // ResponseH2H responseH2H = widget.response as ResponseH2H;
      // Handle using responseH2H as ResponseH2H
    }

    final DateTime matchTime = DateTime.parse(widget.response.fixture!.date!);
    final DateTime matchDate = DateTime.parse(widget.response.fixture!.date!);
    return DefaultTabController(
      length: 5, // Number of tabs
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: 300.0,
              floating: false,
              pinned: true,
              // backgroundColor: Colors.black12,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                titlePadding: const EdgeInsets.all(10),
                title: Text(
                  '${widget.response.teams!.home!.name} vs ${widget.response.teams!.away!.name!}',
                  style: const TextStyle(
                    fontSize: 15,
                    fontStyle: FontStyle.normal,
                  ),
                ),
                background: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
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
                            ),
                          ),
                        const SizedBox(width: 10),
                        if (widget.response.fixture!.status!.elapsed != null)
                          Text(
                            '${widget.response.fixture!.status!.elapsed}\'',
                            style: const TextStyle(
                              fontSize: 15,
                              fontStyle: FontStyle.normal,
                            ),
                          ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        if (widget.response.teams!.home!.logo != null)
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
                            ),
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
                            ),
                          ),
                        if (widget.response.teams!.away!.logo != null)
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
                              ),
                            ),
                        const SizedBox(width: 10),
                        if (widget.response.fixture!.periods != null)
                          Text(
                            '${matchTime.hour.toString().padLeft(1, '0')}:${matchTime.minute.toString().padLeft(2, '0')}',
                            style: const TextStyle(
                              fontSize: 15,
                              fontStyle: FontStyle.normal,
                            ),
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
                            ),
                          ),
                        const SizedBox(
                          width: 5,
                        ),
                        if (widget.response.league!.flag != null)
                          SvgPicture.network(
                            '${widget.response.league!.flag}',
                            height: 20,
                            width: 30,
                          ),
                        const SizedBox(
                          width: 5,
                        ),
                      ],
                    ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   crossAxisAlignment: CrossAxisAlignment.center,
                    //   children: [
                    //     if (widget.response.league!.name != null)
                    //       Text(
                    //         ' ${widget.response.league!.name}',
                    //         style: const TextStyle(
                    //             fontSize: 13,
                    //             fontStyle: FontStyle.normal,
                    //             color: Colors.black),
                    //       ),
                    //     const SizedBox(
                    //       width: 5,
                    //     ),
                    //     if (widget.response.league!.logo != null)
                    //       Image.network(
                    //         '${widget.response.league!.logo}',
                    //         fit: BoxFit.cover,
                    //         height: 20,
                    //         width: 30,
                    //       ),
                    //   ],
                    // ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   crossAxisAlignment: CrossAxisAlignment.center,
                    //   children: [
                    //     if (widget.response.league!.round != null)
                    //       Text(
                    //         'Round: ${widget.response.league!.round}',
                    //         style: const TextStyle(
                    //             fontSize: 13,
                    //             fontStyle: FontStyle.normal,
                    //             color: Colors.black),
                    //       ),
                    //     if (widget.response.league!.season != null)
                    //       Text(
                    //         'Season: ${widget.response.league!.season}',
                    //         style: const TextStyle(
                    //             fontSize: 13,
                    //             fontStyle: FontStyle.normal,
                    //             color: Colors.black),
                    //       ),
                    //   ],
                    // ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    //   crossAxisAlignment: CrossAxisAlignment.center,
                    //   children: [
                    //     if (widget.response.fixture!.venue!.name != null)
                    //       Text(
                    //         'Venue: ${widget.response.fixture!.venue!.name}',
                    //         style: const TextStyle(
                    //             fontSize: 13,
                    //             fontStyle: FontStyle.normal,
                    //             color: Colors.black),
                    //       ),
                    //   ],
                    // ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    //   crossAxisAlignment: CrossAxisAlignment.center,
                    //   children: [
                    //     if (widget.response.fixture!.referee != null)
                    //       Text(
                    //         'Referee: ${widget.response.fixture!.referee}',
                    //         style: const TextStyle(
                    //             fontSize: 13,
                    //             fontStyle: FontStyle.normal,
                    //             color: Colors.black),
                    //       ),
                    //     const SizedBox(width: 5),
                    //   ],
                    // ),

                    //bottom: PreferredSize(
//     preferredSize: const Size.fromHeight(
//                   48.0,
//                 ), // Adjust the preferredSize as needed
//                 child: TabBar(
//                   isScrollable: true,
//                   tabs: tabs.map((String tab) {
//                     return Tab(text: tab);
//                   }).toList(),
//                 ),
//               ),
//             ),
                  ],
                ),
              ),
            ),
            SliverPersistentHeader(
              delegate: MySliverAppBarDelegate(
                TabBar(
                  indicatorColor: Colors.deepPurple,
                  unselectedLabelColor: Colors.grey[300],
                  labelColor: Colors.deepPurple,
                  isScrollable: true,
                  tabs: const [
                    Tab(text: 'Events'),
                    Tab(text: 'Statistics'),
                    Tab(text: 'Predictions'),
                    Tab(text: 'Head To Head'),
                    Tab(text: 'Match Info'),
                  ],
                ),
              ),
              pinned: true,
            ),
            SliverFillRemaining(
              child: TabBarView(
                children: [
                  // Add your content for the 'Events' tab here

                  _buildEventsList(),
                  // Add your content for the 'Statistics' tab here

                  _buildStatistics(),
                  // Add your content for the 'Predictions' tab here

                  _buildPredictions(),
                  // CustomizedPredictionWidget(
                  //   percentage: null,
                  // ),
                  // const Center(child: Text('head to head Content')),
                  _buildHeadToHead(),
                  const Center(child: Text('match info  Content')),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPredictions() {
    // ignore: unnecessary_null_comparison
    if (predictionModel != null && predictionModel!.response != null) {
      final List<Response> predictions = predictionModel!.response;
      return ListView.builder(
        itemCount: predictions.length,
        itemBuilder: (context, index) {
          final Response prediction = predictions[index];

          return Card(
            margin: const EdgeInsets.fromLTRB(0, 3, 0, 2),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [Text('Attack prediction')],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            FractionallySizedBox(
                              widthFactor:
                                  prediction.comparison!.att!.home != null
                                      ? double.parse(prediction
                                          .comparison!.att!.home
                                          .replaceAll('%', ''))

                                      ///
                                      //100
                                      //*
                                      // MediaQuery.of(context).size.width
                                      : 0

                              //0.7
                              ,
                              child: Container(
                                height: 10,
                                decoration: const BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(5),
                                    bottomLeft: Radius.circular(5),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      Text(
                        '${prediction.comparison!.att!.home ?? ''}',
                        maxLines: 15,
                        style: const TextStyle(),
                      ),
                      const SizedBox(width: 2), // Adjust the width as needed
                      const Text(
                        '-',
                        style: TextStyle(),
                      ),
                      const SizedBox(width: 2), // Adjust the width as needed
                      Text(
                        '${prediction.comparison!.att!.away ?? ''}',
                        maxLines: 15,
                        style: const TextStyle(),
                      ),
                      // Orange Container
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            FractionallySizedBox(
                              widthFactor:
                                  prediction.comparison!.att!.away != null
                                      ? double.parse(prediction
                                          .comparison!.att!.away
                                          .replaceAll('%', '')) // *
                                      //  100
                                      : 0,
                              child: Container(
                                height: 10,
                                decoration: const BoxDecoration(
                                  color: Colors.orange,
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(5),
                                    bottomRight: Radius.circular(5),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 10),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [Text('Defence prediction')],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Green Container
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            FractionallySizedBox(
                              widthFactor:
                                  prediction.comparison!.def!.home != null
                                      ? double.parse(prediction
                                              .comparison!.def!.home
                                              .replaceAll('%', '')) /
                                          100
                                      //*
                                      // MediaQuery.of(context).size.width
                                      : 0,
                              child: Container(
                                height: 10,
                                // Remove percentage sign and parse as double

                                decoration: const BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(5),
                                    bottomLeft: Radius.circular(5),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        '${prediction.comparison!.def!.home ?? ''}',
                        maxLines: 15,
                        style: const TextStyle(),
                      ),
                      const SizedBox(width: 2), // Adjust the width as needed
                      const Text(
                        '-',
                        style: TextStyle(),
                      ),
                      const SizedBox(width: 2), // Adjust the width as needed
                      Text(
                        '${prediction.comparison!.def!.away ?? ''}',
                        maxLines: 15,
                        style: const TextStyle(),
                      ),
                      // Orange Container
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            FractionallySizedBox(
                              widthFactor:
                                  prediction.comparison!.def!.away != null
                                      ? double.parse(prediction
                                              .comparison!.def!.away
                                              .replaceAll('%', '')) /
                                          100
                                      //*
                                      // MediaQuery.of(context).size.width
                                      : 0,
                              child: Container(
                                height: 10,
                                // Remove percentage sign and parse as double

                                decoration: const BoxDecoration(
                                  color: Colors.orange,
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(5),
                                    bottomRight: Radius.circular(5),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 10),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [Text('Formattion prediction')],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Green Container
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            FractionallySizedBox(
                              widthFactor:
                                  prediction.comparison!.form!.home != null
                                      ? double.parse(prediction
                                              .comparison!.form!.home
                                              .replaceAll('%', '')) /
                                          100
                                      //*
                                      // MediaQuery.of(context).size.width
                                      : 0,
                              child: Container(
                                height: 10,
                                // Remove percentage sign and parse as double

                                decoration: const BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(5),
                                    bottomLeft: Radius.circular(5),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        '${prediction.comparison!.form!.home ?? 'N/A'}',
                        maxLines: 15,
                        style: const TextStyle(),
                      ),
                      const SizedBox(width: 2), // Adjust the width as needed
                      const Text(
                        '-',
                        style: TextStyle(),
                      ),
                      const SizedBox(width: 2),
                      Text(
                        '${prediction.comparison!.form!.away ?? 'N/A'}',
                        maxLines: 15,
                        style: const TextStyle(),
                      ),

                      const SizedBox(width: 2), // Adjust the width as needed

                      // Orange Container
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            FractionallySizedBox(
                              widthFactor:
                                  prediction.comparison!.form!.away != null
                                      ? double.parse(prediction
                                              .comparison!.form!.away
                                              .replaceAll('%', '')) /
                                          100
                                      //*
                                      // MediaQuery.of(context).size.width
                                      : 0,
                              child: Container(
                                height: 10,
                                // Remove percentage sign and parse as double

                                decoration: const BoxDecoration(
                                  color: Colors.orange,
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(5),
                                    bottomRight: Radius.circular(5),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 10),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [Text('Goals prediction')],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Green Container
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            FractionallySizedBox(
                              widthFactor:
                                  prediction.comparison!.goals!.home != null
                                      ? double.parse(prediction
                                              .comparison!.goals!.home
                                              .replaceAll('%', '')) /
                                          100
                                      //*
                                      // MediaQuery.of(context).size.width
                                      : 0,
                              child: Container(
                                height: 10,
                                // Remove percentage sign and parse as double

                                decoration: const BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(5),
                                    bottomLeft: Radius.circular(5),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        '${prediction.comparison!.goals!.home ?? 'N/A'}',
                        maxLines: 15,
                        style: const TextStyle(),
                      ),

                      const SizedBox(width: 2), // Adjust the width as needed
                      const Text(
                        '-',
                        style: TextStyle(),
                      ),
                      const SizedBox(width: 2), // Adjust the width as needed

                      Text(
                        '${prediction.comparison!.goals!.away ?? 'N/A'}',
                        maxLines: 15,
                        style: const TextStyle(),
                      ),
                      // Orange Container
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            FractionallySizedBox(
                              widthFactor:
                                  prediction.comparison!.goals!.away != null
                                      ? double.parse(prediction
                                              .comparison!.goals!.away
                                              .replaceAll('%', '')) /
                                          100
                                      //*
                                      // MediaQuery.of(context).size.width
                                      : 0,
                              child: Container(
                                height: 10,
                                // Remove percentage sign and parse as double

                                decoration: const BoxDecoration(
                                  color: Colors.orange,
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(5),
                                    bottomRight: Radius.circular(5),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 10),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [Text('Poisson Distribution prediction')],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Green Container
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            FractionallySizedBox(
                              widthFactor: prediction.comparison!
                                          .poissonDistribution!.home !=
                                      null
                                  ? double.parse(prediction
                                          .comparison!.poissonDistribution!.home
                                          .replaceAll('%', '')) /
                                      100
                                  //*
                                  // MediaQuery.of(context).size.width
                                  : 0,
                              child: Container(
                                height: 10,
                                // Remove percentage sign and parse as double

                                decoration: const BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(5),
                                    bottomLeft: Radius.circular(5),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        '${prediction.comparison!.poissonDistribution!.home ?? 'N/A'}',
                        maxLines: 15,
                        style: const TextStyle(),
                      ),

                      const SizedBox(width: 2), // Adjust the width as needed
                      const Text(
                        '-',
                        style: TextStyle(),
                      ),
                      const SizedBox(width: 2), // Adjust the width as needed
                      Text(
                        '${prediction.comparison!.poissonDistribution!.away ?? 'N/A'}',
                        maxLines: 15,
                        style: const TextStyle(),
                      ),
                      // Orange Container
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            FractionallySizedBox(
                              widthFactor: prediction.comparison!
                                          .poissonDistribution!.away !=
                                      null
                                  ? double.parse(prediction
                                          .comparison!.poissonDistribution!.away
                                          .replaceAll('%', '')) /
                                      100
                                  : 0,
                              child: Container(
                                height: 10,
                                // Remove percentage sign and parse as double

                                decoration: const BoxDecoration(
                                  color: Colors.orange,
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(5),
                                    bottomRight: Radius.circular(5),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(16.0),
                      //color: Colors.blue, // Adjust the color as needed
                      child: const Text(
                        'Match Prediction',
                        style: TextStyle(
                          fontSize: 24.0, // Font size
                          fontWeight: FontWeight.bold, // Font weight
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Circle for Home percentage
                      Column(
                        children: [
                          _buildPercentageCircle(
                            percentage: prediction.predictions!.percent!.home,
                            color: Colors.green,
                          ),
                          Text(
                            'Home: ${prediction.predictions!.percent!.home ?? 'N/A'}',
                            maxLines: 15,
                            style: const TextStyle(),
                          ),
                        ],
                      ),

                      const SizedBox(width: 10),

                      // Circle for Draw percentage
                      Column(
                        children: [
                          _buildPercentageCircle(
                            percentage: prediction.predictions!.percent!.draw,
                            color: Colors.blue, // Change color as needed
                          ),
                          Text(
                            'Draw: ${prediction.predictions!.percent!.draw ?? 'N/A'}',
                            maxLines: 15,
                            style: const TextStyle(),
                          ),
                        ],
                      ),

                      const SizedBox(width: 10),

                      // Circle for Away percentage
                      Column(
                        children: [
                          _buildPercentageCircle(
                            percentage: prediction.predictions!.percent!.away,
                            color: Colors.orange,
                          ),
                          Text(
                            'Away: ${prediction.predictions!.percent!.away ?? 'N/A'}',
                            maxLines: 15,
                            style: const TextStyle(),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 20),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      if (prediction.predictions!.underOver != null)
                        Text(
                          'over/under: ${prediction.predictions!.underOver}',
                          maxLines: 15,
                          style: const TextStyle(fontWeight: FontWeight.w500),
                        ),
                      const SizedBox(width: 10),
                      const SizedBox(width: 10),
                      if (prediction.predictions!.goals!.home != null)
                        Text(
                          'Home goals: ${prediction.predictions!.goals!.home}',
                          maxLines: 15,
                          style: const TextStyle(),
                        ),
                      const SizedBox(width: 10),
                      if (prediction.predictions!.goals!.away != null)
                        Text(
                          'away goals: ${prediction.predictions!.goals!.away}',
                          maxLines: 15,
                          style: const TextStyle(),
                        ),
                      const SizedBox(width: 10),
                    ],
                  ),
                ),
                const SizedBox(width: 10),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      if (prediction.predictions!.winOrDraw != null)
                        Text(
                          'Double chance: ${prediction.predictions!.winOrDraw}',
                          maxLines: 15,
                          style: const TextStyle(fontWeight: FontWeight.w500),
                        ),
                    ],
                  ),
                ),
                const SizedBox(width: 10),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 5, 8, 20),
                  child: Column(
                    children: [
                      if (prediction.predictions!.winner!.name != null)
                        Text(
                          'Winner prediction: ${prediction.predictions!.winner!.name}',
                          maxLines: 15,
                          style: const TextStyle(),
                        ),
                      if (prediction.predictions!.winner!.comment != null)
                        Text(
                          'Comment: ${prediction.predictions!.winner!.comment}',
                          maxLines: 15,
                          style: const TextStyle(),
                        ),
                      const SizedBox(width: 10),
                      if (prediction.predictions!.advice != null)
                        Text(
                          'Advice: ${prediction.predictions!.advice}',
                          maxLines: 15,
                          style: const TextStyle(),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      );
    } else {
      return const Center(
        child: Text('No Prediction data available for this match.'),
      );
    }
  }

  Widget _buildPercentageCircle(
      {String? percentage, Color color = Colors.green}) {
    double parsedPercentage = double.tryParse(percentage ?? '0') ?? 0;
    parsedPercentage = parsedPercentage.clamp(
        0, 100); // Ensure the percentage is between 0 and 100

    return Container(
      width: 50, // Adjust the size of the circle
      height: 50, // Adjust the size of the circle
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: color, width: 2), // Border around the circle
      ),
      child: Stack(
        children: [
          Positioned.fill(
            child: CircularProgressIndicator(
              value: parsedPercentage /
                  100, // Set the percentage as the value of the CircularProgressIndicator
              backgroundColor:
                  Colors.transparent, // Make the background transparent
              valueColor: const AlwaysStoppedAnimation<Color>(
                  Colors.transparent), // Make the value color transparent
            ),
          ),
          Center(
            child: Text(
              '${percentage ?? 'N/A'}',
              style: TextStyle(
                color: color,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatistics() {
    if (isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else if (statisticsModel != null) {
      final List<ResponseST> matchStatistics = statisticsModel!.response!;
      return ListView.builder(
        itemCount: matchStatistics.length,
        itemBuilder: (context, index) {
          final statistics = matchStatistics[index];
          // print(' here are the stats : $statistics');
          return Card(
            margin: const EdgeInsets.fromLTRB(0, 3, 0, 2),
            child: Column(
              children: [
                Text(
                  'Team Name: ${statistics.team?.name ?? "N/A"}',
                  style: const TextStyle(),
                ),
                Text(
                  'Team ID: ${statistics.team?.id ?? "N/A"}',
                  style: const TextStyle(),
                ),
                if (statistics.statistics != null)
                  for (var stat in statistics.statistics!)
                    Row(
                      children: [
                        Text(
                          'Statistic Type: ${stat.type ?? "N/A"}',
                          style: const TextStyle(),
                        ),
                        Text(
                          'Statistic Value: ${stat.value ?? "N/A"}',
                          style: const TextStyle(),
                        ),
                      ],
                    ),
              ],
            ),
          );
        },
      );
    } else {
      return const Center(
        child: Text('No Statistics data available for this match.'),
      );
    }
  }

  Widget _buildHeadToHead() {
    String matchStatus = '';
    // ignore: unused_local_variable
    String matchTime = '';
    // ignore: unused_local_variable
    String matchDate = '';
    // ignore: unused_local_variable
    String matchElapsed = '';
    // Determine the match status and time
    if (widget.response.fixture!.status!.short == '1H' ||
        widget.response.fixture!.status!.short == '2H') {
      matchStatus = 'Live';
      matchElapsed = '${widget.response.fixture!.status!.elapsed}';
      matchTime = '${widget.response.fixture!.status!.short}';
    } else if (widget.response.fixture!.status!.short == 'FT') {
      matchStatus = 'FT';
      matchElapsed = ''; // Clear elapsed time when match has ended
    } else if (widget.response.fixture!.status!.short == 'ET') {
      matchStatus = '90+';
      matchElapsed = ''; // Clear elapsed time when match has ended
    } else if (widget.response.fixture!.status!.short == 'NS') {
      matchStatus = 'Scheduled'; // Match not started yet
    }
    if (headToHeadModel != null) {
      final List<ResponseH2H> headToHeads = headToHeadModel!.response!;
      return ListView.builder(
          itemCount: headToHeads.length,
          itemBuilder: (context, index) {
            final h2h = headToHeads[index];
            final DateTime matchTime = DateTime.parse(h2h.fixture!.date!);
            final DateTime matchDate = DateTime.parse(h2h.fixture!.date!);
            return Card(
              margin: const EdgeInsets.fromLTRB(0, 3, 0, 2), //all(1),
              child: GestureDetector(
                onTap: () {
                  // Call the _navigateToMatchDetail method when fixture is clicked
                  _navigateToMatchDetail(context, h2h);
                },
                child: ListTile(
                  title: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${matchDate.day.toString().padRight(1, '0')}/${matchDate.month.toString().padLeft(2, '0')}/${matchDate.year.toString().padLeft(2, '0')}',
                            textAlign: TextAlign.start,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(fontSize: 10),
                          ),
                          // const SizedBox(
                          //   width: 15,
                          // ),
                          Text(
                            '${matchTime.hour.toString().padLeft(1, '0')}:${matchTime.minute.toString().padLeft(2, '0')}',
                            textAlign: TextAlign.start,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(fontSize: 10),
                          ),
                          if (h2h.score!.halftime!.home != null &&
                              h2h.score!.halftime!.away != null)
                            Text(
                              'HT ${h2h.score!.halftime!.home}-${h2h.score!.halftime!.away}',
                              textAlign: TextAlign.start,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(fontSize: 10),
                            ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // First Column (Scheduled Time / Elapsed Minutes / FT)
                          Expanded(
                            flex: 1,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                if (matchStatus == '1H' || matchStatus == '2H')
                                  Text(
                                    '${h2h.fixture!.status!.elapsed ?? '\''}',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w300),
                                  ),
                                if (matchStatus != '1H' && matchStatus != '2H')
                                  Text(
                                    '${h2h.fixture!.status!.short}',
                                    // style: TextStyle(fontWeight: FontWeight.bold),
                                  ),
                              ],
                            ),
                          ),
                          // Second Column (Home Team on Top of Away Team)
                          Expanded(
                            flex: 4,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  h2h.teams!.home!.name!,
                                  textAlign: TextAlign.start,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  // style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  h2h.teams!.away!.name!,
                                  textAlign: TextAlign.start,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  // style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          // Third Column (Scores)
                          Expanded(
                            flex: 1,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                if (widget.response.score!.extratime!.home !=
                                    null)
                                  Text(
                                    '${widget.response.score!.extratime!.home}',
                                    // style: TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                if (widget.response.score!.extratime!.away !=
                                    null)
                                  Text(
                                    '${widget.response.score!.extratime!.away}',
                                    // style: TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                if (widget.response.score!.penalty!.home !=
                                    null)
                                  Text(
                                    '${widget.response.score!.penalty!.home}',
                                    // style: TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                if (widget.response.score!.penalty!.away !=
                                    null)
                                  Text(
                                    '${widget.response.score!.penalty!.away}',
                                    // style: TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                if (matchStatus == 'FT')
                                  Text(
                                    '${widget.response.score?.fulltime?.home}',
                                    // style: TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                if (matchStatus == 'FT')
                                  Text(
                                    '${widget.response.score?.fulltime?.away}',
                                    // style: TextStyle(fontWeight: FontWeight.bold),
                                  ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          });
    } else {
      return const Center(
        child: Text('No Head to Head data available for this match.'),
      );
    }
  }

  Widget _buildEventsList() {
    if (eventsModel != null && eventsModel!.response != null) {
      final List<ResponseEV> teamEventsHome = eventsModel!.response!
          .where(
              (event) => event.team!.name == widget.response.teams!.home!.name)
          .toList();
      final List<ResponseEV> teamEventsAway = eventsModel!.response!
          .where(
              (event) => event.team!.name == widget.response.teams!.away!.name)
          .toList();

      // Sort events by time
      teamEventsHome.sort(
          (a, b) => (a.time?.elapsed ?? 0).compareTo(b.time?.elapsed ?? 0));
      teamEventsAway.sort(
          (a, b) => (a.time?.elapsed ?? 0).compareTo(b.time?.elapsed ?? 0));

      return SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (widget.response.fixture!.status!.short == 'NS')
              const Center(
                child: Text('Match not yet started'),
              ),
            if (widget.response.fixture!.status!.short != 'NS' &&
                teamEventsHome.isEmpty &&
                teamEventsAway.isEmpty)
              const Center(
                child: Text('No events available for this match.'),
              ),
            if (widget.response.fixture!.status!.short != 'NS')
              _buildTeamEvents(
                teamEventsHome,
                widget.response.teams!.home!.name,
                widget.response.teams!.home!.logo,
                startSide: true, // Home team events start on the start side
              ),
            if (widget.response.fixture!.status!.short != 'NS')
              _buildTeamEvents(
                teamEventsAway,
                widget.response.teams!.away!.name,
                widget.response.teams!.away!.logo,
                startSide: false, // Away team events start on the end side
              ),
          ],
        ),
      );
    } else {
      return const Center(
        child: Text('No events available for this match.'),
      );
    }
  }

  Widget _buildTeamEvents(
      List<ResponseEV> events, String? teamName, String? teamLogo,
      {bool startSide = true}) {
    final teamEvents =
        events.where((event) => event.team!.name == teamName).toList();
    if (teamEvents.isEmpty) {
      return const SizedBox.shrink();
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              if (teamLogo != null)
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Image.network(
                    teamLogo,
                    width: 32,
                    height: 32,
                  ),
                ),
              Text(
                teamName!,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: teamEvents.length,
          itemBuilder: (context, index) {
            final event = teamEvents[index];
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          if (event.time?.elapsed != null)
                            Text('${event.time?.elapsed ?? ''}\''),
                          const SizedBox(
                            width: 5,
                            height: 5,
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          if (event.detail == 'Yellow Card')
                            Container(
                              color: Colors.yellowAccent,
                              height: 20,
                              width: 10,
                            ),
                          if (event.detail == 'Second Yellow')
                            Container(
                              color: Colors.red[200],
                              height: 20,
                              width: 10,
                            ),
                          if (event.detail == 'Red Card')
                            Container(
                              color: Colors.red[900],
                              height: 20,
                              width: 10,
                            ),
                          if (event.type == 'subst')
                            const Icon(Icons.autorenew),
                          if (event.type == 'Goal')
                            const Icon(Icons.sports_soccer_outlined),
                          const SizedBox(
                            width: 5,
                            height: 5,
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('${event.type} - ${event.detail}'),
                          if (event.player?.name != null)
                            Text(event.player?.name ?? ''),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
          separatorBuilder: (context, index) => const Divider(
            color: Colors.transparent,
          ),
        ),
      ],
    );
  }

  void _navigateToMatchDetail(BuildContext context, ResponseH2H fixture) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MatchDetailPage(response: fixture),
      ),
    );
  }
}

class MySliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar tabBar;

  MySliverAppBarDelegate(this.tabBar);

  @override
  double get minExtent => tabBar.preferredSize.height;
  @override
  double get maxExtent => tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.white,
      child: tabBar,
    );
  }

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
