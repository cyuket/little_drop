import 'package:flutter/material.dart';
import 'ui/views/startup_view.dart';
import 'locator.dart';
import 'services/navigation_service.dart';
import 'services/dialog_service.dart';
import 'managers/dialog_manager.dart';
import 'ui/router.dart';
import 'constants/route_names.dart';

void main() {
  setupLocator();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Your Laundry App',
      debugShowCheckedModeBanner: false,
      builder: (context, child) => Navigator(
        key: locator<DialogService>().dialogNavigationKey,
        onGenerateRoute: (settings) => MaterialPageRoute(
            builder: (context) => DialogManager(child: child)),
      ),
      navigatorKey: locator<NavigationService>().navigationKey,
      theme: ThemeData(
        primaryColor: Color(0xffFF3471),
        backgroundColor: Color.fromARGB(255, 26, 27, 30),
        textTheme: Theme.of(context).textTheme.apply(
              fontFamily: 'Open Sans',
            ),
      ),
      home: StartUpView(),
      initialRoute: StartUpViewRoute,
      onGenerateRoute: generateRoute,
    );
  }
}
