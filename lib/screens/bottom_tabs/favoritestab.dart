// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoritesTab extends StatefulWidget {
  @override
  _FavoritesTabState createState() => _FavoritesTabState();
}

class _FavoritesTabState extends State<FavoritesTab> {
  List<String> favoriteMatches = [];

  @override
  void initState() {
    super.initState();
    _loadFavorites();
  }

  void _loadFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final favorites = prefs.getStringList('favoriteMatches') ?? [];
    setState(() {
      favoriteMatches = favorites;
    });
  }

  void _removeFavoriteMatch(String matchName) async {
    setState(() {
      favoriteMatches.remove(matchName);
    });

    final prefs = await SharedPreferences.getInstance();
    prefs.setStringList('favoriteMatches', favoriteMatches);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites'),
      ),
      body: ListView.builder(
        itemCount: favoriteMatches.length,
        itemBuilder: (context, index) {
          final matchName = favoriteMatches[index];
          return ListTile(
            title: Text(matchName),
            // You can add more details here if needed

            // Add a Remove button to remove the match from favorites
            trailing: IconButton(
              icon: const Icon(Icons.remove),
              onPressed: () {
                _removeFavoriteMatch(matchName);
              },
            ),
          );
        },
      ),
    );
  }
}
