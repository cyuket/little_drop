import 'package:flutter/material.dart';
import 'package:little_drops/constants/assets.dart';
import 'package:little_drops/ui/shared/app_colors.dart';
import 'package:little_drops/ui/shared/shared_styles.dart';
import 'package:little_drops/ui/shared/ui_helpers.dart';

class PaymentMethodView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors().background,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors().background,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back,
            color: AppColors().primaryColor,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              verticalSpace(20),
              Container(
                width: screenWidth(context) - 70,
                child:
                    Text(" Choose a convenient payment method", style: header),
              ),
              verticalSpace(40),
              PaymentCard(
                iconString: AppAsset().card,
                title: "Pay with card",
                onTap: null,
              ),
              PaymentCard(
                iconString: AppAsset().buy,
                title: "Pay on delivery",
                onTap: null,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PaymentCard extends StatelessWidget {
  const PaymentCard(
      {Key key,
      @required this.iconString,
      @required this.title,
      @required this.onTap})
      : super(key: key);
  final String title, iconString;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20.0),
        child: Container(
          width: screenWidth(context) - 40,
          height: 100,
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: Color(0xffcccccc),
              width: 1,
            ),
            borderRadius: BorderRadius.circular(7),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Container(
                    width: 40,
                    height: 40,
                    child: Image.asset(iconString),
                  ),
                  horizontalSpaceMedium,
                  Text(
                    title,
                    style: reqular,
                  ),
                ],
              ),
              Icon(
                Icons.arrow_forward_ios,
                size: 16,
                color: AppColors().secTextcolor,
              )
            ],
          ),
        ),
      ),
    );
  }
}
