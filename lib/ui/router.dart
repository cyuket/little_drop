import 'package:little_drops/constants/route_names.dart';
import 'package:flutter/material.dart';

import 'package:little_drops/ui/views/onboarding.dart';
import 'package:little_drops/ui/views/pick_date_view.dart';
import 'package:little_drops/ui/views/pick_location_view.dart';
import 'package:little_drops/ui/views/sign_up.dart';
import 'package:little_drops/ui/views/login_view.dart';
import 'package:little_drops/ui/views/split_view.dart';
import 'package:little_drops/ui/views/reminder_view.dart';
import 'package:little_drops/ui/shared/home_container.dart';
import 'package:little_drops/ui/views/startup_view.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case StartUpViewRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: StartUpView(),
      );
    case OnboardingRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: Onboarding(),
      );

    case LoginViewRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: LoginView(),
      );
    case SignUpViewRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: SignUpView(),
      );
    case ReminderViewRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: ReminderView(),
      );

    case SplitViewRoute:
      return _getPageRoute(routeName: settings.name, viewToShow: SplitView());
    case HomeViewRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: HomeContainer(),
      );

    case PickUpLocationRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: PickUpLocation(),
      );
    case PickUpDateViewRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: PickDateView(),
      );

    default:
      return MaterialPageRoute(
          builder: (_) => Scaffold(
                body: Center(
                    child: Text('No route defined for ${settings.name}')),
              ));
  }
}

PageRoute _getPageRoute({String routeName, Widget viewToShow}) {
  return MaterialPageRoute(
      settings: RouteSettings(
        name: routeName,
      ),
      builder: (_) => viewToShow);
}
