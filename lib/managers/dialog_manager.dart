import 'package:flutter/material.dart';
import 'package:little_drops/constants/route_names.dart';
import 'package:little_drops/locator.dart';
import 'package:little_drops/models/dialog_models.dart';
import 'package:little_drops/services/dialog_service.dart';
import 'package:little_drops/services/navigation_service.dart';
import 'package:little_drops/ui/widgets/modal.dart';

class DialogManager extends StatefulWidget {
  final Widget child;
  DialogManager({Key key, this.child}) : super(key: key);

  _DialogManagerState createState() => _DialogManagerState();
}

class _DialogManagerState extends State<DialogManager> {
  DialogService _dialogService = locator<DialogService>();
  final NavigationService _navigationService = locator<NavigationService>();

  @override
  void initState() {
    super.initState();
    _dialogService.registerDialogListener(_showDialog);
    _dialogService.registerSuccess(_showSignupDialog);
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }

  void _showSignupDialog(DialogRequest request) {
    // var isConfirmationDialog = request.cancelTitle != null;

    showDialog(
      context: context,
      builder: (BuildContext diaLogcontext) => CustomModal(
        message: "Yo! Yo!! Yo!!! You’ve successfully signed in!!! ",
        buttonText: "Continue",
        onTap: () {
          _dialogService.dialogComplete(DialogResponse(confirmed: true));
          _navigationService.navigateTo(ReminderViewRoute);
        },
      ),
    );
  }

  void _showDialog(DialogRequest request) {
    var isConfirmationDialog = request.cancelTitle != null;
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(request.title),
        content: Text(request.description),
        actions: <Widget>[
          (isConfirmationDialog)
              ? FlatButton(
                  child: Text(request.cancelTitle),
                  onPressed: () {
                    _dialogService
                        .dialogComplete(DialogResponse(confirmed: false));
                  },
                )
              : null,
          FlatButton(
            child: Text(request.buttonTitle),
            onPressed: () {
              _dialogService.dialogComplete(DialogResponse(confirmed: true));
            },
          ),
        ],
      ),
    );
  }
}
