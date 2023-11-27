import 'package:flutter/material.dart';
import 'package:flutter6_sports_app/models/MatchVideoModel.dart';
import 'package:flutter6_sports_app/services/api_service.dart';

class LiveWatch extends StatefulWidget {
  const LiveWatch({Key? key}) : super(key: key);

  @override
  State<LiveWatch> createState() => _LiveWatchState();
}

class _LiveWatchState extends State<LiveWatch> {
  List<MatchVideoModel>? videos;
  bool isLoading = true;
  String error = '';

  @override
  void initState() {
    super.initState();
    fetchVideos();
  }

  Future<void> fetchVideos() async {
    try {
      final List<MatchVideoModel> videoList =
          await ApiService.fetchFootballFeedsVideos();
      setState(() {
        videos = videoList;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        error = 'Error fetching videos: $e';
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Live Watch'),
      ),
      body: Column(
        children: [
          if (isLoading)
            const Center(
              child: CircularProgressIndicator(),
            )
          else if (error.isNotEmpty)
            Center(
              child: Text(error),
            )
          else if (videos != null && videos!.isNotEmpty)
            Expanded(
              child: ListView.builder(
                itemCount: videos!.length,
                itemBuilder: (context, index) {
                  final video = videos![index];
                  return ListTile(
                    title: Text(video.response?[index].title ?? ''),
                    subtitle: Text(video.response?[index].competition ?? ''),
                    // Add more widgets to display video information as needed
                  );
                },
              ),
            )
          else
            const Center(
              child: Text('No videos available.'),
            ),
        ],
      ),
    );
  }
}
