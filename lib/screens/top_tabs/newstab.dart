import 'package:flutter/material.dart';
import 'package:flutter6_sports_app/models/sportsNewsModel.dart';
import 'package:flutter6_sports_app/services/api_service.dart';

class NewsTab extends StatefulWidget {
  NewsTab({Key? key}) : super(key: key);

  @override
  State<NewsTab> createState() => _NewsTabState();
}

class _NewsTabState extends State<NewsTab> {
  SportsNewModel? sportsNews;

  bool isLoading = true;
  String errorMessage = '';
  bool isFetchingMore = false;
  bool hasMoreData = true;

  // Scroll controller to monitor scroll position
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _fetchNews();

    // Add a scroll listener to the scroll controller
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        // User has reached the end of the list, fetch more articles
        _fetchMoreNews();
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> _fetchNews() async {
    try {
      sportsNews = await ApiService.fetchSportsNews();
      setState(() {
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        errorMessage = 'Error fetching news: $e';
        isLoading = false;
      });
    }
  }

  Future<void> _fetchMoreNews() async {
    if (isFetchingMore || !hasMoreData) {
      return;
    }

    isFetchingMore = true;

    try {
      final newPage = await ApiService.fetchSportsNews(
          page: (sportsNews!.articles.length ~/ 20) + 1);
      if (newPage.articles.isNotEmpty) {
        sportsNews?.articles.addAll(newPage.articles);
      } else {
        // No more data to fetch
        hasMoreData = false;
      }
    } catch (e) {
      // Handle error when fetching more news
    } finally {
      isFetchingMore = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : errorMessage.isNotEmpty
              ? Center(child: Text(errorMessage))
              : _buildNewsList(),
    );
  }

  Widget _buildNewsList() {
    return ListView.builder(
      controller: _scrollController, // Attach the scroll controller
      itemCount: (sportsNews?.articles.length ?? 0) + (hasMoreData ? 1 : 0),
      itemBuilder: (context, index) {
        if (index < (sportsNews?.articles.length ?? 0)) {
          final article = sportsNews!.articles[index];
          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => NewsDetailPage(article: article),
                ),
              );
            },
            child: Card(
              elevation: 4,
              margin: const EdgeInsets.all(2),
              child: Column(
                children: [
                  ListTile(
                    title: Text(article.title ?? ''),
                    subtitle: Text(article.author ?? ''),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      article.description ?? '',
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                  if (article.urlToImage != null)
                    Image.network(article.urlToImage!),
                ],
              ),
            ),
          );
        } else if (hasMoreData) {
          // Loading indicator at the end
          return const Padding(
            padding: EdgeInsets.all(16),
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        return const SizedBox();
      },
    );
  }
}

class NewsDetailPage extends StatelessWidget {
  final Article article;

  NewsDetailPage({required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('News Detail'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                article.title ?? '',
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              Text(
                article.author ?? '',
                style: const TextStyle(fontSize: 16),
              ),
              if (article.urlToImage != null)
                Image.network(
                  article.urlToImage!,
                  height: 200,
                  width: MediaQuery.of(context).size.width,
                ),
              Text(
                article.description ?? '',
                style: const TextStyle(fontSize: 16),
              ),
              Text(
                article.content ?? '',
                style: const TextStyle(fontSize: 16),
              ),
              const Text(
                'read more at :',
                style: TextStyle(fontSize: 16),
              ),
              Text(
                article.url ?? '',
                style: const TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
