import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foody/core/common/router.dart';
import 'package:foody/core/theme/app_theme.dart';
import 'package:foody/features/presentation/blocs/cubit/theme_cubit.dart';
import 'package:foody/init_dependencies.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependencies();
  runApp(DevicePreview(
    enabled: true,
    tools: const [
      ...DevicePreview.defaultTools,
    ],
    builder: (context) => MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => serviceLocator<ThemeCubit>()),
      ],
      child: const MyWidget(),
    ),
  ));
}

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, AppThemeState>(
      builder: (context, themeState) {
        // Xác định themeData dựa trên trạng thái theme
        ThemeData themeData;
        if (themeState == AppThemeState.dark) {
          themeData = FoodAppTheme.darkTheme;
        } else {
          themeData = FoodAppTheme.lightTheme;
        }

        return AnimatedTheme(
          duration: const Duration(
              milliseconds: 300), // Thời gian hiệu ứng chuyển đổi
          data: themeData,
          child: MaterialApp.router(
            theme: themeData,
            debugShowCheckedModeBanner: false,
            routerConfig: AppRouter.router,
          ),
        );
      },
    );
  }
}
