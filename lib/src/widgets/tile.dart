import 'package:flutter/material.dart';
import 'package:snake_zen/src/models/game_state.dart';

class Tile extends StatelessWidget {
  final Offset position;
  final Color color;
  final bool isCircle;

  const Tile({
    super.key,
    required this.position,
    required this.color,
    this.isCircle = false,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: position.dx * GameState.tileSize,
      top: position.dy * GameState.tileSize,
      child: Container(
        width: GameState.tileSize.toDouble(),
        height: GameState.tileSize.toDouble(),
        decoration: BoxDecoration(
          color: color,
          shape: isCircle ? BoxShape.circle : BoxShape.rectangle,
        ),
      ),
    );
  }
}
