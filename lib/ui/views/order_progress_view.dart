import 'package:flutter/material.dart';
import 'package:little_drops/constants/assets.dart';
import 'package:little_drops/constants/route_names.dart';
import 'package:little_drops/ui/shared/app_colors.dart';
import 'package:little_drops/ui/shared/shared_styles.dart';
import 'package:little_drops/ui/shared/ui_helpers.dart';
import 'package:little_drops/ui/widgets/busy_button.dart';

class OrderProgressView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors().background,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors().background,
        leading: IconButton(
          onPressed: () =>
              Navigator.pushReplacementNamed(context, HomeViewRoute),
          icon: Icon(
            Icons.arrow_back,
            color: AppColors().primaryColor,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                width: screenWidth(context) - 70,
                child: Text("Please input your card details.", style: header),
              ),
              verticalSpace(10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  "Yaaaay! We have successfully received and confirmed payment for your order. See below for your order status.",
                  style: subTitle,
                ),
              ),
              verticalSpace(30),
              Container(
                padding: const EdgeInsets.all(20.0),
                width: screenWidth(context),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: AppColors().borderColor, width: 1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Container(
                          height: 44,
                          width: 44,
                          child: Image.asset(AppAsset.orderBan),
                        ),
                        horizontalSpaceMedium,
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "Order Status",
                                style: amountBoldStyle.copyWith(
                                    fontWeight: FontWeight.w600),
                              ),
                              Text(
                                "Pickup agent is on his way",
                                style: amountBoldStyle.copyWith(
                                    fontWeight: FontWeight.normal),
                              ),
                            ],
                          ),
                        ),
                        Icon(Icons.keyboard_arrow_up)
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20.0),
                      child: Divider(
                        thickness: 1,
                        height: 1,
                        color: Color.fromRGBO(198, 198, 198, 0.7),
                      ),
                    ),
                    ProgressIndicator(
                      title: "Order Placed",
                      description: "We have received your payment! ",
                      active: true,
                    ),
                    verticalSpace(10),
                    ProgressIndicator(
                      title: "Pickup Agent on his way",
                      description: "Your clothes have been picked up! ",
                      active: false,
                    ),
                    verticalSpace(10),
                    ProgressIndicator(
                      title: "Clothes Picked",
                      description: "our clothes have been picked up! ",
                      active: false,
                    ),
                    verticalSpace(10),
                    ProgressIndicator(
                      title: "Washing Clothes",
                      description: "Your clothes are being tushed up! ",
                      active: false,
                    ),
                    verticalSpace(10),
                    ProgressIndicator(
                      title: "Packed Clothes",
                      description:
                          "Your clothes have been cleaned up and packed in a sweet way! ",
                      active: false,
                    ),
                    verticalSpace(10),
                    ProgressIndicator(
                      title: "Delivery agent is on his way!",
                      description:
                          "We’ve done all you’ve asked for. Your clothes are coming!",
                      active: false,
                      isLast: true,
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20),
                child: BusyButton(
                    title: "Done",
                    onPressed: () =>
                        Navigator.pushReplacementNamed(context, HomeViewRoute)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProgressIndicator extends StatelessWidget {
  const ProgressIndicator({
    @required this.title,
    @required this.description,
    @required this.active,
    this.isLast = false,
  });
  final String title, description;
  final bool active, isLast;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Column(
          children: <Widget>[
            Container(
              width: 25,
              height: 25,
              decoration: BoxDecoration(
                image: active
                    ? DecorationImage(image: AssetImage(AppAsset().orderCheck))
                    : null,
                border: Border.all(color: AppColors().primaryColor, width: 0.7),
                borderRadius: BorderRadius.circular(100),
              ),
            ),
            !isLast
                ? Column(
                    children: <Widget>[
                      verticalSpace(10),
                      CircleAvatar(
                        radius: 3,
                        backgroundColor: AppColors()
                            .primaryColor
                            .withOpacity(active ? 1 : 0.5),
                      ),
                      verticalSpace(10),
                      CircleAvatar(
                        radius: 3,
                        backgroundColor: AppColors()
                            .primaryColor
                            .withOpacity(active ? 1 : 0.5),
                      ),
                      verticalSpace(10),
                      CircleAvatar(
                        radius: 3,
                        backgroundColor: AppColors()
                            .primaryColor
                            .withOpacity(active ? 1 : 0.5),
                      ),
                    ],
                  )
                : SizedBox(),
          ],
        ),
        horizontalSpaceMedium,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              title,
              style: progressOrder.copyWith(
                  fontWeight: FontWeight.w500,
                  color: active
                      ? AppColors.orderTextColor
                      : AppColors.orderTextColor.withOpacity(0.5)),
            ),
            Text(
              description,
              style: progressOrder.copyWith(
                  fontSize: 10,
                  color: active
                      ? AppColors.orderTextColor
                      : AppColors.orderTextColor.withOpacity(0.5)),
            ),
          ],
        )
      ],
    );
  }
}
