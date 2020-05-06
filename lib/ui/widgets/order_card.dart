import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:little_drops/ui/shared/app_colors.dart';
import 'package:little_drops/ui/shared/ui_helpers.dart';
import 'package:little_drops/constants/assets.dart';

class OrderCards extends StatelessWidget {
  final String orderNumber;
  final bool active;

  const OrderCards({this.orderNumber, this.active = true});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0, bottom: 4),
      child: Container(
        height: 152,
        padding: EdgeInsets.all(20),
        width: screenWidth(context) - 40,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            width: 0.5,
            color: Color(0xffcccccc),
          ),
          borderRadius: BorderRadius.circular(7),
        ),
        child: Column(
          children: <Widget>[
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Image.asset(AppAsset().orderCheck),
                  horizontalSpaceSmall,
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        active
                            ? ' Your clothes are being tushed up'
                            : 'Clothes Delivered',
                        style: GoogleFonts.lato(
                          textStyle: TextStyle(
                              color: AppColors().textColor, fontSize: 16),
                        ),
                      ),
                      verticalSpace(10),
                      Container(
                        width: 198,
                        child: Text(
                          "Your order was placed on 13th May, 2020 by 4pm.",
                          style: GoogleFonts.lato(
                            textStyle: TextStyle(
                                color: AppColors().secTextcolor, fontSize: 12),
                          ),
                        ),
                      ),
                      verticalSpace(10),
                      Row(
                        children: <Widget>[
                          Text(
                            "Order Number:  ",
                            style: GoogleFonts.lato(
                              textStyle: TextStyle(
                                color: AppColors().secTextcolor,
                                fontSize: 14,
                              ),
                            ),
                          ),
                          Text(
                            "ORD1320",
                            style: GoogleFonts.lato(
                              textStyle: TextStyle(
                                  color: AppColors().secTextcolor,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text(
                  "See more   ",
                  style: GoogleFonts.lato(
                    textStyle: TextStyle(
                        color: AppColors().primaryColor,
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Icon(
                  Icons.keyboard_arrow_right,
                  color: AppColors().primaryColor,
                  size: 20,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
