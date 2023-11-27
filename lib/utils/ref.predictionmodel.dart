// soln 2
// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            expandedHeight: 200.0,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text('App Title'),
            ),
          ),
          SliverPersistentHeader(
            delegate: MySliverAppBarDelegate(
              const TabBar(
                tabs: [
                  Tab(text: 'Events'),
                  Tab(text: 'Statistics'),
                  Tab(text: 'Predictions'),
                ],
              ),
            ),
            pinned: true,
          ),
          const SliverFillRemaining(
            child: TabBarView(
              children: [
                // Add your content for the 'Events' tab here
                Center(child: Text('Events Content')),
                // Add your content for the 'Statistics' tab here
                Center(child: Text('Statistics Content')),
                // Add your content for the 'Predictions' tab here
                Center(child: Text('Predictions Content')),
              ],
            ),
          ),
        ],
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
//##########################################################

class MyApp1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200.0,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text('My App'),
              background: Image.network(
                'https://example.com/your_image.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverPersistentHeader(
            delegate: _SliverAppBarDelegate(
              const TabBar(
                labelColor: Colors.black87,
                unselectedLabelColor: Colors.grey,
                tabs: [
                  Tab(text: 'Events'),
                  Tab(text: 'Statistics'),
                  Tab(text: 'Predictions'),
                ],
              ),
            ),
            pinned: true,
          ),
          const SliverFillRemaining(
            child: TabBarView(
              children: [
                // Content for 'Events' tab
                Center(
                  child: Text('Events Content'),
                ),
                // Content for 'Statistics' tab
                Center(
                  child: Text('Statistics Content'),
                ),
                // Content for 'Predictions' tab
                Center(
                  child: Text('Predictions Content'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;
  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}
