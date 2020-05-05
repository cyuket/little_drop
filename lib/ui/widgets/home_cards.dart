import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:little_drops/ui/shared/app_colors.dart';
import 'package:little_drops/ui/shared/ui_helpers.dart';

class HomeCards extends StatelessWidget {
  const HomeCards(
      {@required this.iconImage, @required this.name, this.onPressed});

  final String iconImage, name;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: Colors.white,
      ),
      child: MaterialButton(
        onPressed: onPressed,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(iconImage),
            verticalSpace(30),
            Text(
              name,
              style: GoogleFonts.lato(
                textStyle:
                    TextStyle(color: AppColors().textColor, fontSize: 18),
              ),
            ),
            verticalSpace(5),
            Container(
              height: 2,
              width: 24,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2),
                  color: AppColors().primaryColor),
            )
          ],
        ),
      ),
    );
  }
}
