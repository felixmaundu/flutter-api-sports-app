import 'package:flutter/material.dart';

class LeaguesInfoDetailsPage extends StatefulWidget {
  final String leagueName;

  const LeaguesInfoDetailsPage({super.key, required this.leagueName});
  @override
  State<LeaguesInfoDetailsPage> createState() => _LeaguesInfoDetailsPageState();
}

class _LeaguesInfoDetailsPageState extends State<LeaguesInfoDetailsPage> {
  // List<Response>? leaguesModel;
  bool isLoading = true;
  String errorMessage = '';

  @override
  void initState() {
    super.initState();
    // Load leagues data for the selected country
    // loadLeaguesData();
  }

  // // Function to load leagues data
  // Future<void> loadLeaguesData() async {
  //   try {
  //     // Fetch leagues data based on the selected country's code
  //     final leaguesResponse =
  //         await ApiService.fetchLeaguesByCountry(widget.countryCode);
  //       final fixtureResponse =
  //     // print(leaguesResponse);
  //     setState(() {
  //       leaguesModel = leaguesResponse.response!.cast<Response>();
  //       isLoading = false;
  //     });
  //   } catch (error) {
  //     setState(() {
  //       errorMessage = 'Error loading data: $error';
  //       isLoading = false;
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5, // Number of tabs
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            const SliverAppBar.medium(
              // expandedHeight: 300.0,
              floating: true,
              pinned: true,
              // backgroundColor: Colors.black12,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                titlePadding: EdgeInsets.all(10),
                title: Text(
                  'tab bar',
                  style: TextStyle(
                    fontSize: 15,
                    fontStyle: FontStyle.normal,
                  ),
                ),
                background: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [],
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
                    Tab(text: 'Fixtures'),
                    Tab(text: 'Top Scorers'),
                    Tab(text: 'Teams'),
                    Tab(text: 'Standings'),
                    Tab(text: 'Odds'),
                  ],
                ),
              ),
              pinned: true,
            ),
            const SliverFillRemaining(
              child: TabBarView(
                children: [
                  Center(child: Text('Statistics  Content')),
                  Center(child: Text('Top scorers  Content')),
                  Center(child: Text('Teams  Content')),
                  Center(child: Text('Standings  Content')),
                  Center(child: Text('Odds  Content')),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  buildFixtureContent() {}
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
