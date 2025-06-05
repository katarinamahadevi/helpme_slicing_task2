import 'package:flutter/material.dart';
import 'package:helpme_slicing_task2/models/detailmodule_model.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class DetailModuleScreen extends StatefulWidget {
  final DetailmoduleModel module;

  const DetailModuleScreen({Key? key, required this.module}) : super(key: key);

  @override
  _DetailModuleScreenState createState() => _DetailModuleScreenState();
}

class _DetailModuleScreenState extends State<DetailModuleScreen> {
  late YoutubePlayerController _controller;

   @override
  void initState() {
    super.initState();
    final videoId = YoutubePlayer.convertUrlToId(widget.module.videoUrl);
    _controller = YoutubePlayerController(
      initialVideoId: videoId!,
      flags: YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(16),
                    bottomRight: Radius.circular(16),
                  ),
                  child: Image.asset(
                    widget.module.image,
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.35,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 40,
                  left: 16,
                  child: CircleAvatar(
                    backgroundColor: Colors.red,
                    child: IconButton(
                      icon: Icon(Icons.arrow_back, color: Colors.white),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(
                      40,
                      10,
                      40,
                      10,
                    ), 
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      widget.module.title,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 12),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10.0,
                    ), 
                    child: Text(
                      widget.module.description,
                      style: TextStyle(fontSize: 14),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    "Langkah Pertolongan Pertama untuk Membantu Orang yang Pingsan",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),

                  Wrap(
                    spacing: 16, 
                    runSpacing: 8, 
                    children: List.generate(
                      widget.module.steps.length,
                      (index) => SizedBox(
                        width:
                            MediaQuery.of(context).size.width *
                            0.35, 
                        child: Row(
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.red,
                              radius: 14, 
                              child: Text(
                                "${index + 1}",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                            SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                widget.module.steps[index],
                                style: TextStyle(fontSize: 14),
                                overflow: TextOverflow.clip,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 16),
                  Text(
                    "Simak video berikut",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                   YoutubePlayerBuilder(
                    player: YoutubePlayer(
                      controller: _controller,
                      showVideoProgressIndicator: true,
                    ),
                    builder: (context, player) {
                      return Column(
                        children: [
                          player, 
                        ],
                      );
                    },
                  ),
                ]
              )
            )
          ]
        )
      )
    );
  }
}
