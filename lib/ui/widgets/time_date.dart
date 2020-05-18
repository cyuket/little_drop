import 'package:flutter/material.dart';
import 'package:little_drops/ui/shared/shared_styles.dart';
import 'package:intl/intl.dart';
import 'package:little_drops/ui/shared/ui_helpers.dart';

class TimeAndDate extends StatelessWidget {
  const TimeAndDate({
    Key key,
    @required this.date,
    @required this.time,
    @required this.handleDate,
    @required this.handleTime,
  }) : super(key: key);

  final DateTime date;
  final TimeOfDay time;
  final Function handleTime, handleDate;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          InkWell(
            onTap: handleDate,
            child: Container(
              width: halfScreenWidth(context) - 30,
              height: 48,
              padding: EdgeInsets.only(left: 10, top: 15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(4),
                border: Border.all(color: Color(0xffcccccc), width: 1),
              ),
              child: Text(
                date == null ? "DD/MM/YYYY" : DateFormat.yMMMd().format(date),
                style: subTitle,
              ),
            ),
          ),
          InkWell(
            onTap: handleTime,
            child: Container(
              width: halfScreenWidth(context) - 30,
              height: 48,
              padding: EdgeInsets.only(left: 10, top: 15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(4),
                border: Border.all(color: Color(0xffcccccc), width: 1),
              ),
              child: Text(
                time == null ? "Time" : time.format(context),
                style: subTitle,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
