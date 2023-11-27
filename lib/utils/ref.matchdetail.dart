// import 'package:flutter/material.dart';
// import 'package:flutter6_sports_app/models/fixturesModel.dart';
// import 'package:flutter6_sports_app/models/eventsModel.dart';
// import 'package:flutter6_sports_app/models/headtoheadModel.dart';
// import 'package:flutter6_sports_app/models/predictionModel.dart';
// import 'package:flutter6_sports_app/services/api_service.dart';
// import 'package:flutter6_sports_app/models/statisticsModel.dart'; // Prefix statisticsModel as StatsModel

// class MatchDetailPage extends StatefulWidget {
//   final Responses response;

//   MatchDetailPage({required this.response});

//   @override
//   _MatchDetailPageState createState() => _MatchDetailPageState();
// }

// class _MatchDetailPageState extends State<MatchDetailPage> {
//   EventsModel? eventsModel;
//   PredictionModel? predictionModel;
//   StatisticsModel? statisticsModel;
//   HeadToHeadModel? headToHeadModel;
//   bool isLoading = true;

//   @override
//   void initState() {
//     super.initState();
//     fetchMatchData();
//   }

//   void fetchMatchData() async {
//     try {
//       EventsModel eventData =
//           await ApiService.fetchEvents(widget.response.fixture!.id!);
//       PredictionModel predictionData =
//           await ApiService.fetchPredictions(widget.response.fixture!.id!);
//       StatisticsModel statisticsModelData =
//           await ApiService.fetchStatistics(widget.response.fixture!.id!);
//       HeadToHeadModel headToHeadModelData = await ApiService.fetchHeadToHead(
//           widget.response.teams!.home!.id!, widget.response.teams!.away!.id!);
//       setState(() {
//         eventsModel = eventData;
//         predictionModel = predictionData;
//         statisticsModel = statisticsModelData;
//         headToHeadModel = headToHeadModelData;
//         isLoading = false;
//       });
//     } catch (e) {
//       print('Error fetching events and predictions: $e');
//       setState(() {
//         isLoading = false;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 4,
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text(
//             '${widget.response.teams!.home!.name} vs ${widget.response.teams!.away!.name}',
//             style: TextStyle(),
//           ),
//           bottom: TabBar(
//             isScrollable: true,
//             tabs: [
//               Tab(text: 'Events'),
//               Tab(text: 'Statistics'),
//               Tab(text: 'Prediction'),
//               Tab(text: 'Head to Head'),
//             ],
//           ),
//         ),
//         body: NestedScrollView(
//           headerSliverBuilder: (context, isScrolled) {
//             return [];
//           },
//           body: isLoading
//               ? _buildLoadingWidget()
//               : TabBarView(
//                   children: [
//                     _buildEventsList(),
//                     _buildStatistics(),
//                     _buildPredictions(),
//                     _buildHeadToHead(),
//                   ],
//                 ),
//         ),
//       ),
//     );
//   }

//   // Future<void> fetchMatchData() async {
//   //   try {
//   //     EventsModel eventData =
//   //         await ApiService.fetchEvents(widget.response.fixture!.id!);
//   //     PredictionModel predictionData =
//   //         await ApiService.fetchPredictions(widget.response.fixture!.id!);
//   //     StatisticsModel statisticsModelData =
//   //         await ApiService.fetchStatistics(widget.response.fixture!.id!);
//   //     HeadToHeadModel headToHeadModelData = await ApiService.fetchHeadToHead(
//   //         widget.response.teams!.home!.id!, widget.response.teams!.away!.id!);
//   //     setState(() {
//   //       eventsModel = eventData;
//   //       predictionModel = predictionData;
//   //       statisticsModel = statisticsModelData;
//   //       headToHeadModel = headToHeadModelData;
//   //       isLoading = false;
//   //     });
//   //   } catch (e) {
//   //     print('Error fetching events and predictions: $e');
//   //     setState(() {
//   //       isLoading = false;
//   //     });
//   //   }
//   // }

//   Widget _buildPredictions() {
//     if (predictionModel != null) {
//       final List<Response> predictions = predictionModel!.response;
//       return ListView.builder(
//         itemCount: predictions.length,
//         itemBuilder: (context, index) {
//           final prediction = predictions[index];
//           return Card(
//             child: Column(
//               children: [
//                 _buildBar("Strength",
//                     prediction.comparison?.poissonDistribution?.home ?? 0),
//                 _buildBar("Attacking Potential",
//                     prediction.comparison?.att?.home ?? 0),
//                 _buildBar("Defensive Potential",
//                     prediction.comparison?.def?.home ?? 0),
//                 _buildBar(
//                     "Strength H2H", prediction.comparison?.h2H?.home ?? 0),
//                 _buildBar("Wins in the Game",
//                     prediction.comparison?.total?.home ?? 0),
//               ],
//             ),
//           );
//         },
//       );
//     } else {
//       return Center(
//         child: CircularProgressIndicator(),
//       );
//     }
//   }

//   Widget _buildBar(String label, double percentage) {
//     final double leftPercentage = (percentage < 0) ? 0 : percentage;
//     final double rightPercentage = (percentage < 0) ? -percentage : 0;
//     return Padding(
//       padding: const EdgeInsets.all(1.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(label),
//           const SizedBox(height: 8), // Add spacing between bars
//           Container(
//             // width: 200, // Adjust the width as needed
//             height: 20, // Adjust the height as needed
//             color: Colors.blue, // Blue for left
//             child: Align(
//               alignment: Alignment.centerLeft,
//               child: Text(
//                 "${leftPercentage.toStringAsFixed(2)}%",
//                 style: const TextStyle(color: Colors.white),
//               ),
//             ),
//           ),
//           const SizedBox(height: 8), // Add spacing between bars
//           Container(
//             // width: 200, // Adjust the width as needed
//             height: 20, // Adjust the height as needed
//             color: Colors.green, // Green for right
//             child: Align(
//               alignment: Alignment.centerLeft,
//               child: Text(
//                 "${rightPercentage.toStringAsFixed(2)}%",
//                 style: const TextStyle(color: Colors.white),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildHeadToHead() {
//     String matchStatus = '';
//     // ignore: unused_local_variable
//     String matchTime = '';
//     // ignore: unused_local_variable
//     String matchDate = '';
//     // ignore: unused_local_variable
//     String matchElapsed = '';
//     // Determine the match status and time
//     if (widget.response.fixture!.status!.short == '1H' ||
//         widget.response.fixture!.status!.short == '2H') {
//       matchStatus = 'Live';
//       matchElapsed = '${widget.response.fixture!.status!.elapsed}';
//       matchTime = '${widget.response.fixture!.status!.short}';
//     } else if (widget.response.fixture!.status!.short == 'FT') {
//       matchStatus = 'FT';
//       matchElapsed = ''; // Clear elapsed time when match has ended
//     } else if (widget.response.fixture!.status!.short == 'ET') {
//       matchStatus = '90+';
//       matchElapsed = ''; // Clear elapsed time when match has ended
//     } else if (widget.response.fixture!.status!.short == 'NS') {
//       matchStatus = 'Scheduled'; // Match not started yet
//     }
//     if (headToHeadModel != null) {
//       final List<ResponseH2H> headToHeads = headToHeadModel!.response!;
//       return ListView.builder(
//           itemCount: headToHeads.length,
//           itemBuilder: (context, index) {
//             final h2h = headToHeads[index];
//             final DateTime matchTime = DateTime.parse(h2h.fixture!.date!);
//             final DateTime matchDate = DateTime.parse(h2h.fixture!.date!);
//             return Card(
//               margin: const EdgeInsets.fromLTRB(0, 3, 0, 2), //all(1),
//               child: ListTile(
//                 title: Column(
//                   children: [
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceAround,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           // ignore: unnecessary_string_interpolations
//                           '${matchDate.day.toString().padRight(1, '0')}/${matchDate.month.toString().padLeft(2, '0')}/${matchDate.year.toString().padLeft(2, '0')}',
//                           textAlign: TextAlign.start,
//                           maxLines: 1,
//                           overflow: TextOverflow.ellipsis,
//                           style: const TextStyle(fontSize: 10),
//                         ),
//                         // const SizedBox(
//                         //   width: 15,
//                         // ),
//                         Text(
//                           '${matchTime.hour.toString().padLeft(1, '0')}:${matchTime.minute.toString().padLeft(2, '0')}',
//                           textAlign: TextAlign.start,
//                           maxLines: 1,
//                           overflow: TextOverflow.ellipsis,
//                           style: const TextStyle(fontSize: 10),
//                         ),
//                         if (h2h.score!.halftime!.home != null &&
//                             h2h.score!.halftime!.away != null)
//                           Text(
//                             'HT ${h2h.score!.halftime!.home}-${h2h.score!.halftime!.away}',
//                             textAlign: TextAlign.start,
//                             maxLines: 1,
//                             overflow: TextOverflow.ellipsis,
//                             style: const TextStyle(fontSize: 10),
//                           ),
//                       ],
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         // First Column (Scheduled Time / Elapsed Minutes / FT)
//                         Expanded(
//                           flex: 1,
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.start,
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 '${h2h.fixture!.status!.short}',
//                                 // style: TextStyle(fontWeight: FontWeight.bold),
//                               ),
//                             ],
//                           ),
//                         ),
//                         // Second Column (Home Team on Top of Away Team)
//                         Expanded(
//                           flex: 2,
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.start,
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 h2h.teams!.home!.name!,
//                                 textAlign: TextAlign.start,
//                                 maxLines: 1,
//                                 overflow: TextOverflow.ellipsis,
//                                 // style: TextStyle(fontWeight: FontWeight.bold),
//                               ),
//                               Text(
//                                 h2h.teams!.away!.name!,
//                                 textAlign: TextAlign.start,
//                                 maxLines: 1,
//                                 overflow: TextOverflow.ellipsis,
//                                 // style: TextStyle(fontWeight: FontWeight.bold),
//                               ),
//                             ],
//                           ),
//                         ),
//                         // Third Column (Scores)
//                         Expanded(
//                           flex: 1,
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             crossAxisAlignment: CrossAxisAlignment.end,
//                             children: [
//                               if (matchStatus == 'Live')
//                                 // Text(
//                                 //   'Score:',
//                                 //   style: TextStyle(fontWeight: FontWeight.bold),
//                                 // ),
//                                 if (matchStatus == 'Live')
//                                   Text(
//                                     '${widget.response.score?.halftime?.home ?? ''}',
//                                     // style: TextStyle(fontWeight: FontWeight.bold),
//                                   ),
//                               if (matchStatus == 'Live')
//                                 Text(
//                                   '${widget.response.score?.halftime?.away ?? ''}',
//                                   // style: TextStyle(fontWeight: FontWeight.bold),
//                                 ),
//                               if (matchStatus == 'FT')
//                                 Text(
//                                   '${widget.response.score?.fulltime?.home ?? ''}',
//                                   // style: TextStyle(fontWeight: FontWeight.bold),
//                                 ),
//                               if (matchStatus == 'FT')
//                                 Text(
//                                   '${widget.response.score?.fulltime?.away ?? ''}',
//                                   // style: TextStyle(fontWeight: FontWeight.bold),
//                                 ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             );
//           });
//     } else {
//       return const Center(
//         child: Text('No Head to Head data available for this match.'),
//       );
//     }
//   }

//   Widget _buildLoadingWidget() {
//     return Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           CircularProgressIndicator(),
//           SizedBox(height: 16),
//           ElevatedButton(
//             onPressed: () {
//               setState(() {
//                 isLoading = true;
//               });
//               // fetchEvents(); // Retry fetching data
//             },
//             child: Text('Retry'),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildEventsList() {
//     if (eventsModel != null && eventsModel!.response != null) {
//       final List<ResponseEV> teamEventsHome = eventsModel!.response!
//           .where(
//               (event) => event.team!.name == widget.response.teams!.home!.name)
//           .toList();
//       final List<ResponseEV> teamEventsAway = eventsModel!.response!
//           .where(
//               (event) => event.team!.name == widget.response.teams!.away!.name)
//           .toList();

//       if (teamEventsHome.isEmpty && teamEventsAway.isEmpty) {
//         return const Center(
//           child: Text('No events available for this match.'),
//         );
//       }
//       teamEventsHome.sort((a, b) => (a.time != null && b.time != null)
//           ? a.time!.elapsed!.compareTo(b.time!.elapsed!)
//           : 0);
//       teamEventsAway.sort((a, b) => (a.time != null && b.time != null)
//           ? a.time!.elapsed!.compareTo(b.time!.elapsed!)
//           : 0);
//       return Column(
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: [
//           if (widget.response.fixture!.status!.short == 'NS')
//             const Center(
//               child: Text('Match not yet started'),
//             ),
//           if (widget.response.fixture!.status!.short != 'NS' &&
//               teamEventsHome.isEmpty &&
//               teamEventsAway.isEmpty)
//             const Center(
//               child: Text('No events available for this match.'),
//             ),
//           if (widget.response.fixture!.status!.short != 'NS')
//             _buildTeamEvents(
//               teamEventsHome,
//               widget.response.teams!.home!.name,
//               widget.response.teams!.home!.logo,
//             ),
//           if (widget.response.fixture!.status!.short != 'NS')
//             _buildTeamEvents(
//               teamEventsAway,
//               widget.response.teams!.away!.name,
//               widget.response.teams!.away!.logo,
//             ),
//         ],
//       );
//     } else {
//       return const Center(
//         child: Text('No events available for this match.'),
//       );
//     }
//   }

//   // Widget _buildTeamEvents(
//   //     List<Response> events, String? teamName, String? teamLogo) {
//   //   final teamEvents =
//   //       events.where((event) => event.team!.name == teamName).toList();
//   //   if (teamEvents.isEmpty) {
//   //     return const SizedBox.shrink();
//   //   }
//   //   return Column(
//   //     crossAxisAlignment: CrossAxisAlignment.start,
//   //     children: [
//   //       Padding(
//   //         padding: const EdgeInsets.all(8.0),
//   //         child: Row(
//   //           children: [
//   //             if (teamLogo != null)
//   //               Padding(
//   //                 padding: const EdgeInsets.only(right: 8.0),
//   //                 child: Image.network(
//   //                   teamLogo,
//   //                   width: 32,
//   //                   height: 32,
//   //                 ),
//   //               ),
//   //             Text(
//   //               teamName!,
//   //               style: const TextStyle(
//   //                 fontSize: 16,
//   //                 fontWeight: FontWeight.bold,
//   //               ),
//   //             ),
//   //           ],
//   //         ),
//   //       ),
//   //       ListView.builder(
//   //         shrinkWrap: true,
//   //         physics: const NeverScrollableScrollPhysics(),
//   //         itemCount: teamEvents.length,
//   //         itemBuilder: (context, index) {
//   //           final event = teamEvents[index];
//   //           return ListTile(
//   //             title: Text(
//   //               '${event.type} - ${event.detail}',
//   //               style: TextStyle(
//   //                 color: _getEventColor(event.type!),
//   //               ),
//   //             ),
//   //             subtitle: Text('Player: ${event.player?.name ?? ''}'),
//   //             trailing: Text('${event.time?.elapsed ?? ''}\''),
//   //           );
//   //         },
//   //       ),
//   //     ],
//   //   );
//   // }
//   Widget _buildTeamEvents(
//       List<ResponseEV> events, String? teamName, String? teamLogo) {
//     final teamEvents =
//         events.where((event) => event.team!.name == teamName).toList();
//     if (teamEvents.isEmpty) {
//       return const SizedBox.shrink();
//     }
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Row(
//             children: [
//               if (teamLogo != null)
//                 Padding(
//                   padding: const EdgeInsets.only(right: 8.0),
//                   child: Image.network(
//                     teamLogo,
//                     width: 32,
//                     height: 32,
//                   ),
//                 ),
//               Text(
//                 teamName!,
//                 style: const TextStyle(
//                   fontSize: 16,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ],
//           ),
//         ),
//         ListView.builder(
//           shrinkWrap: true,
//           physics: const NeverScrollableScrollPhysics(),
//           itemCount: teamEvents.length,
//           itemBuilder: (context, index) {
//             final event = teamEvents[index];
//             return ListTile(
//               title: Text(
//                 '${event.type} - ${event.detail}',
//                 style: TextStyle(
//                   color: _getEventColor(event.type!),
//                 ),
//               ),
//               subtitle: Text('Player: ${event.player?.name ?? ''}'),
//               trailing: Text('${event.time?.elapsed ?? ''}\''),
//             );
//           },
//         ),
//       ],
//     );
//   }

//   Color _getEventColor(String eventType) {
//     switch (eventType.toLowerCase()) {
//       case 'red card':
//         return Colors.red;
//       case 'second yellow':
//         return Colors.red;
//       case 'yellow card':
//         return Colors.yellow;
//       default:
//         return Colors.black;
//     }
//   }

//   Widget _buildStatistics() {
//     if (statisticsModel != null) {
//       final List<ResponseST> matchStats = statisticsModel!.response!;
//       return ListView.builder(
//         itemCount: matchStats.length,
//         itemBuilder: (context, index) {
//           final stat = matchStats[index];
//           return ListTile(
//             title: Text('Stat Type: ${stat.team!.name}'), //stat.statistics
//             subtitle: Text('Value: ${stat.team!.name!}'),

//             // Add more widgets to display other statistics data
//           );
//         },
//       );
//     } else {
//       return const Center(
//         child: Text('No statistics available for this match.'),
//       );
//     }
//   }
// }


// ########################################################################################
// import 'package:flutter/material.dart';
// import 'package:flutter6_sports_app/models/fixturesModel.dart';
// import 'package:flutter6_sports_app/models/eventsModel.dart';
// import 'package:flutter6_sports_app/models/headtoheadModel.dart';
// import 'package:flutter6_sports_app/models/predictionModel.dart';
// import 'package:flutter6_sports_app/services/api_service.dart';
// import 'package:flutter6_sports_app/models/statisticsModel.dart'; // Prefix statisticsModel as StatsModel

// class MatchDetailPage extends StatefulWidget {
//   final Responses response;

//   MatchDetailPage({required this.response});

//   @override
//   _MatchDetailPageState createState() => _MatchDetailPageState();
// }

// class _MatchDetailPageState extends State<MatchDetailPage> {
//   EventsModel? eventsModel;
//   PredictionModel? predictionModel;
//   StatisticsModel? statisticsModel;
//   HeadToHeadModel? headToHeadModel;
//   bool isLoading = true;

//   @override
//   void initState() {
//     super.initState();
//     fetchMatchData();
//   }

//   void fetchMatchData() async {
//     try {
//       EventsModel eventData =
//           await ApiService.fetchEvents(widget.response.fixture!.id!);
//       PredictionModel predictionData =
//           await ApiService.fetchPredictions(widget.response.fixture!.id!);
//       StatisticsModel statisticsModelData =
//           await ApiService.fetchStatistics(widget.response.fixture!.id!);
//       HeadToHeadModel headToHeadModelData = await ApiService.fetchHeadToHead(
//           widget.response.teams!.home!.id!, widget.response.teams!.away!.id!);
//       setState(() {
//         eventsModel = eventData;
//         predictionModel = predictionData;
//         statisticsModel = statisticsModelData;
//         headToHeadModel = headToHeadModelData;
//         isLoading = false;
//       });
//     } catch (e) {
//       print('Error fetching events and predictions: $e');
//       setState(() {
//         isLoading = false;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 4,
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text(
//             '${widget.response.teams!.home!.name} vs ${widget.response.teams!.away!.name}',
//             style: TextStyle(),
//           ),
//           bottom: TabBar(
//             isScrollable: true,
//             tabs: [
//               Tab(text: 'Events'),
//               Tab(text: 'Statistics'),
//               Tab(text: 'Prediction'),
//               Tab(text: 'Head to Head'),
//             ],
//           ),
//         ),
//         body: NestedScrollView(
//           headerSliverBuilder: (context, isScrolled) {
//             return [];
//           },
//           body: isLoading
//               ? _buildLoadingWidget()
//               : TabBarView(
//                   children: [
//                     _buildEventsList(),
//                     _buildStatistics(),
//                     _buildPredictions(),
//                     _buildHeadToHead(),
//                   ],
//                 ),
//         ),
//       ),
//     );
//   }

//   Future<void> fetchMatchData() async {
//     try {
//       EventsModel eventData =
//           await ApiService.fetchEvents(widget.response.fixture!.id!);
//       PredictionModel predictionData =
//           await ApiService.fetchPredictions(widget.response.fixture!.id!);
//       StatisticsModel statisticsModelData =
//           await ApiService.fetchStatistics(widget.response.fixture!.id!);
//       HeadToHeadModel headToHeadModelData = await ApiService.fetchHeadToHead(
//           widget.response.teams!.home!.id!, widget.response.teams!.away!.id!);
//       setState(() {
//         eventsModel = eventData;
//         predictionModel = predictionData;
//         statisticsModel = statisticsModelData;
//         headToHeadModel = headToHeadModelData;
//         isLoading = false;
//       });
//     } catch (e) {
//       print('Error fetching events and predictions: $e');
//       setState(() {
//         isLoading = false;
//       });
//     }
//   }

//   Widget _buildPredictions() {
//     if (predictionModel != null && predictionModel!.response != null) {
//       final List<ResponsePR> predictions = predictionModel!.response!;
//       return ListView.builder(
//         itemCount: predictions.length,
//         itemBuilder: (context, index) {
//           final prediction = predictions[index];
//           return Card(
//             child: Column(
//               children: [
//                 _buildBar("Strength", prediction.comparison?.poissonDistribution?.average ?? 0),
//                 _buildBar("Attacking Potential", prediction.comparison?.att?.average ?? 0),
//                 _buildBar("Defensive Potential", prediction.comparison?.def?.average ?? 0),
//                 _buildBar("Strength H2H", prediction.comparison?.h2h?.average ?? 0),
//                 _buildBar("Wins in the Game", prediction.comparison?.total?.average ?? 0),
//               ],
//             ),
//           );
//         },
//       );
//     } else {
//       return Center(
//         child: CircularProgressIndicator(),
//       );
//     }
//   }

//   // ... Other widget build methods and helper methods ...

// }
// #############################################################################################
// import 'package:flutter/material.dart';
// import 'package:flutter6_sports_app/models/fixturesModel.dart';
// import 'package:flutter6_sports_app/models/eventsModel.dart';
// import 'package:flutter6_sports_app/models/headtoheadModel.dart';
// import 'package:flutter6_sports_app/models/predictionModel.dart';
// import 'package:flutter6_sports_app/services/api_service.dart';
// import 'package:flutter6_sports_app/models/statisticsModel.dart'; // Prefix statisticsModel as StatsModel

// class MatchDetailPage extends StatefulWidget {
//   final Responses response;

//   MatchDetailPage({required this.response});

//   @override
//   _MatchDetailPageState createState() => _MatchDetailPageState();
// }

// class _MatchDetailPageState extends State<MatchDetailPage> {
//   EventsModel? eventsModel;
//   PredictionModel? predictionModel;
//   StatisticsModel? statisticsModel;
//   HeadToHeadModel? headToHeadModel;
//   bool isLoading = true;

//   @override
//   void initState() {
//     super.initState();
//     fetchEvents();
//   }

//   Future<void> fetchEvents() async {
//     try {
//       final eventData = await ApiService.fetchEvents(widget.response.fixture!.id!);
//       final predictionData = await ApiService.fetchPredictions(widget.response.fixture!.id!);
//       final statisticsModelData = await ApiService.fetchStatistics(widget.response.fixture!.id!);
//       final headToHeadModelData = await ApiService.fetchHeadToHead(
//           widget.response.teams!.home!.id!, widget.response.teams!.away!.id!);

//       setState(() {
//         eventsModel = eventData;
//         predictionModel = predictionData;
//         statisticsModel = statisticsModelData;
//         headToHeadModel = headToHeadModelData;
//         isLoading = false;
//       });
//     } catch (e) {
//       print('Error fetching events and predictions: $e');
//       setState(() {
//         isLoading = false;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 4,
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text(
//             '${widget.response.teams!.home!.name} vs ${widget.response.teams!.away!.name}',
//           ),
//           bottom: const TabBar(
//             isScrollable: true,
//             tabs: [
//               Tab(text: 'Events'),
//               Tab(text: 'Statistics'),
//               Tab(text: 'Prediction'),
//               Tab(text: 'Head to Head'),
//             ],
//           ),
//         ),
//         body: NestedScrollView(
//           headerSliverBuilder: (context, isScrolled) {
//             return [];
//           },
//           body: isLoading
//               ? _buildLoadingWidget()
//               : TabBarView(
//                   children: [
//                     _buildEventsList(),
//                     _buildStatistics(),
//                     _buildPredictions(),
//                     _buildHeadToHead(),
//                   ],
//                 ),
//         ),
//       ),
//     );
//   }

//   Widget _buildPredictions() {
//     if (predictionModel != null) {
//       final List<ResponsePR> predictions = predictionModel!.response ?? [];
//       return ListView.builder(
//         itemCount: predictions.length,
//         itemBuilder: (context, index) {
//           final prediction = predictions[index];
//           return Card(
//             child: Column(
//               children: [
//                 _buildBar("Strength", prediction.comparison?.poissonDistribution?.average ?? 0),
//                 _buildBar("Attacking Potential", prediction.comparison?.att?.average ?? 0),
//                 _buildBar("Defensive Potential", prediction.comparison?.def?.average ?? 0),
//                 _buildBar("Strength H2H", prediction.comparison?.h2h?.average ?? 0),
//                 _buildBar("Wins in the Game", prediction.comparison?.total?.average ?? 0),
//               ],
//             ),
//           );
//         },
//       );
//     } else {
//       return Center(
//         child: Card(
//           child: Column(
//             children: [
//               _buildBar("Strength", 0),
//               _buildBar("Attacking Potential", 0),
//               _buildBar("Defensive Potential", 0),
//               _buildBar("Strength H2H", 0),
//               _buildBar("Wins in the Game", 0),
//             ],
//           ),
//         ),
//       );
//     }
//   }

//   Widget _buildBar(String label, double percentage) {
//     final double leftPercentage = (percentage < 0) ? 0 : percentage;
//     final double rightPercentage = (percentage < 0) ? -percentage : 0;
//     return Padding(
//       padding: const EdgeInsets.all(1.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(label),
//           const SizedBox(height: 8),
//           Container(
//             height: 20,
//             color: Colors.blue,
//             child: Align(
//               alignment: Alignment.centerLeft,
//               child: Text(
//                 "${leftPercentage.toStringAsFixed(2)}%",
//                 style: const TextStyle(color: Colors.white),
//               ),
//             ),
//           ),
//           const SizedBox(height: 8),
//           Container(
//             height: 20,
//             color: Colors.green,
//             child: Align(
//               alignment: Alignment.centerLeft,
//               child: Text(
//                 "${rightPercentage.toStringAsFixed(2)}%",
//                 style: const TextStyle(color: Colors.white),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildHeadToHead() {
//     if (headToHeadModel != null) {
//       final List<ResponseH2H> headToHeads = headToHeadModel!.response ?? [];
//       return ListView.builder(
//         itemCount: headToHeads.length,
//         itemBuilder: (context, index) {
//           final h2h = headToHeads[index];
//           final DateTime matchTime = DateTime.parse(h2h.fixture!.date!);
//           final DateTime matchDate = DateTime.parse(h2h.fixture!.date!);

//           return Card(
//             margin: const EdgeInsets.fromLTRB(0, 3, 0, 2),
//             child: ListTile(
//               title: Column(
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceAround,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         '${matchDate.day.toString().padLeft(2, '0')}/${matchDate.month.toString().padLeft(2, '0')}/${matchDate.year.toString().substring(2)}',
//                         textAlign: TextAlign.start,
//                         maxLines: 1,
//                         overflow: TextOverflow.ellipsis,
//                         style: const TextStyle(fontSize: 10),
//                       ),
//                       Text(
//                         '${matchTime.hour.toString().padLeft(2, '0')}:${matchTime.minute.toString().padLeft(2, '0')}',
//                         textAlign: TextAlign.start,
//                         maxLines: 1,
//                         overflow: TextOverflow.ellipsis,
//                         style: const TextStyle(fontSize: 10),
//                       ),
//                       if (h2h.score!.halftime!.home != null && h2h.score!.halftime!.away != null)
//                         Text(
//                           'HT ${h2h.score!.halftime!.home}-${h2h.score!.halftime!.away}',
//                           textAlign: TextAlign.start,
//                           maxLines: 1,
//                           overflow: TextOverflow.ellipsis,
//                           style: const TextStyle(fontSize: 10),
//                         ),
//                     ],
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       Expanded(
//                         flex: 1,
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(
//                               '${h2h.fixture!.status!.short}',
//                             ),
//                           ],
//                         ),
//                       ),
//                       Expanded(
//                         flex: 2,
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(
//                               h2h.teams!.home!.name!,
//                               textAlign: TextAlign.start,
//                               maxLines: 1,
//                               overflow: TextOverflow.ellipsis,
//                             ),
//                             Text(
//                               h2h.teams!.away!.name!,
//                               textAlign: TextAlign.start,
//                               maxLines: 1,
//                               overflow: TextOverflow.ellipsis,
//                             ),
//                           ],
//                         ),
//                       ),
//                       Expanded(
//                         flex: 1,
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           crossAxisAlignment: CrossAxisAlignment.end,
//                           children: [
//                             if (h2h.fixture!.status!.short == 'Live')
//                               Text(
//                                 'Score:',
//                               ),
//                             if (h2h.fixture!.status!.short == 'Live')
//                               Text(
//                                 '${h2h.score?.halftime?.home ?? ''}',
//                               ),
//                             if (h2h.fixture!.status!.short == 'Live')
//                               Text(
//                                 '${h2h.score?.halftime?.away ?? ''}',
//                               ),
//                             if (h2h.fixture!.status!.short == 'FT')
//                               Text(
//                                 '${h2h.score?.fulltime?.home ?? ''}',
//                               ),
//                             if (h2h.fixture!.status!.short == 'FT')
//                               Text(
//                                 '${h2h.score?.fulltime?.away ?? ''}',
//                               ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           );
//         },
//       );
//     } else {
//       return Center(
//         child: const Text('No Head to Head data available for this match.'),
//       );
//     }
//   }

//   Widget _buildLoadingWidget() {
//     return Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           CircularProgressIndicator(),
//           SizedBox(height: 16),
//           ElevatedButton(
//             onPressed: () {
//               setState(() {
//                 isLoading = true;
//               });
//               fetchEvents(); // Retry fetching data
//             },
//             child: Text('Retry'),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildEventsList() {
//     if (eventsModel != null && eventsModel!.response != null) {
//       final List<Response> teamEventsHome = eventsModel!.response!
//           .where((event) => event.team!.name == widget.response.teams!.home!.name)
//           .toList();
//       final List<Response> teamEventsAway = eventsModel!.response!
//           .where((event) => event.team!.name == widget.response.teams!.away!.name)
//           .toList();

//       if (teamEventsHome.isEmpty && teamEventsAway.isEmpty) {
//         return const Center(
//           child: Text('No events available for this match.'),
//         );
//       }
//       teamEventsHome.sort((a, b) => (a.time?.elapsed ?? 0).compareTo(b.time?.elapsed ?? 0));
//       teamEventsAway.sort((a, b) => (a.time?.elapsed ?? 0).compareTo(b.time?.elapsed ?? 0));
//       return Column(
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: [
//           if (widget.response.fixture!.status!.short == 'NS')
//             const Center(
//               child: Text('Match not yet started'),
//             ),
//           if (widget.response.fixture!.status!.short != 'NS' &&
//               teamEventsHome.isEmpty &&
//               teamEventsAway.isEmpty)
//             const Center(
//               child: Text('No events available for this match.'),
//             ),
//           if (widget.response.fixture!.status!.short != 'NS')
//             _buildTeamEvents(
//               teamEventsHome,
//               widget.response.teams!.home!.name,
//               widget.response.teams!.home!.logo,
//             ),
//           if (widget.response.fixture!.status!.short != 'NS')
//             _buildTeamEvents(
//               teamEventsAway,
//               widget.response.teams!.away!.name,
//               widget.response.teams!.away!.logo,
//             ),
//         ],
//       );
//     } else {
//       return const Center(
//         child: Text('No events available for this match.'),
//       );
//     }
//   }

//   Widget _buildTeamEvents(
//       List<Response> events, String? teamName, String? teamLogo) {
//     final teamEvents =
//         events.where((event) => event.team!.name == teamName).toList();
//     if (teamEvents.isEmpty) {
//       return const SizedBox.shrink();
//     }
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Row(
//             children: [
//               if (teamLogo != null)
//                 Padding(
//                   padding: const EdgeInsets.only(right: 8.0),
//                   child: Image.network(
//                     teamLogo,
//                     width: 32,
//                     height: 32,
//                   ),
//                 ),
//               Text(
//                 teamName!,
//                 style: const TextStyle(
//                   fontSize: 16,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ],
//           ),
//         ),
//         ListView.builder(
//           shrinkWrap: true,
//           physics: const NeverScrollableScrollPhysics(),
//           itemCount: teamEvents.length,
//           itemBuilder: (context, index) {
//             final event = teamEvents[index];
//             return ListTile(
//               title: Text(
//                 '${event.type} - ${event.detail}',
//                 style: TextStyle(
//                   color: _getEventColor(event.type ?? ''),
//                 ),
//               ),
//               subtitle: Text('Player: ${event.player?.name ?? ''}'),
//               trailing: Text('${event.time?.elapsed ?? ''}\''),
//             );
//           },
//         ),
//       ],
//     );
//   }

//   Color _getEventColor(String eventType) {
//     switch (eventType.toLowerCase()) {
//       case 'red card':
//         return Colors.red;
//       case 'second yellow':
//         return Colors.red;
//       case 'yellow card':
//         return Colors.yellow;
//       default:
//         return Colors.black;
//     }
//   }

//   Widget _buildStatistics() {
//     if (statisticsModel != null) {
//       final List<ResponseST> matchStats = statisticsModel!.response!;
//       return ListView.builder(
//         itemCount: matchStats.length,
//         itemBuilder: (context, index) {
//           final stat = matchStats[index];
//           return ListTile(
//             title: Text('Stat Type: ${stat.type ?? ''}'),
//             subtitle: Text('Value: ${stat.value ?? ''}'),
//           );
//         },
//       );
//     } else {
//       return const Center(
//         child: Text('No statistics available for this match.'),
//       );
//     }
//   }
// }
// ####################################################################################################






// ####################################################################################
// chatgpt 1
// import 'package:flutter/material.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: MyHomePage(),
//     );
//   }
// }

// class MyHomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: CustomScrollView(
//         slivers: [
//           SliverAppBar(
//             expandedHeight: 200.0,
//             floating: false,
//             pinned: true,
//             flexibleSpace: FlexibleSpaceBar(
//               title: Text('Custom Top Tabs Example'),
//               background: Image.network(
//                 'https://via.placeholder.com/600x200',
//                 fit: BoxFit.cover,
//               ),
//             ),
//           ),
//           SliverPersistentHeader(
//             delegate: CustomTabBarDelegate(
//               tabs: <Widget>[
//                 Tab(text: 'Tab 1'),
//                 Tab(text: 'Tab 2'),
//                 Tab(text: 'Tab 3'),
//               ],
//             ),
//             pinned: true,
//           ),
//           SliverFillRemaining(
//             child: TabBarView(
//               children: <Widget>[
//                 Center(child: Text('Tab 1 Content')),
//                 Center(child: Text('Tab 2 Content')),
//                 Center(child: Text('Tab 3 Content')),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class CustomTabBarDelegate extends SliverPersistentHeaderDelegate {
//   final TabBar tabs;

//   CustomTabBarDelegate({required this.tabs});

//   @override
//   double get minExtent => tabs.preferredSize.height;
//   @override
//   double get maxExtent => tabs.preferredSize.height;

//   @override
//   Widget build(
//       BuildContext context, double shrinkOffset, bool overlapsContent) {
//     return Container(
//       color: Colors.white,
//       child: tabs,
//     );
//   }

//   @override
//   bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
//     return false;
//   }
// }



// #########################################################################
// chatgpt 2
// import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: CustomTopTabs(),
//     );
//   }
// }

// class CustomTopTabs extends StatefulWidget {
//   @override
//   _CustomTopTabsState createState() => _CustomTopTabsState();
// }

// class _CustomTopTabsState extends State<CustomTopTabs> {
//   int _currentIndex = 0;
//   final List<Widget> _tabs = [
//     TabContent(title: 'Tab 1'),
//     TabContent(title: 'Tab 2'),
//     TabContent(title: 'Tab 3'),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: CustomScrollView(
//         slivers: <Widget>[
//           SliverAppBar(
//             expandedHeight: 200.0,
//             pinned: true,
//             flexibleSpace: FlexibleSpaceBar(
//               title: Text('Custom Top Tabs'),
//               background: Image.network(
//                 'https://via.placeholder.com/400x200',
//                 fit: BoxFit.cover,
//               ),
//             ),
//           ),
//           SliverPersistentHeader(
//             pinned: true,
//             delegate: CustomTabBarDelegate(
//               child: TabBar(
//                 tabs: _tabs
//                     .map((tab) => Tab(
//                           text: tab.title,
//                         ))
//                     .toList(),
//                 onTap: (index) {
//                   setState(() {
//                     _currentIndex = index;
//                   });
//                 },
//               ),
//             ),
//           ),
//           SliverFillRemaining(
//             child: TabBarView(
//               children: _tabs,
//               controller: TabController(
//                 length: _tabs.length,
//                 initialIndex: _currentIndex,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class TabContent extends StatelessWidget {
//   final String title;

//   TabContent({required this.title});

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Text(
//         title,
//         style: TextStyle(fontSize: 24.0),
//       ),
//     );
//   }
// }

// class CustomTabBarDelegate extends SliverPersistentHeaderDelegate {
//   final TabBar child;

//   CustomTabBarDelegate({required this.child});

//   @override
//   Widget build(
//       BuildContext context, double shrinkOffset, bool overlapsContent) {
//     return Container(
//       color: Colors.white,
//       child: child,
//     );
//   }

//   @override
//   double get maxExtent => child.preferredSize.height;

//   @override
//   double get minExtent => child.preferredSize.height;

//   @override
//   bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
//     return false;
//   }
// }
