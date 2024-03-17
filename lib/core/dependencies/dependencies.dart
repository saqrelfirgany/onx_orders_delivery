import 'package:get_it/get_it.dart';

import '../../features/a_home/home_screen/home_cubit.dart';
import '../../repositories/auth_repo.dart';
import '../../repositories/home_repo.dart';
import '../../repositories/initial_repo.dart';
import '../controllers/language_cubit.dart';

final serviceLocator = GetIt.instance;

Future<void> setup() async {
  serviceLocator.registerLazySingleton<AuthRepository>(
    () => AuthRepository(),
  );
  serviceLocator.registerLazySingleton<InitialRepository>(
    () => InitialRepository(),
  );
  serviceLocator.registerLazySingleton<HomeRepository>(
    () => HomeRepository(),
  );

  // serviceLocator.registerFactory<LanguageCubit>(() => LanguageCubit());

  serviceLocator.registerFactory<HomeCubit>(() => HomeCubit());
  serviceLocator.registerFactory<LanguageCubit>(() => LanguageCubit());
}
