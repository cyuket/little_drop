import 'package:little_drops/constants/route_names.dart';
import 'package:little_drops/locator.dart';
import 'package:little_drops/services/authentication_service.dart';
import 'package:little_drops/services/dialog_service.dart';
import 'package:little_drops/services/navigation_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'base_model.dart';

class SignUpViewModel extends BaseModel {
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();
  final DialogService _dialogService = locator<DialogService>();
  final NavigationService _navigationService = locator<NavigationService>();

  String _selectedRole = 'Select a User Role';
  String get selectedRole => _selectedRole;

  void setSelectedRole(dynamic role) {
    _selectedRole = role;
    notifyListeners();
  }

  Future signUp(
      {@required String email,
      @required String password,
      @required String fullName,
      @required String phoneNumber}) async {
    setBusy(true);

    if (email.isEmpty) {
      await _dialogService.showDialog(
        title: 'Login Failure',
        description: 'Email Field is required',
        cancelTitle: "Cancel",
      );
      setBusy(false);
      return;
    }
    if (password.isEmpty) {
      await _dialogService.showDialog(
        title: 'Login Failure',
        description: 'Password Field is required',
        cancelTitle: "Cancel",
      );
      setBusy(false);
      return;
    }
    if (fullName.isEmpty) {
      await _dialogService.showDialog(
        title: 'Login Failure',
        description: 'Name  Field is required',
        cancelTitle: "Cancel",
      );
      setBusy(false);
      return;
    }
    if (email.isEmpty) {
      await _dialogService.showDialog(
        title: 'Login Failure',
        description: 'Phone Number Field is required',
        cancelTitle: "Cancel",
      );
      setBusy(false);
      return;
    }
    var result = await _authenticationService.signUpWithEmail(
        email: email,
        password: password,
        fullName: fullName,
        phoneNumber: phoneNumber);

    setBusy(false);

    if (result is bool) {
      if (result) {
        await _dialogService.showDialog(
          title: '',
          description: '',
        );
      } else {
        await _dialogService.showDialog(
          title: 'Sign Up Failure',
          description: 'General sign up failure. Please try again later',
          cancelTitle: "Cancel",
        );
      }
    } else {
      await _dialogService.showDialog(
        title: 'Sign Up Failure',
        description: result,
        cancelTitle: "Cancel",
      );
    }
  }
}
