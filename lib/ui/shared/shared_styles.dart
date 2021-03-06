import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

// Box Decorations

BoxDecoration fieldDecoration = BoxDecoration(
    borderRadius: BorderRadius.circular(5),
    color: Colors.transparent,
    border: Border.all(color: AppColors().primaryColor, width: 1));

BoxDecoration disabledFieldDecortaion = BoxDecoration(
    borderRadius: BorderRadius.circular(5),
    color: Colors.transparent,
    border: Border.all(color: AppColors().primaryColor, width: 1));

BoxDecoration buttonDecoration = BoxDecoration(
    border: Border.all(
      color: AppColors().background,
      width: 2,
    ),
    borderRadius: BorderRadius.circular(26));
// Field Variables

const double fieldHeight = 55;
const double smallFieldHeight = 40;
const double inputFieldBottomMargin = 30;
const double inputFieldSmallBottomMargin = 0;
const EdgeInsets fieldPadding = const EdgeInsets.symmetric(horizontal: 15);
const EdgeInsets largeFieldPadding =
    const EdgeInsets.symmetric(horizontal: 15, vertical: 15);

// Text Variables
final TextStyle buttonTitleTextStyle =
    TextStyle(fontWeight: FontWeight.w500, fontSize: 20, color: Colors.white);
final TextStyle buttonTitleTextStyleBlack = TextStyle(
  fontWeight: FontWeight.w500,
  fontSize: 20,
  color: AppColors().textColor,
);
final TextStyle mediumTextStyle =
    TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white);
const TextStyle regularTextStyle = TextStyle(fontSize: 11, color: Colors.white);
final TextStyle regularTextStyleBlack = GoogleFonts.roboto(
  textStyle: TextStyle(
      fontSize: 11, color: AppColors().textColor, fontWeight: FontWeight.w700),
);

final TextStyle textStyle =
    GoogleFonts.lato(textStyle: TextStyle(fontSize: 20));
final TextStyle header = GoogleFonts.lato(
  textStyle: TextStyle(
      fontSize: 20, color: AppColors().textColor, fontWeight: FontWeight.w500),
);
final TextStyle accountStyle = GoogleFonts.lato(
  color: AppColors().textColor.withOpacity(0.6),
  fontSize: 16,
);
final TextStyle reqular = GoogleFonts.lato(
  color: AppColors().textColor,
  fontSize: 16,
);
final TextStyle mapStyle = GoogleFonts.lato(
  color: AppColors().textColor,
  fontSize: 14,
);
final TextStyle amountStyle = GoogleFonts.lato(
  color: AppColors().textColor.withOpacity(0.6),
  fontSize: 14,
);
final TextStyle amountBoldStyle = GoogleFonts.lato(
  color: AppColors().textColor,
  fontWeight: FontWeight.bold,
  fontSize: 14,
);

final TextStyle titleTextStyle = GoogleFonts.lato(
  textStyle: TextStyle(fontSize: 24, color: AppColors().textColor),
);
final TextStyle progressOrder = GoogleFonts.lato(
  textStyle: TextStyle(
    fontSize: 12,
    color: AppColors.orderTextColor,
  ),
);
final TextStyle subTitle = GoogleFonts.lato(
  textStyle: TextStyle(
    fontSize: 16,
    color: AppColors().textColor.withOpacity(0.6),
  ),
);
