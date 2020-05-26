import 'package:little_drops/constants/route_names.dart';
import 'package:little_drops/locator.dart';
import 'package:little_drops/services/authentication_service.dart';
import 'package:little_drops/services/dialog_service.dart';
import 'package:little_drops/services/navigation_service.dart';
import 'package:flutter/foundation.dart';

import 'base_model.dart';

class LoginViewModel extends BaseModel {
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();
  final DialogService _dialogService = locator<DialogService>();
  final NavigationService _navigationService = locator<NavigationService>();

  Future login({
    @required String email,
    @required String password,
  }) async {
    setBusy(true);

    // validation of email
    if (email.isEmpty) {
      await _dialogService.showDialog(
        title: 'Login Failure',
        description: 'Email Field is required',
        cancelTitle: "Cancel",
      );
      setBusy(false);
      return;
    }

    // validation for password
    if (password.isEmpty) {
      await _dialogService.showDialog(
        title: 'Login Failure',
        description: 'Password  Field is required',
        cancelTitle: "Cancel",
      );
      setBusy(false);
      return;
    }

    var result = await _authenticationService.loginWithEmail(
      email: email,
      password: password,
    );

    setBusy(false);

    if (result is bool) {
      if (result) {
        _navigationService.navigateTo(HomeViewRoute);
      } else {
        await _dialogService.showDialog(
            title: 'Login Failure',
            description: 'General login failure. Please try again later',
            cancelTitle: "Cancel");
      }
    } else {
      await _dialogService.showDialog(
        title: 'Login Failure',
        description: result,
        cancelTitle: "cancel",
      );
    }
  }

  void navigateToSignUp() {
    _navigationService.navigateTo(SignUpViewRoute);
  }
}
