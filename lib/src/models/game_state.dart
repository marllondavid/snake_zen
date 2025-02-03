import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';

class GameState extends ChangeNotifier {
  static const int gridSize = 20;
  static const int tileSize = 20;

  List<Offset> snake = [Offset(5, 5)];
  Offset food = Offset(2, 2);
  String direction = 'RIGHT';
  Timer? timer;
  int score = 0;
  bool isPlaying = false;

  void startGame() {
    if (isPlaying) return; // Evita reiniciar o jogo se já está em andamento

    isPlaying = true;
    timer = Timer.periodic(const Duration(milliseconds: 200), (Timer t) {
      updateSnake();
    });
    notifyListeners();
  }

  void pauseGame() {
    timer?.cancel();
    isPlaying = false;
    notifyListeners();
  }

  void restartGame() {
    timer?.cancel();
    snake = [Offset(5, 5)];
    direction = 'RIGHT';
    score = 0;
    isPlaying = false;
    placeFood();
    notifyListeners();
  }

  void updateSnake() {
    Offset newHead = snake.first;

    // Movimenta a cabeça da cobra na direção atual
    switch (direction) {
      case 'UP':
        newHead = Offset(newHead.dx, newHead.dy - 1);
        break;
      case 'DOWN':
        newHead = Offset(newHead.dx, newHead.dy + 1);
        break;
      case 'LEFT':
        newHead = Offset(newHead.dx - 1, newHead.dy);
        break;
      case 'RIGHT':
        newHead = Offset(newHead.dx + 1, newHead.dy);
        break;
    }

    // Reaparece a cobra no lado oposto se ultrapassar os limites
    if (newHead.dx < 0) {
      newHead = Offset(
          gridSize - 1, newHead.dy); // Saiu pela esquerda, reaparece à direita
    } else if (newHead.dx >= gridSize) {
      newHead =
          Offset(0, newHead.dy); // Saiu pela direita, reaparece à esquerda
    }

    if (newHead.dy < 0) {
      newHead =
          Offset(newHead.dx, gridSize - 1); // Saiu por cima, reaparece embaixo
    } else if (newHead.dy >= gridSize) {
      newHead = Offset(newHead.dx, 0); // Saiu por baixo, reaparece em cima
    }

    // Verifica colisão com o próprio corpo
    if (snake.contains(newHead)) {
      timer?.cancel();
      isPlaying = false;
      notifyListeners();
      return;
    }

    // Adiciona a nova posição da cabeça
    snake.insert(0, newHead);

    // Verifica se a cobra comeu a comida
    if (newHead == food) {
      placeFood();
      score += 2;
    } else {
      snake.removeLast(); // Remove o último segmento se não comeu
    }

    notifyListeners();
  }

  void placeFood() {
    final rand = Random();
    Offset newFood;
    do {
      newFood = Offset(
        rand.nextInt(gridSize).toDouble(),
        rand.nextInt(gridSize).toDouble(),
      );
    } while (snake.contains(newFood));
    food = newFood;
    notifyListeners();
  }

  void changeDirection(String newDirection) {
    if ((direction == 'UP' && newDirection == 'DOWN') ||
        (direction == 'DOWN' && newDirection == 'UP') ||
        (direction == 'LEFT' && newDirection == 'RIGHT') ||
        (direction == 'RIGHT' && newDirection == 'LEFT')) {
      return;
    }
    direction = newDirection;
    notifyListeners();
  }
}
