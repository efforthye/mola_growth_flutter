import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mola_growth_flutter/features/prologue/widgets/prologue_content.dart';

class ProloguePage extends StatelessWidget {
  const ProloguePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const PrologueContent(),
          Positioned(
            bottom: 20,
            right: 20,
            child: ElevatedButton(
              onPressed: () => context.go('/game'),
              child: const Text('Skip Prologue'),
            ),
          ),
        ],
      ),
    );
  }
}