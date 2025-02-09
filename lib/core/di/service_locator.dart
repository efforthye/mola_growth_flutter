import 'package:get_it/get_it.dart';
import 'package:mola_growth_flutter/features/game/repositories/game_repository.dart';
import '../../features/game/data/repositories/game_repository_impl.dart';

final sl = GetIt.instance;

void setupServiceLocator() {
  // Repositories
  sl.registerLazySingleton<GameRepository>(
        () => GameRepositoryImpl(),
  );
}
