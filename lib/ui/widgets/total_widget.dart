import 'package:flutter/material.dart';
import 'package:little_drops/ui/shared/shared_styles.dart';
import 'package:intl/intl.dart';

class TotalWidget extends StatelessWidget {
  const TotalWidget({
    @required this.amount,
    @required this.title,
    this.bold = false,
    this.textStyle,
  });

  final double amount;
  final String title;
  final bool bold;
  final TextStyle textStyle;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          title,
          style: bold ? mapStyle : amountStyle,
        ),
        Text(
          "${NumberFormat.currency(locale: "en_US", symbol: "₦").format(amount)}",
          style: textStyle == null ? amountStyle : textStyle,
        ),
      ],
    );
  }
}
