import 'package:confession_flutter/data/app_database.dart';
import 'package:confession_flutter/prefs.dart';
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
  Provider(
    create: (_) => AppDatabase(),
    lazy: false,
  ),
  ChangeNotifierProvider(
    create: (_) => PrefsNotifier(),
  )
];

//providers that need a dependency already instantiated above
List<SingleChildWidget> dependentServices = [];

//providers that need to be directly  available to every UI view without the need for a viewModel
List<SingleChildWidget> uiConsumableProviders = [];
