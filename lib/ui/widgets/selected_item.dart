import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:little_drops/models/item_model.dart';
import 'package:little_drops/ui/shared/app_colors.dart';
import 'package:little_drops/ui/shared/ui_helpers.dart';
import 'package:intl/intl.dart';

class SelectedItem extends StatelessWidget {
  final ItemModel item;
  final Function incrementQty, decrementQty, removeItem;
  const SelectedItem({
    @required this.item,
    @required this.decrementQty,
    @required this.incrementQty,
    @required this.removeItem,
  });

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
                    item.title,
                    style: GoogleFonts.lato(
                      color: AppColors().textColor,
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    "{${NumberFormat.currency(locale: "en_US", symbol: "₦").format(item.pricePerItem)} per ${item.title}",
                    style: GoogleFonts.lato(
                      color: AppColors().textColor.withOpacity(0.6),
                      fontSize: 12,
                    ),
                  )
                ],
              ),
              Text(
                "${NumberFormat.currency(locale: "en_US", symbol: "₦").format(item.totalPrice)}",
                style: GoogleFonts.lato(
                  color: AppColors().textColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
              Row(
                children: <Widget>[
                  InkWell(
                    onTap: incrementQty,
                    child: Container(
                      height: 24,
                      width: 23,
                      decoration: BoxDecoration(
                          border: Border.all(color: AppColors().primaryColor),
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.white),
                      child: Center(
                        child: Text(
                          "+",
                          style: TextStyle(
                              color: AppColors().primaryColor,
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  horizontalSpaceSmall,
                  Text("${item.qnty}"),
                  horizontalSpaceSmall,
                  InkWell(
                    onTap: decrementQty,
                    child: Container(
                      height: 24,
                      width: 23,
                      decoration: BoxDecoration(
                          border: Border.all(color: AppColors().primaryColor),
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.white),
                      child: Center(
                        child: Text(
                          "-",
                          style: TextStyle(
                              color: AppColors().primaryColor,
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  horizontalSpaceMedium,
                  InkWell(
                    onTap: removeItem,
                    child: Container(
                      height: 24,
                      width: 23,
                      child: Text(
                        'X',
                        style: TextStyle(
                            color: AppColors().primaryColor,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  )
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
