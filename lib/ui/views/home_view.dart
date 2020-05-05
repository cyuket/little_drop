import 'package:flutter/material.dart';
import 'package:little_drops/constants/assets.dart';
import 'package:little_drops/ui/shared/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:little_drops/ui/shared/ui_helpers.dart';
import 'package:little_drops/ui/widgets/home_cards.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors().background,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Text(
          "Services",
          style: GoogleFonts.lato(
            textStyle: TextStyle(
                fontSize: 20,
                color: AppColors().textColor,
                fontWeight: FontWeight.w500),
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              color: Colors.white,
              width: screenWidth(context),
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Hello Michelle,',
                    style: GoogleFonts.lato(
                      textStyle:
                          TextStyle(fontSize: 24, color: AppColors().textColor),
                    ),
                  ),
                  verticalSpace(20),
                  Text(
                    'What would you like us to do for you today?',
                    style: GoogleFonts.lato(
                        textStyle: TextStyle(
                            fontSize: 16,
                            color: AppColors().textColor.withOpacity(0.6))),
                  ),
                  verticalSpace(20),
                ],
              ),
            ),
            verticalSpace(20),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: GridView.count(
                  crossAxisCount: 2,
                  padding: EdgeInsets.all(10.0),
                  childAspectRatio: 8.0 / 8.0,
                  mainAxisSpacing: 10.0,
                  crossAxisSpacing: 10.0,
                  children: <Widget>[
                    HomeCards(
                      iconImage: AppAsset().washingAndIron,
                      name: "Wash and Iron",
                    ),
                    HomeCards(
                      iconImage: AppAsset().ironing,
                      name: "Iron",
                    ),
                    HomeCards(
                      iconImage: AppAsset().washing,
                      name: "Wash",
                    ),
                    HomeCards(
                      iconImage: AppAsset().dryClean,
                      name: "Dry Clean",
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
