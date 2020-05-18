import 'package:flutter/material.dart';
import 'package:little_drops/ui/shared/app_colors.dart';
import 'package:little_drops/ui/shared/shared_styles.dart';
import 'package:little_drops/ui/shared/ui_helpers.dart';
import 'package:little_drops/ui/widgets/busy_button.dart';
import 'package:little_drops/ui/widgets/total_widget.dart';

class OrderSummaryView extends StatelessWidget {
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
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                width: screenWidth(context) - 70,
                child: Text("This is a summary of your order ", style: header),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Text(
                  "Amount to pay",
                  style: amountBoldStyle,
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                color: Colors.white,
                child: Column(
                  children: <Widget>[
                    TotalWidget(amount: 1600, title: "Laundary fee"),
                    verticalSpace(20),
                    TotalWidget(amount: 1600, title: "Delivery fee"),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20.0),
                      child: Divider(
                        thickness: 1,
                        height: 1,
                        color: Color.fromRGBO(198, 198, 198, 0.7),
                      ),
                    ),
                    TotalWidget(
                      amount: 10000,
                      title: "Total fee",
                      bold: true,
                      textStyle: amountBoldStyle.copyWith(
                          color: AppColors().primaryColor),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Your Information",
                      style: amountBoldStyle,
                    ),
                    InkWell(
                      child: Text(
                        "Edit",
                        style: amountBoldStyle.copyWith(
                            color: AppColors().primaryColor),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                color: Colors.white,
                width: screenWidth(context),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Michelle Ada",
                      style: amountStyle,
                    ),
                    verticalSpace(10),
                    Text(
                      "Address",
                      style: amountStyle,
                    ),
                    verticalSpace(10),
                    Text(
                      "Phone Number",
                      style: amountStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Delivery Address",
                      style: amountBoldStyle,
                    ),
                    InkWell(
                      child: Text(
                        "Edit",
                        style: amountBoldStyle.copyWith(
                            color: AppColors().primaryColor),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                color: Colors.white,
                width: screenWidth(context),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Address",
                      style: amountStyle,
                    ),
                    verticalSpace(10),
                    Text(
                      "Time Of Pick",
                      style: amountStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Payment Method",
                      style: amountBoldStyle,
                    ),
                    InkWell(
                      child: Text(
                        "Edit",
                        style: amountBoldStyle.copyWith(
                            color: AppColors().primaryColor),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                color: Colors.white,
                width: screenWidth(context),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Debit Card",
                      style: amountStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20),
                child: BusyButton(
                  title: "Pay Now",
                  onPressed: null,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}