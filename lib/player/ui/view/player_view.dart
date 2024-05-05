import 'package:flutter/material.dart';
import 'package:tmbiz/player/player.dart';

class PlayerView extends StatelessWidget {
  const PlayerView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: PlayerContent(),
    );
  }
}
