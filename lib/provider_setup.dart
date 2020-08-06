import 'package:confession_flutter/data/app_database.dart';
import 'package:confession_flutter/data/user.dart';
import 'package:confession_flutter/prefs.dart';
import 'package:confession_flutter/theme_prefs.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

//the order of instantiation matters
List<SingleChildWidget> providers = [
  ...independentServices,
  ...dependentServices,
  ...uiConsumableProviders
];

//providers that need no other dependencies injected
List<SingleChildWidget> independentServices = [
  Provider<AppDatabase>(
    create: (_) => AppDatabase(),
    lazy: false,
    dispose: (_, db) => db.close(),
  ),
  ChangeNotifierProvider<PrefsNotifier>(
    create: (_) => PrefsNotifier(),
  ),
  ChangeNotifierProvider<ThemeStyle>(
    create: (_) => ThemeStyle(),
  )
];

//providers that need a dependency already instantiated above
List<SingleChildWidget> dependentServices = [
  ProxyProvider<ThemeStyle, ThemeState>(
    update: (context, value, previous) => ThemeState(
      userThemeMode: value.userThemeMode,
    ),
  ),
  ProxyProvider<PrefsNotifier, PrefsState>(
    update: (context, value, previous) => PrefsState(user: value.user),
  )
];

//providers that need to be directly  available to every UI view without the need for a viewModel
List<SingleChildWidget> uiConsumableProviders = [
  Provider<User>(
    create: (context) => Provider.of<PrefsState>(context).user,
  )
];
