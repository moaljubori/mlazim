// ignore: duplicate_ignore
// ignore: file_names
// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutubePlayerd extends StatefulWidget {

  final String name;
  final String link;
  const YoutubePlayerd({Key? key, required this.name, required this.link})
      : super(key: key);

  @override
  YoutubePlayerdState createState() => YoutubePlayerdState();
}

class YoutubePlayerdState extends State<YoutubePlayerd> {
  @override
  void initState() {
    super.initState();

    // Enable virtual display.
  }
  bool _fullScreen = false;
  late YoutubePlayerController _controller;

  void listener() {
      setState(() {
        _fullScreen = _controller.value.isFullScreen;
      });
  }


  @override
  Widget build(BuildContext context) {
     _controller = YoutubePlayerController(
      initialVideoId:widget.link,
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ),
    )..addListener(listener);

  
    return Scaffold(
      appBar: _fullScreen ?null :  AppBar(
 
        title: Text(widget.name),
      ),
      body: YoutubePlayerBuilder(
          player: YoutubePlayer(
            controller: _controller,
          ),
          builder: (context, player) {
            return Column(
              children: [
                // some widgets
                player,
                //some other widgets
              ],
            );
          }),
    );
  }
}
