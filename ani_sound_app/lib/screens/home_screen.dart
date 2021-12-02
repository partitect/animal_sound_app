import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    final player = AudioCache();
    var animalList = [
      {"name": "inek"},
      {"name": "tavuk"},
      {"name": "maymun"},
      {"name": "koyun"},
      {"name": "kartal"},
      {"name": "yunus"},
      {"name": "serce"},
      {"name": "kopek"},
      {"name": "fil"},
      {"name": "at"},
    ];
    return Scaffold(
      body: SafeArea(
        child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemCount: animalList.length,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: () {
                  player.play(
                    '../assets/sound/${animalList[index]["name"]}.mp3',
                  );
                },
                child: Container(
                  child: Card(
                    color: Colors.greenAccent.withOpacity(.7),
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Center(
                            child: SvgPicture.asset(
                              'assets/svg/${animalList[index]["name"]}.svg',
                              width: width * .35,
                              height: width * .35,
                            ),
                          ),
                          Text(
                            animalList[index]["name"].toString().toUpperCase(),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w900,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
