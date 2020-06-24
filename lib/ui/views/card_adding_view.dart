import 'package:credit_card_number_validator/credit_card_number_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:little_drops/constants/route_names.dart';
import 'package:little_drops/ui/shared/app_colors.dart';
import 'package:little_drops/ui/shared/shared_styles.dart';
import 'package:little_drops/ui/shared/ui_helpers.dart';
import 'package:little_drops/ui/widgets/busy_button.dart';
import 'package:little_drops/ui/widgets/input_field.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
import 'package:little_drops/viewModel/card_adding_view_model.dart';
import 'package:provider_architecture/_viewmodel_provider.dart';

class CardAddingView extends StatefulWidget {
  @override
  _CardAddingViewState createState() => _CardAddingViewState();
}

class _CardAddingViewState extends State<CardAddingView> {
  final cardNumberController = TextEditingController();

  final cardExpiryController = TextEditingController();

  final cardCvvController = TextEditingController();

  bool isValid = false;

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  void _showSnap(String message) {
    _scaffoldKey.currentState.showSnackBar(
      SnackBar(
        content: new Text(message),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<CardAddingViewModel>.withConsumer(
        viewModelBuilder: () => CardAddingViewModel(),
        builder: (context, data, child) {
          return Scaffold(
            key: _scaffoldKey,
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
            body: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        width: screenWidth(context) - 70,
                        child: Text("Please input your card details.",
                            style: header),
                      ),
                      verticalSpace(10),
                      Text(
                        "This is a safe method of payment, if anything happens, we got you!",
                        style: subTitle,
                      ),
                      verticalSpace(20),
                    ],
                  ),
                  Expanded(
                    child: ListView(
                      children: <Widget>[
                        InputField(
                          controller: cardNumberController,
                          placeholder: "",
                          label: "Card Number",
                          textInputType: TextInputType.number,
                          formatter: [
                            CreditCardNumberInputFormatter(
                              onCardSystemSelected:
                                  (CardSystemData cardSystemData) {
                                print(cardSystemData.system);

                                Map<String, dynamic> cardData =
                                    CreditCardValidator.getCard(
                                        cardNumberController.text);
                                setState(() {
                                  // Set Card Type and Validity
                                  isValid =
                                      cardData[CreditCardValidator.isValidCard];
                                  print(isValid);
                                });
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
                                controller: cardExpiryController,
                                textInputType: TextInputType.number,
                                placeholder: "MM/YY",
                                label: "Expiry Date",
                                formatter: [
                                  CreditCardExpirationDateFormatter()
                                ],
                              ),
                            ),
                            Container(
                              width: halfScreenWidth(context) - 30,
                              child: InputField(
                                controller: cardCvvController,
                                textInputType: TextInputType.number,
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
                        onPressed: () {
                          if (cardNumberController.text == "")
                            return _showSnap("Please Enter Card Number");
                          if (cardCvvController.text == "")
                            return _showSnap("Cvv Can't be empty");
                          if (cardExpiryController.text == "")
                            return _showSnap(
                                "Please Enter Expiry date of the card");
                          data.updateCardDetails(
                            number: cardNumberController.text,
                            date: cardExpiryController.text,
                            cvvNumber: cardCvvController.text,
                          );
                          Navigator.pushNamed(context, OrderSummaryRoute);
                        }),
                  )
                ],
              ),
            ),
          );
        });
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
