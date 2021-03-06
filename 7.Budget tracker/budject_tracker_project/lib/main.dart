import 'package:budject_tracker_project/screens/home.dart';
import 'package:budject_tracker_project/models/view_models/budget_view_model.dart';
import 'package:budject_tracker_project/services/local_storage_service.dart';
import 'package:budject_tracker_project/services/theme_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final localStorageService = LocalStorageService();
  await localStorageService.initializeHive();
  final sharedPreferences = await SharedPreferences.getInstance();
  return runApp(
    MyApp(
      sharedPreferences: sharedPreferences,
    ),
  );
}

class MyApp extends StatelessWidget {
  final SharedPreferences sharedPreferences;
  const MyApp({Key? key, required this.sharedPreferences}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeService>(
          create: (_) => ThemeService(sharedPreferences),
        ),
        ChangeNotifierProvider<BudgetViewModel>(
          create: (_) => BudgetViewModel(),
        )
      ],
      child: Builder(
        builder: (BuildContext context) {
          final themeService = Provider.of<ThemeService>(context);
          return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Flutter Demo',
              theme: ThemeData(
                // primarySwatch: Colors.red,
                colorScheme: ColorScheme.fromSeed(
                    brightness: themeService.darkTheme
                        ? Brightness.dark
                        : Brightness.light,
                    seedColor: Colors.indigo),
              ),
              home: Home());
        },
      ),
    );
  }
}
