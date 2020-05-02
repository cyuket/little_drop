import 'package:flutter/material.dart';
import 'package:little_drops/constants/assets.dart';
import 'package:little_drops/constants/route_names.dart';
import 'package:little_drops/ui/shared/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:little_drops/ui/widgets/busy_button.dart';

class SplitView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors().background,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset(AppAsset().logo),
            SizedBox(
              height: 40,
            ),
            Text(
              'Welcome to Laundrify',
              style: GoogleFonts.lato(
                textStyle: TextStyle(
                  color: AppColors().textColor,
                  fontSize: 18,
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            BusyButton(
              title: 'Sign Up',
              onPressed: () {
                Navigator.pushNamed(context, SignUpViewRoute);
              },
            ),
            SizedBox(
              height: 20,
            ),
            BusyButton(
              title: 'Login',
              onPressed: () {
                Navigator.pushNamed(context, LoginViewRoute);
              },
              outline: true,
            )
          ],
        ),
      ),
    );
  }
}
