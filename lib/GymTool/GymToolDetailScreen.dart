import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class GymToolDetailScreen extends StatefulWidget {
  final Map<String, String> tool;

  const GymToolDetailScreen({Key? key, required this.tool}) : super(key: key);

  @override
  _GymToolDetailScreenState createState() => _GymToolDetailScreenState();
}

class _GymToolDetailScreenState extends State<GymToolDetailScreen> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    final videoId = YoutubePlayer.convertUrlToId(widget.tool['videoUrl']!);
    _controller = YoutubePlayerController(
      initialVideoId: videoId!,
      flags: const YoutubePlayerFlags(autoPlay: false),
    );
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.tool['name']!)),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(widget.tool['image']!, height: 200),
            const SizedBox(height: 10),
            Text(widget.tool['description']!,
                style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 20),
            const Text('Tutorial Video:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            YoutubePlayer(controller: _controller),
          ],
        ),
      ),
     
      );
}
}
