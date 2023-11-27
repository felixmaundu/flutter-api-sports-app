// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter6_sports_app/models/fixturesModel.dart';

class MatchSearchDelegate extends SearchDelegate<Responses> {
  final List<Responses>? fixtures;

  MatchSearchDelegate(this.fixtures);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // Add a null check and provide a default value or handle the null case.
    // final fixtures = this.fixtures ?? [];
    if (query.isEmpty) {
      // Return the icon when the search query is empty.
      return IconButton(
        icon: const Icon(Icons.search),
        onPressed: () {
          close(context, '' as Responses);
        },
      );
    } else {
      // Show a clear button when the search query is not empty.
      return IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
          // You can update the search results accordingly here if needed.
        },
      );
    }
  }

  // @override
  // Widget buildLeading(BuildContext context) {
  //   return IconButton(
  //     icon: Icon(Icons.arrow_back),
  //     onPressed: () {
  //       close(context, '');
  //     },
  //   );
  // }

  @override
  Widget buildResults(BuildContext context) {
    // Implement the search results UI based on the query.
    // You can filter the fixtures list based on the query here.
    final filteredFixtures = fixtures?.where((fixture) {
      final matchName =
          '${fixture.teams!.home!.name} vs ${fixture.teams?.away?.name}';
      return matchName.toLowerCase().contains(query.toLowerCase());
    }).toList();

    if (filteredFixtures != null && filteredFixtures.isNotEmpty) {
      return ListView(
        children: filteredFixtures.map((fixture) {
          return ListTile(
            title: Text(
              '${fixture.teams!.home!.name} vs ${fixture.teams?.away?.name}',
            ),
            onTap: () {
              close(context, fixture);
            },
          );
        }).toList(),
      );
    } else {
      return const Center(
        child: Text('No matching fixtures found.'),
      );
    }
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // Implement suggestions while the user is typing.
    // You can filter the fixtures list based on the query here.
    final filteredFixtures = fixtures?.where((fixture) {
      final matchName =
          '${fixture.teams!.home!.name} vs ${fixture.teams?.away?.name}';
      return matchName.toLowerCase().contains(query.toLowerCase());
    }).toList();

    if (filteredFixtures != null && filteredFixtures.isNotEmpty) {
      return ListView(
        children: filteredFixtures.map((fixture) {
          return ListTile(
            title: Text(
              '${fixture.teams!.home!.name} vs ${fixture.teams?.away?.name}',
            ),
            onTap: () {
              close(context, fixture);
            },
          );
        }).toList(),
      );
    } else {
      return const Center(
        child: Text('No matching fixtures found.'),
      );
    }
  }
}
