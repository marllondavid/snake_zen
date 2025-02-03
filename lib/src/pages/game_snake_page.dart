import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:snake_zen/src/models/game_state.dart';
import 'package:snake_zen/src/utils/constants/colors_contants.dart';
import 'package:snake_zen/src/widgets/tile.dart';

class GameSnakePage extends StatelessWidget {
  const GameSnakePage({super.key});

  @override
  Widget build(BuildContext context) {
    final gameState = context.watch<GameState>();
    final isDarkMode = context.watch<ValueNotifier<bool>>().value;

    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Título e alternância de tema
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Snake Game',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      IconButton(
                        icon: Icon(
                          isDarkMode ? Icons.light_mode : Icons.dark_mode,
                          color: Colors.yellow,
                        ),
                        onPressed: () {
                          context.read<ValueNotifier<bool>>().value =
                              !isDarkMode;
                        },
                      ),
                    ],
                  ),
                ),

                // Tela do jogo
                Container(
                  width: 400,
                  height: 420,
                  decoration: BoxDecoration(
                    color:
                        isDarkMode ? Colors.blueGrey : ColorsContants.backgroud,
                    border: Border.all(color: Colors.blue),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Stack(
                    children: [
                      // Comida
                      Positioned(
                        left: gameState.food.dx * GameState.tileSize,
                        top: gameState.food.dy * GameState.tileSize,
                        child: Icon(
                          Icons.star,
                          color: Colors.black,
                          size: GameState.tileSize.toDouble(),
                        ),
                      ),
                      // Segmentos da cobra
                      ...gameState.snake.map(
                        (segment) => Tile(
                          position: segment,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 10),
                // Score, Best Score e Level
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildInfoBox('Score', gameState.score.toString()),
                    _buildInfoBox(
                        'Best', '100'), // Lógica do Best será ajustada depois
                    _buildInfoBox(
                        'Level', '1'), // Lógica do Level será ajustada depois
                  ],
                ),
                const SizedBox(height: 10),

                // Botão Play
                ElevatedButton(
                  onPressed: () {
                    if (gameState.isPlaying) {
                      gameState.pauseGame();
                    } else {
                      gameState.startGame();
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Text(
                    gameState.isPlaying ? 'Pause' : 'Play',
                    style: const TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),

                const SizedBox(height: 20),

                // Controles de direção
                _buildDirectionalControls(gameState),

                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDirectionalControls(GameState gameState) {
    return Container(
      width: 300,
      height: 200,
      decoration: BoxDecoration(
        color: Colors.grey[700],
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.black, width: 2),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          // Botão para cima
          ElevatedButton(
            onPressed: () => gameState.changeDirection('UP'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.yellow,
              shape: const CircleBorder(),
              padding: const EdgeInsets.all(20),
            ),
            child: const Text(
              'CIMA',
              style: TextStyle(color: Colors.black),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // Botão para esquerda
              ElevatedButton(
                onPressed: () => gameState.changeDirection('LEFT'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.yellow,
                  shape: const CircleBorder(),
                  padding: const EdgeInsets.all(20),
                ),
                child: const Text(
                  'ESQ',
                  style: TextStyle(color: Colors.black),
                ),
              ),
              // Espaço vazio no centro
              const SizedBox(width: 50),
              // Botão para direita
              ElevatedButton(
                onPressed: () => gameState.changeDirection('RIGHT'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.yellow,
                  shape: const CircleBorder(),
                  padding: const EdgeInsets.all(20),
                ),
                child: const Text(
                  'DIR',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ],
          ),
          // Botão para baixo
          ElevatedButton(
            onPressed: () => gameState.changeDirection('DOWN'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.yellow,
              shape: const CircleBorder(),
              padding: const EdgeInsets.all(20),
            ),
            child: const Text(
              'BAIXO',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoBox(String label, String value) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.grey[800],
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.white, width: 1),
      ),
      child: Column(
        children: [
          Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            value,
            style: const TextStyle(
              color: Colors.green,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
