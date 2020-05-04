import 'package:flutter/material.dart';
import 'package:little_drops/constants/assets.dart';

import 'package:little_drops/ui/shared/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:little_drops/ui/shared/ui_helpers.dart';

class CustomModal extends StatelessWidget {
  final String message, buttonText;
  final Function onTap;
  CustomModal({this.buttonText, this.message, this.onTap});
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
      child: Container(
        width: 228,
        height: 207,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(AppAsset().success),
              verticalSpace(20),
              Text(
                message,
                textAlign: TextAlign.center,
                style: GoogleFonts.lato(
                  textStyle:
                      TextStyle(color: AppColors().textColor, fontSize: 12),
                ),
              ),
              verticalSpace(40),
              InkWell(
                onTap: onTap,
                child: Text(
                  buttonText,
                  style: GoogleFonts.lato(
                    textStyle: TextStyle(
                        fontSize: 14,
                        color: AppColors().primaryColor,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
