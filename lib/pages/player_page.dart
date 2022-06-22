import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_codigo5_movieapp/models/movie_model.dart';

import '../utils/constans.dart';

class PlayerPage extends StatefulWidget {
  final List<MovieModel> item;

  int index;
  PlayerPage({Key? key, required this.index, required this.item})
      : super(key: key);

  @override
  State<PlayerPage> createState() => _PlayerPageState();
}

class _PlayerPageState extends State<PlayerPage> {
  late BetterPlayerController _betterPlayerController;
  @override
  void initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    // =========== Bette Player: =================
    BetterPlayerConfiguration betterPlayerConfiguration =
        BetterPlayerConfiguration(
      aspectRatio: 1,
      fit: BoxFit.fill,
      rotation: 0,
      autoPlay: true,
    );
    BetterPlayerDataSource dataSource =
        BetterPlayerDataSource(BetterPlayerDataSourceType.network, movieHLS);
    _betterPlayerController = BetterPlayerController(betterPlayerConfiguration);
    _betterPlayerController.setupDataSource(dataSource);
    //=========== en Better Player =================
    // TODO: implement initState

    final fruitList = widget.item[widget.index].sources
        .map(
          (e) => Chip(
            label: Text(
              e.file,
            ),
          ),
        )
        .toList();
    final fruitMap = fruitList.asMap();
    final myFruit = fruitMap[1];
    print(myFruit);
    final fruitListAgain = fruitMap.values.toList();
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
    ]);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Expanded(
            child: BetterPlayer(controller: _betterPlayerController),
          ),
          Wrap(
            spacing: 8,
            children: widget.item[widget.index].sources
                .map(
                  (e) => Chip(
                    label: Text(
                      e.file,
                    ),
                  ),
                )
                .toList(),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16.0),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                      onTap: () => Navigator.pop(context),
                      child: Icon(Icons.arrow_back, color: Colors.white)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
