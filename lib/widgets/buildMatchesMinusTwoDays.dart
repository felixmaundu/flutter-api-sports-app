// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter6_sports_app/models/eventsModel.dart';
import 'package:flutter6_sports_app/models/fixturesModel.dart';
import 'package:flutter6_sports_app/models/headtoheadModel.dart';
import 'package:flutter6_sports_app/models/predictionModel.dart';
import 'package:flutter6_sports_app/models/statisticsModel.dart';
import 'package:flutter6_sports_app/screens/details_screen/matchDetailsPage.dart';
import 'package:flutter6_sports_app/services/api_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BuildMatchesMinusTwoDays extends StatefulWidget {
  const BuildMatchesMinusTwoDays({Key? key}) : super(key: key);

  @override
  State<BuildMatchesMinusTwoDays> createState() =>
      _BuildMatchesMinusTwoDaysState();
}

class _BuildMatchesMinusTwoDaysState extends State<BuildMatchesMinusTwoDays> {
  List<Responses>? fixtures;
  bool isLoading = true;
  String errorMessage = '';
  DateTime selectedDate = DateTime.now(); // Initially, select today's date
  Set<String> favoriteMatches = <String>{}; // Store favorite matches
  EventsModel? eventsModel;
  PredictionModel? predictionModel;
  StatisticsModel? statisticsModel;
  HeadToHeadModel? headToHeadModel;
  @override
  void initState() {
    super.initState();
    fetchData();
    loadFavoriteMatches(); // Load favorite matches from SharedPreferences
  }

  void fetchData() async {
    try {
      fixtures = await ApiService.fetchFixturesMinusTwoDays();
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
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : errorMessage.isNotEmpty
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(errorMessage),
                      ElevatedButton(
                        onPressed: fetchData,
                        child: const Text('Retry'),
                      ),
                    ],
                  ),
                )
              : SingleChildScrollView(
                  child: Column(
                    children: [
                      _buildFixtureList(fixtures!, eventsModel, predictionModel,
                          statisticsModel, headToHeadModel),
                    ],
                  ),
                ),
    );
  }

  void _navigateToMatchDetail(BuildContext context, Responses fixture) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MatchDetailPage(response: fixture),
      ),
    );
  }

  _buildFixtureList(
      List<Responses> fixtures,
      EventsModel? eventsModel,
      PredictionModel? predictionModel,
      StatisticsModel? statisticsModel,
      HeadToHeadModel? headToHeadModel) {
    // Create a map to group fixtures by country and league name
    Map<String, Map<String, List<Responses>>> fixturesByCountryAndLeague = {};

    // Group fixtures by country and league
    for (Responses fixture in fixtures) {
      String countryName = fixture.league?.country ??
          "Other"; // Use "Other" if country name is null
      String leagueName =
          fixture.league?.name ?? "Other"; // Use "Other" if league name is null

      if (!fixturesByCountryAndLeague.containsKey(countryName)) {
        fixturesByCountryAndLeague[countryName] = {};
      }

      if (!fixturesByCountryAndLeague[countryName]!.containsKey(leagueName)) {
        fixturesByCountryAndLeague[countryName]![leagueName] = [];
      }

      fixturesByCountryAndLeague[countryName]![leagueName]!.add(fixture);
    }

    // Create a list of widgets for each country's and league's fixtures
    List<Widget> countryWidgets = [];

    // Iterate through the grouped fixtures and create widgets
    fixturesByCountryAndLeague.forEach(
      (countryName, leagues) {
        List<Widget> leagueWidgets = [];

        // Iterate through leagues within a country
        leagues.forEach(
          (leagueName, leagueFixtures) {
            leagueWidgets.add(
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Text(
                          leagueName,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),
                        ),
                        Text(
                          countryName,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w200,
                            color: Colors.orange,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: leagueFixtures.map((fixture) {
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
                            eventsModel:
                                eventsModel, // Pass the eventsModel here
                            predictionModel: predictionModel,
                            statisticsModel: statisticsModel,
                            headToHeadModel: headToHeadModel),
                      );
                      // ListTile(
                      //   title: Text(fixture.teams?.home?.name ?? "N/A"),
                      //   subtitle: Text(fixture.teams?.home?.name ?? "N/A"),
                      //   onTap: () {
                      //     _navigateToMatchDetail(context, fixture);
                      //   },
                      // );
                    }).toList(),
                  ),
                ],
              ),
            );
          },
        );

        // Add the league widgets for the current country to the countryWidgets list
        countryWidgets.addAll(leagueWidgets);
      },
    );

    // Return the list of country widgets wrapped in a SingleChildScrollView
    return SingleChildScrollView(
      child: Column(
        children: countryWidgets,
      ),
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
    String matchTime = '';
    // ignore: unused_local_variable
    String matchDate = '';

    // Format the scheduled match time
    if (widget.fixture.fixture!.date != null) {
      final DateTime matchDateTime =
          DateTime.parse(widget.fixture.fixture!.date!);
      matchTime =
          '${matchDateTime.hour.toString().padLeft(1, '0')}:${matchDateTime.minute.toString().padLeft(2, '0')}';
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
                  Text(
                    matchTime,
                  ),
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
                  Text(
                    '${widget.fixture.score?.fulltime?.home ?? ''}',
                    // style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '${widget.fixture.score?.fulltime?.away ?? ''}',
                    // style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
