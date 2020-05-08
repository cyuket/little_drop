import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:little_drops/constants/assets.dart';
import 'package:little_drops/ui/shared/app_colors.dart';
import 'package:little_drops/ui/shared/ui_helpers.dart';
import 'package:little_drops/ui/shared/shared_styles.dart';

class SelectionView extends StatefulWidget {
  final String title;
  SelectionView({this.title});
  @override
  _SelectionViewState createState() => _SelectionViewState();
}

class _SelectionViewState extends State<SelectionView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors().background,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.shopping_basket),
              onPressed: null,
            )
          ],
        ),
        leading: IconButton(
            onPressed: null,
            icon: Icon(
              Icons.arrow_back,
              color: AppColors().primaryColor,
            )),
        elevation: 0,
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Container(
              color: Colors.white,
              width: screenWidth(context),
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Dry Cleaning,', style: titleTextStyle),
                  verticalSpace(20),
                  Text(
                    'You can select from the different kinds of clothes you’d like us to wash for you.',
                    style: subTitle,
                  ),
                  verticalSpace(20),
                ],
              ),
            ),
            verticalSpace(20),
            Container(
              height: 59,
              width: screenWidth(context),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  ItemWidget(iconUrl: AppAsset().shirt, title: "Shirt"),
                  ItemWidget(iconUrl: AppAsset().trouser, title: "Trouser"),
                  ItemWidget(iconUrl: AppAsset().shoe, title: "Shoe"),
                  ItemWidget(iconUrl: AppAsset().blanket, title: "Blanket"),
                  ItemWidget(iconUrl: AppAsset().suit, title: "Suit"),
                  ItemWidget(iconUrl: AppAsset().jacket, title: "Jacket"),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ItemWidget extends StatelessWidget {
  final String iconUrl, title;
  const ItemWidget({
    @required this.title,
    @required this.iconUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(iconUrl),
          verticalSpace(5),
          Text(
            title,
            style: GoogleFonts.lato(
              textStyle: TextStyle(
                color: AppColors().textColor,
                fontSize: 10,
              ),
            ),
          )
        ],
      ),
    );
  }
}
