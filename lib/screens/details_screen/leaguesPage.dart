// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter6_sports_app/models/LeaguesModel.dart';
import 'package:flutter6_sports_app/screens/details_screen/leaguesInfoDetailsPage.dart';
import 'package:flutter6_sports_app/services/api_service.dart';
import 'package:flutter_svg/svg.dart';

class LeaguesPage extends StatefulWidget {
  final String countryCode;

  const LeaguesPage({super.key, required this.countryCode});

  @override
  State<LeaguesPage> createState() => _LeaguesPageState();
}

class _LeaguesPageState extends State<LeaguesPage> {
  List<Response>? leaguesModel;
  bool isLoading = true;
  String errorMessage = '';

  @override
  void initState() {
    super.initState();
    // Load leagues data for the selected country
    loadLeaguesData();
  }

  // Function to load leagues data
  Future<void> loadLeaguesData() async {
    try {
      // Fetch leagues data based on the selected country's code
      final leaguesResponse =
          await ApiService.fetchLeaguesByCountry(widget.countryCode);
      // print(leaguesResponse);
      setState(() {
        leaguesModel = leaguesResponse.response!.cast<Response>();
        isLoading = false;
      });
    } catch (error) {
      setState(() {
        errorMessage = 'Error loading data: $error';
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Leagues'),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : errorMessage.isNotEmpty
              ? Center(child: Text(errorMessage))
              : ListView.builder(
                  itemCount: leaguesModel?.length ?? 0,
                  itemBuilder: (context, index) {
                    final Country? league = leaguesModel![index].country;
                    // final Response seasons = leaguesModel![index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => LeaguesInfoDetailsPage(
                              leagueName: league.name!,
                            ),
                          ),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                          leading: SvgPicture.network(
                            league!.flag!,
                            height: 50,
                            width: 50,
                          ),
                          //  CircleAvatar(
                          //   backgroundColor: Colors.lightBlue,
                          //   backgroundImage: SvgPicture.network(
                          //     league!.flag!,
                          //   ),
                          //   radius: 50,
                          // ),
                          title: Text(league.name ?? ''),
                          trailing: Text(league.code!),
                          subtitle: Text(widget.countryCode),
                          // You can display other league information here
                          // For example: Image.network(league.league?.logo ?? ''),
                        ),
                      ),
                    );
                  },
                ),
    );
  }
}
