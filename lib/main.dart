import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hitomi/providers/settings.dart';
import 'package:hitomi/routes/home.dart';
import 'package:hitomi/utils/color_scheme.dart';
import 'package:hitomi/widgets/guards/app_lock_guard.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Settings.init();

  runApp(ChangeNotifierProvider(
    create: (_) => Settings(),
    child: MainApp(),
  ));
}

class MainApp extends StatelessWidget {
  MainApp({super.key});

  final _navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return DynamicColorBuilder(builder: (_, darkScheme) {
      final sysyemUiOverlayStyle = SystemUiOverlayStyle.dark.copyWith(
        systemNavigationBarColor: (darkScheme ?? defaultColorScheme).background,
      );

      return MaterialApp(
        title: 'Hitomi',
        darkTheme: ThemeData(
          useMaterial3: true,
          colorScheme: darkScheme ?? defaultColorScheme,
        ),
        themeMode: ThemeMode.dark,
        home: const Home(),
        navigatorKey: _navigatorKey,
        builder: (context, child) => MediaQuery(
          data: MediaQueryData.fromView(View.of(context))
              .copyWith(textScaleFactor: 1),
          child: AnnotatedRegion(
            value: sysyemUiOverlayStyle,
            child: AppLockGuard(
              navigatorKey: _navigatorKey,
              child: child,
            ),
          ),
        ),
        debugShowCheckedModeBanner: false,
      );
    });
  }
}
