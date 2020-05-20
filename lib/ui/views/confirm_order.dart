import 'package:flutter/material.dart';
import 'package:little_drops/constants/route_names.dart';
import 'package:little_drops/ui/shared/app_colors.dart';
import 'package:little_drops/ui/shared/shared_styles.dart';
import 'package:little_drops/ui/shared/ui_helpers.dart';
import 'package:little_drops/ui/widgets/busy_button.dart';
import 'package:little_drops/ui/widgets/selected_item.dart';
import 'package:little_drops/ui/shared/screen_util.dart';
import 'package:little_drops/ui/widgets/total_widget.dart';
import 'package:little_drops/viewModel/selection_item_view_model.dart';
import 'package:provider_architecture/_viewmodel_provider.dart';
import 'package:google_fonts/google_fonts.dart';

class ConfirmOrder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 414, height: 896, allowFontScaling: true);

    return ViewModelProvider<ItemSelectionViewModel>.withConsumer(
        viewModelBuilder: () => ItemSelectionViewModel(),
        builder: (context, data, child) {
          double amount = 0;
          double delivery = 1000;
          for (var item in data.selectedItems) {
            amount = amount + item.totalPrice;
          }
          double total = amount + delivery;
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    width: screenWidth(context) - 70,
                    child: Text(
                        "Tell us how you’d like us to schedule your clothes ",
                        style: header),
                  ),
                  verticalSpace(20),
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
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        return SelectedItem(
                          item: data.selectedItems[index],
                          incrementQty: () {
                            data.incrementQty(data.selectedItems[index]);
                          },
                          decrementQty: () {
                            data.decrementQty(data.selectedItems[index]);
                          },
                          removeItem: () {
                            data.removeSelectedItem(data.selectedItems[index]);
                          },
                        );
                      },
                      itemCount: data.selectedItems.length,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        TotalWidget(amount: amount, title: "Laundry fee"),
                        verticalSpace(20),
                        TotalWidget(amount: delivery, title: "Delivery fee"),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20.0),
                          child: Divider(
                            thickness: 1,
                            height: 1,
                            color: Color.fromRGBO(198, 198, 198, 0.7),
                          ),
                        ),
                        TotalWidget(
                          amount: total,
                          title: "Total fee",
                          bold: true,
                          textStyle: amountBoldStyle,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20.0),
                          child: BusyButton(
                            title: "Comfirm",
                            onPressed: () => Navigator.pushNamed(
                                context, PaymentMethodRoute),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}
