import 'package:go_router/go_router.dart';
import '../../features/prologue/presentation/pages/prologue_page.dart';
import '../../features/game/presentation/pages/game_page.dart';

final appRouter = GoRouter(
  initialLocation: '/prologue',
  routes: [
    GoRoute(
      path: '/prologue',
      builder: (context, state) => const ProloguePage(),
    ),
    GoRoute(
      path: '/game',
      builder: (context, state) => const GamePage(),
    ),
  ],
);