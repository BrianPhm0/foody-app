import 'package:flutter_bloc/flutter_bloc.dart';

enum AppThemeState { light, dark }

class ThemeCubit extends Cubit<AppThemeState> {
  ThemeCubit() : super(AppThemeState.light);

  void toggleTheme() {
    if (state == AppThemeState.light) {
      emit(AppThemeState.dark);
    } else {
      emit(AppThemeState.light);
    }
  }
}
