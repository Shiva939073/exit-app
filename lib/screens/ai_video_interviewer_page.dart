import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class AIVideoInterviewerPage extends StatefulWidget {
  final String selectedRole;
  const AIVideoInterviewerPage({super.key, required this.selectedRole});


  @override
  State<AIVideoInterviewerPage> createState() => _AIVideoInterviewerPageState();
}

class _AIVideoInterviewerPageState extends State<AIVideoInterviewerPage> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
      'https://your-cloud-link.com/ai_interviewer_1.mp4',
    )..initialize().then((_) {
        setState(() {});
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text('AI Interviewer', style: TextStyle(color: Colors.white)),
      ),
      body: Center(
        child: _controller.value.isInitialized
            ? AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: VideoPlayer(_controller),
              )
            : const CircularProgressIndicator(),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepPurple,
        onPressed: () {
          setState(() {
            _controller.value.isPlaying
                ? _controller.pause()
                : _controller.play();
          });
        },
        child: Icon(
          _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
        ),
      ),
    );
  }
}
