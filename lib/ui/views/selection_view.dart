import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:little_drops/constants/assets.dart';
import 'package:little_drops/ui/shared/app_colors.dart';
import 'package:little_drops/ui/shared/ui_helpers.dart';
import 'package:little_drops/ui/shared/shared_styles.dart';
import 'package:little_drops/ui/widgets/busy_button.dart';
import 'package:little_drops/ui/shared/screen_util.dart';
import 'package:little_drops/ui/widgets/input_field.dart';

class SelectionView extends StatefulWidget {
  final String title;
  SelectionView({this.title});
  @override
  _SelectionViewState createState() => _SelectionViewState();
}

class _SelectionViewState extends State<SelectionView> {
  final message = TextEditingController();
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 414, height: 896, allowFontScaling: true);

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
        child: SingleChildScrollView(
          child: SafeArea(
            child: Container(
              height: screenHeight(context) - 100,
              child: Column(
                children: <Widget>[
                  Container(
                    color: Colors.white,
                    width: screenWidth(context),
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(widget.title, style: titleTextStyle),
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
                        ItemWidget(
                            iconUrl: AppAsset().trouser, title: "Trouser"),
                        ItemWidget(iconUrl: AppAsset().shoe, title: "Shoe"),
                        ItemWidget(
                            iconUrl: AppAsset().blanket, title: "Blanket"),
                        ItemWidget(iconUrl: AppAsset().suit, title: "Suit"),
                        ItemWidget(iconUrl: AppAsset().jacket, title: "Jacket"),
                      ],
                    ),
                  ),
                  verticalSpace(10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Items",
                          style: GoogleFonts.lato(
                            color: AppColors().textColor.withOpacity(0.6),
                            fontSize: 14,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 20.0),
                          child: Text(
                            "Quanty",
                            style: GoogleFonts.lato(
                              color: AppColors().textColor.withOpacity(0.6),
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  verticalSpace(20),
                  Expanded(
                    child: ListView(
                      children: <Widget>[
                        SelectedItem(),
                        SelectedItem(),
                        SelectedItem(),
                        SelectedItem(),
                        SelectedItem(),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, top: 20),
                    child: InputField(
                      controller: message,
                      label: "Extra Note",
                      placeholder:
                          "Kindly tell us if there’s anything you want us to look out for on your clothes. ",
                      textInputType: TextInputType.multiline,
                      smallVersion: true,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: BusyButton(title: "Add to basket", onPressed: null),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class SelectedItem extends StatelessWidget {
  const SelectedItem({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Shirt",
                    style: GoogleFonts.lato(
                      color: AppColors().textColor,
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    "₦100 per shirt",
                    style: GoogleFonts.lato(
                      color: AppColors().textColor.withOpacity(0.6),
                      fontSize: 12,
                    ),
                  )
                ],
              ),
              Row(
                children: <Widget>[
                  Container(
                    height: 24,
                    width: 23,
                    decoration: BoxDecoration(
                        border: Border.all(color: AppColors().primaryColor),
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.white),
                    child: Center(
                      child: Icon(
                        Icons.add,
                        color: AppColors().primaryColor,
                        size: 14,
                      ),
                    ),
                  ),
                  horizontalSpaceSmall,
                  Text("4"),
                  horizontalSpaceSmall,
                  Container(
                    height: 24,
                    width: 23,
                    decoration: BoxDecoration(
                        border: Border.all(color: AppColors().primaryColor),
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.white),
                    child: Center(
                      child: Icon(
                        Icons.add,
                        color: AppColors().primaryColor,
                        size: 14,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: Divider(
              thickness: 1,
              height: 1,
              color: Color.fromRGBO(198, 198, 198, 0.7),
            ),
          )
        ],
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
