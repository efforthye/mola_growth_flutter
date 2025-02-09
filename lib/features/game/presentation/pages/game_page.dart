import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mola_growth_flutter/features/game/presentation/widgets/game_content.dart';
import 'package:provider/provider.dart';
import '../providers/game_provider.dart';
import '../widgets/game_overlay.dart';

class GamePage extends StatelessWidget {
  const GamePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<GameProvider>(
        builder: (context, gameProvider, child) {
          if (gameProvider.isGameOver) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Game Over'),
                  ElevatedButton(
                    onPressed: () {
                      gameProvider.resetGame();
                      context.go('/prologue');
                    },
                    child: const Text('Restart from Prologue'),
                  ),
                ],
              ),
            );
          }

          return Stack(
            children: [
              // 실제 게임 화면
              const GameContent(),
              // 게임 UI 오버레이 (체력바, 스코어 등)
              const GameOverlay(),
            ],
          );
        },
      ),
    );
  }
}