import 'package:flutter/material.dart';
import 'package:little_drops/ui/shared/app_colors.dart';
import 'package:little_drops/ui/shared/shared_styles.dart';
import 'package:little_drops/ui/shared/ui_helpers.dart';

class AccountView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors().background,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "Account",
          style: header,
        ),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            verticalSpace(20),
            Container(
              width: screenWidth(context),
              height: 151,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7), color: Colors.white),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  CircleAvatar(
                    radius: 50,
                  ),
                  horizontalSpaceSmall,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        verticalSpace(10),
                        Text(
                          "Michelle Adaeze",
                          style: accountStyle,
                        ),
                        verticalSpace(10),
                        Text(
                          "09020221898",
                          style: accountStyle,
                        ),
                        verticalSpace(10),
                        Text(
                          "Michelleadaeze@gmail.com",
                          style: accountStyle,
                        ),
                        verticalSpace(10),
                      ],
                    ),
                  ),
                  IconButton(
                      icon: Icon(
                        Icons.edit,
                        color: AppColors().primaryColor,
                      ),
                      onPressed: null)
                ],
              ),
            ),
            AccountItems(
              icon: Icons.location_on,
              title: "Address",
            ),
            AccountItems(
              icon: Icons.credit_card,
              title: "Cards and payment",
            ),
            AccountItems(
              icon: Icons.settings_applications,
              title: "Settings",
            ),
            AccountItems(
              icon: Icons.power_settings_new,
              title: "Logout",
            ),
          ],
        ),
      ),
    );
  }
}

class AccountItems extends StatelessWidget {
  final IconData icon;
  final String title;
  const AccountItems({Key key, @required this.title, @required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: ExpansionTile(
        leading: Icon(icon),
        title: Text(
          title,
          style: accountStyle,
        ),
        trailing: Icon(
          Icons.keyboard_arrow_down,
          color: AppColors().primaryColor,
        ),
      ),
    );
  }
}
