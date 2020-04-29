import 'package:flutter/material.dart';
import 'package:little_drops/ui/shared/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class PageItem extends StatelessWidget {
  final illustration, text1, text2;
  const PageItem({this.illustration, this.text1, this.text2});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Image.asset(illustration),
        SizedBox(
          height: 30,
        ),
        Text(
          text1,
          style: GoogleFonts.lato(
              textStyle: TextStyle(
                  color: AppColors().textColor,
                  fontSize: 20,
                  fontWeight: FontWeight.w600)),
        ),
        SizedBox(
          height: 10,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 60.0),
          child: Text(text2,
              textAlign: TextAlign.center,
              style: GoogleFonts.lato(
                textStyle:
                    TextStyle(color: AppColors().textColor, fontSize: 16),
              )),
        ),
      ],
    );
  }
}
