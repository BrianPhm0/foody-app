import 'package:foody/features/presentation/blocs/cubit/theme_cubit.dart';
import 'package:get_it/get_it.dart';

final serviceLocator = GetIt.instance;
Future<void> initDependencies() async {
  serviceLocator.registerLazySingleton(() => ThemeCubit());
}
