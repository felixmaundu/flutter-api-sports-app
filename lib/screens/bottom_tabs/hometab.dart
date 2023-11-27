// ignore_for_file: unused_element

import 'package:flutter/material.dart';
import 'package:flutter6_sports_app/models/eventsModel.dart';
import 'package:flutter6_sports_app/models/fixturesModel.dart';
import 'package:flutter6_sports_app/models/headtoheadModel.dart';
import 'package:flutter6_sports_app/models/predictionModel.dart';
import 'package:flutter6_sports_app/models/statisticsModel.dart';
import 'package:flutter6_sports_app/screens/details_screen/matchDetailsPage.dart';
import 'package:flutter6_sports_app/screens/pages/searchPage.dart';
import 'package:flutter6_sports_app/services/api_service.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomeTabState createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  List<Responses>? fixtures;
  EventsModel? eventsModel;
  PredictionModel? predictionModel;
  StatisticsModel? statisticsModel;
  HeadToHeadModel? headToHeadModel;
  bool isLoading = true;
  String errorMessage = '';
  List<Responses>? liveFixtures;
  List<Responses>? upcomingFixtures;
  List<Responses>? finishedFixtures;
  Set<String> favoriteMatches = <String>{}; // Store favorite matches
  DateTime selectedDate = DateTime.now(); // Initially, select today's date

  @override
  void initState() {
    super.initState();
    fetchData();
    loadFavoriteMatches(); // Load favorite matches from SharedPreferences
  }

  void fetchData() async {
    try {
      List<Responses> data = await ApiService.fetchFixtures();
      // Separate fixtures based on their status
      liveFixtures = data
          .where((fixture) =>
              fixture.fixture?.status?.short == "1H" ||
              fixture.fixture?.status?.short == "2H")
          .toList();
      upcomingFixtures = data
          .where((fixture) =>
              fixture.fixture?.status?.short == "NS" ||
              fixture.fixture?.status?.short == "TBD")
          .toList();
      finishedFixtures = data
          .where((fixture) =>
              fixture.fixture?.status?.short == "FT" ||
              fixture.fixture?.status?.short == "PEN")
          .toList();

      setState(() {
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        errorMessage = e.toString();
        isLoading = false;
      });
    }
  }

  // Function to retry fetching data
  void retryFetchData() {
    setState(() {
      isLoading = true;
      errorMessage = ''; // Clear previous error message
    });
    fetchData(); // Call the fetchData function again
  }

  void loadFavoriteMatches() async {
    final prefs = await SharedPreferences.getInstance();
    final favoriteMatchesList = prefs.getStringList('favoriteMatches') ?? [];
    setState(() {
      favoriteMatches = favoriteMatchesList.toSet();
    });
  }

  void saveFavoriteMatches() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setStringList('favoriteMatches', favoriteMatches.toList());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      // appBar: AppBar(
      //   title: const Text('Nova Sports'),
      //   actions: [
      //     IconButton(
      //       icon: const Icon(Icons.search),
      //       onPressed: () {
      //         _handleSearch(context);
      //       },
      //     ),
      //   ],
      // ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : errorMessage.isNotEmpty
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(errorMessage),
                      ElevatedButton(
                        onPressed: retryFetchData, // Retry button
                        child: const Text('Retry'),
                      ),
                    ],
                  ),
                )
              : ListView(
                  children: [
                    if (liveFixtures != null && liveFixtures!.isNotEmpty)
                      _buildFixtureList(
                          "Live Matches",
                          liveFixtures!,
                          eventsModel,
                          predictionModel,
                          statisticsModel,
                          headToHeadModel),
                    if (upcomingFixtures != null &&
                        upcomingFixtures!.isNotEmpty)
                      _buildFixtureList(
                          "Upcoming Matches",
                          upcomingFixtures!,
                          eventsModel,
                          predictionModel,
                          statisticsModel,
                          headToHeadModel),
                    if (finishedFixtures != null &&
                        finishedFixtures!.isNotEmpty)
                      _buildFixtureList(
                          "Finished Matches",
                          finishedFixtures!,
                          eventsModel,
                          predictionModel,
                          statisticsModel,
                          headToHeadModel),
                  ],
                ),
    );
  }

  Widget _buildFixtureList(
    String title,
    List<Responses> fixtures,
    EventsModel? eventsModel,
    PredictionModel? predictionModel,
    StatisticsModel? statisticsModel,
    HeadToHeadModel? headToHeadModel,
  ) {
    // Create a map to group fixtures by league name and country name
    Map<String, Map<String, List<Responses>>> fixturesByLeagueAndCountry = {};

    // Group fixtures by league and country
    for (Responses fixture in fixtures) {
      String leagueName = fixture.league?.name ?? "Other";
      String countryName = fixture.league?.country ?? "Other";

      if (!fixturesByLeagueAndCountry.containsKey(leagueName)) {
        fixturesByLeagueAndCountry[leagueName] = {};
      }

      if (!fixturesByLeagueAndCountry[leagueName]!.containsKey(countryName)) {
        fixturesByLeagueAndCountry[leagueName]![countryName] = [];
      }

      fixturesByLeagueAndCountry[leagueName]![countryName]!.add(fixture);
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        // Loop through the fixtures by league
        for (var leagueEntry in fixturesByLeagueAndCountry.entries)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        // Display the league logo if available
                        if (leagueEntry.value.entries.isNotEmpty)
                          Image.network(
                            leagueEntry.value.entries.first.value.first.league
                                    ?.logo ??
                                "",
                            height: 30,
                            width: 30,
                          ),
                        // if (leagueEntry.value.entries.isNotEmpty)
                        //   SvgPicture.network(
                        //     leagueEntry.value.entries.first.value.first.league
                        //             ?.logo ??
                        //         "",
                        //     height: 20,
                        //     width: 30,
                        //   ),
                        Text(
                          leagueEntry.key, // League name
                          maxLines: 2,
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: Colors.blue,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          leagueEntry.value.entries.first.key, // Country name
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w200,
                            color: Colors.orange,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Column(
                children: leagueEntry.value.entries
                    .expand((countryEntry) => countryEntry.value.map((fixture) {
                          return GestureDetector(
                            onTap: () {
                              _navigateToMatchDetail(context, fixture);
                            },
                            child: FixtureCard(
                              fixture: fixture,
                              isFavorite: favoriteMatches.contains(
                                  '${fixture.teams!.home!.name} vs ${fixture.teams?.away?.name}'),
                              onToggleFavorite: () {
                                _toggleFavorite(fixture);
                              },
                              eventsModel: eventsModel,
                              predictionModel: predictionModel,
                              statisticsModel: statisticsModel,
                              headToHeadModel: headToHeadModel,
                            ),
                          );
                        }))
                    .toList(),
              ),
            ],
          ),
      ],
    );
  }

  void _toggleFavorite(Responses fixture) {
    final matchName =
        '${fixture.teams!.home!.name} vs ${fixture.teams?.away?.name}';
    setState(() {
      if (favoriteMatches.contains(matchName)) {
        favoriteMatches.remove(matchName);
      } else {
        favoriteMatches.add(matchName);
      }
    });
    saveFavoriteMatches(); // Save favorite matches to SharedPreferences
  }

  void _navigateToMatchDetail(BuildContext context, Responses fixture) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MatchDetailPage(response: fixture),
      ),
    );
  }

  void _handleSearch(BuildContext context) async {
    final selectedFixture = await showSearch<Responses>(
      context: context,
      delegate: MatchSearchDelegate(fixtures),
    );

    if (selectedFixture != null) {
      // ignore: use_build_context_synchronously
      _navigateToMatchDetail(context, selectedFixture);
    }
  }
}

class FixtureCard extends StatefulWidget {
  final Responses fixture;
  final bool isFavorite;
  final VoidCallback onToggleFavorite;
  final EventsModel? eventsModel;
  final PredictionModel? predictionModel;
  final StatisticsModel? statisticsModel;
  final HeadToHeadModel? headToHeadModel;

  const FixtureCard(
      {super.key,
      required this.fixture,
      required this.isFavorite,
      required this.onToggleFavorite,
      required this.eventsModel,
      required this.predictionModel,
      required this.statisticsModel,
      required this.headToHeadModel});

  @override
  // ignore: library_private_types_in_public_api
  _FixtureCardState createState() => _FixtureCardState();
}

class _FixtureCardState extends State<FixtureCard> {
  @override
  Widget build(BuildContext context) {
    String matchStatus = '';
    String matchTime = '';
    // ignore: unused_local_variable
    String matchDate = '';
    String matchElapsed = '';

    // Determine the match status and time
    if (widget.fixture.fixture!.status!.short == '1H' ||
        widget.fixture.fixture!.status!.short == '2H') {
      matchStatus = 'Live';
      matchElapsed = '${widget.fixture.fixture!.status!.elapsed}';
      matchTime = '${widget.fixture.fixture!.status!.short}';
    } else if (widget.fixture.fixture!.status!.short == 'FT') {
      matchStatus = 'FT';
      matchElapsed = '';
      // Clear elapsed time when match has ended
    } else if (widget.fixture.fixture!.status!.short == 'ET') {
      matchStatus = '90+';
      matchElapsed = ''; // Clear elapsed time when match has ended
    } else if (widget.fixture.fixture!.status!.short == 'NS') {
      matchStatus = 'Scheduled'; // Match not started yet
      // Format the scheduled match time
      if (widget.fixture.fixture!.date != null) {
        final DateTime matchDateTime =
            DateTime.parse(widget.fixture.fixture!.date!);
        matchTime =
            '${matchDateTime.hour.toString().padLeft(1, '0')}:${matchDateTime.minute.toString().padLeft(2, '0')}';
      }
    } else if (widget.fixture.fixture!.status!.short == 'HT') {
      matchStatus = 'HT';
      matchElapsed = ''; // Clear elapsed time when match has ended
    } else if (widget.fixture.fixture!.status!.short == 'POST') {
      matchStatus = 'POST';
      matchElapsed = ''; // Clear elapsed time when match has ended
    }

    // Format the match date
    if (widget.fixture.fixture!.date != null) {
      final DateTime matchDateTime =
          DateTime.parse(widget.fixture.fixture!.date!);
      matchDate =
          '${matchDateTime.day.toString().padLeft(2, '0')}/${matchDateTime.month.toString().padLeft(2, '0')}';
    }

    return Card(
      margin: const EdgeInsets.all(0.5),
      child: ListTile(
        title: Row(
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
                  if (matchStatus == 'Scheduled')
                    Text(
                      matchTime,
                    ),
                  if (matchStatus == 'Live' && matchElapsed.isNotEmpty)
                    Text(
                      '$matchElapsed${matchElapsed.isNotEmpty ? '\'' : ''}',
                    ),
                  if (matchStatus == 'FT')
                    const Text(
                      'FT',
                    ),
                  if (matchStatus == 'HT')
                    const Text(
                      'FT',
                    ),
                  //  Text(
                  //   widget.fixture.fixture!.status!.elapsed!.toString()
                  // ),
                ],
              ),
            ),
            // Second Column (Home Team on Top of Away Team)
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.fixture.teams!.home!.name!,
                    textAlign: TextAlign.start,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    // style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    widget.fixture.teams!.away!.name!,
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
                  if (matchStatus == 'Live')
                    if (matchStatus == 'Live')
                      Text(
                        '${widget.fixture.score?.halftime?.home ?? ''}',
                        // style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                  if (matchStatus == 'Live')
                    Text(
                      '${widget.fixture.score?.halftime?.away ?? ''}',
                      // style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  if (matchStatus == 'FT')
                    Text(
                      '${widget.fixture.score?.fulltime?.home ?? ''}',
                      // style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  if (matchStatus == 'FT')
                    Text(
                      '${widget.fixture.score?.fulltime?.away ?? ''}',
                      // style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                ],
              ),
            ),
            // Fourth Column (Favorite Icon)
            Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  IconButton(
                    icon: Icon(
                      widget.isFavorite ? Icons.star : Icons.star_border,
                      color: widget.isFavorite ? Colors.red : null,
                    ),
                    onPressed: () {
                      widget.onToggleFavorite();
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool _hasRedCard(String? teamName) {
    return widget.eventsModel?.response?.any((event) {
          return event.team?.name == teamName &&
              (event.type == 'red card' || event.type == 'second yellow');
        }) ??
        false;
  }

  bool _hasYellowCard(String? teamName) {
    return widget.eventsModel?.response?.any((event) {
          return event.team?.name == teamName && event.type == 'yellow card';
        }) ??
        false;
  }
}
