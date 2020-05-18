import 'package:flutter/material.dart';
import 'package:little_drops/constants/route_names.dart';
import 'package:little_drops/ui/shared/app_colors.dart';
import 'package:little_drops/ui/shared/shared_styles.dart';
import 'package:little_drops/ui/shared/ui_helpers.dart';
import 'package:little_drops/ui/widgets/busy_button.dart';
import 'package:little_drops/ui/widgets/input_field.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';

class CardAddingView extends StatelessWidget {
  final cardNumberController = TextEditingController();

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
              Container(
                width: screenWidth(context) - 70,
                child: Text("Please input your card details.", style: header),
              ),
              verticalSpace(10),
              Text(
                "This is a safe method of payment, if anything happens, we got you!",
                style: subTitle,
              ),
              verticalSpace(20),
              Expanded(
                child: Column(
                  children: <Widget>[
                    InputField(
                      controller: cardNumberController,
                      placeholder: "",
                      label: "Card Number",
                      formatter: [
                        CreditCardNumberInputFormatter(
                          onCardSystemSelected:
                              (CardSystemData cardSystemData) {
                            print(cardSystemData.system);
                          },
                          useSeparators: true,
                        )
                      ],
                    ),
                    verticalSpace(20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          width: halfScreenWidth(context) - 30,
                          child: InputField(
                            controller: cardNumberController,
                            placeholder: "MM/YY",
                            label: "Expiry Date",
                            formatter: [CreditCardExpirationDateFormatter()],
                          ),
                        ),
                        Container(
                          width: halfScreenWidth(context) - 30,
                          child: InputField(
                            controller: cardNumberController,
                            placeholder: "000",
                            label: "CVV",
                            formatter: [CreditCardCvcInputFormatter()],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: BusyButton(
                  title: "Proceed",
                  onPressed: () =>
                      Navigator.pushNamed(context, OrderSummaryRoute),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CardSystem {
  static const String VISA = 'Visa';
  static const String MASTERCARD = 'Mastercard';
  static const String JCB = 'JCB';
  static const String DISCOVER = 'Discover';
  static const String MAESTRO = 'Maestro';
  static const String AMERICAN_EXPRESS = 'Amex';
}
