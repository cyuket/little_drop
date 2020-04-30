import 'package:little_drops/constants/route_names.dart';
import 'package:flutter/material.dart';
import 'package:little_drops/ui/views/onboarding.dart';
import 'package:little_drops/ui/views/sign_up.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case OnboardingRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: Onboarding(),
      );

    // case LoginViewRoute:
    //   return _getPageRoute(
    //     routeName: settings.name,
    //     viewToShow: LoginView(),
    //   );
    case SignUpViewRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: SignUpView(),
      );
    // case HomeViewRoute:
    //   return _getPageRoute(
    //     routeName: settings.name,
    //     viewToShow: HomeContainer(
    //       child: StoresView(),
    //     ),
    //   );
    // case StoreViewRoute:
    //   return _getPageRoute(
    //     routeName: settings.name,
    //     viewToShow: HomeContainer(
    //       child: StoreView(),
    //     ),
    //   );

    // case StartUpViewRoute:
    //   return _getPageRoute(
    //     routeName: settings.name,
    //     viewToShow: StartUpView(),
    //   );
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
