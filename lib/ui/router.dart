import 'package:little_drops/constants/route_names.dart';
import 'package:flutter/material.dart';
import 'package:little_drops/ui/views/home_view.dart';
import 'package:little_drops/ui/views/onboarding.dart';
import 'package:little_drops/ui/views/sign_up.dart';
import 'package:little_drops/ui/views/login_view.dart';
import 'package:little_drops/ui/views/split_view.dart';
import 'package:little_drops/ui/views/reminder_view.dart';
import 'package:little_drops/ui/shared/home_container.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
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
    case SplitViewRoute:
      return _getPageRoute(routeName: settings.name, viewToShow: SplitView());
    case HomeViewRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: HomeContainer(),
      );

    case ReminderViewRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: ReminderView(),
      );
    // case ProductDetailRoute:
    //   return _getPageRoute(
    //     routeName: settings.name,
    //     viewToShow: ProductDetailPage(),
    //   );

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
