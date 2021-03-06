import 'package:flutter/material.dart';
import 'package:little_drops/constants/route_names.dart';
import 'package:little_drops/ui/shared/app_colors.dart';
import 'package:little_drops/ui/shared/shared_styles.dart';
import 'package:little_drops/ui/shared/ui_helpers.dart';
import 'package:little_drops/ui/widgets/busy_button.dart';
import 'package:little_drops/ui/widgets/time_date.dart';
import 'package:little_drops/viewModel/date_slection_view_model.dart';
import 'package:provider_architecture/_viewmodel_provider.dart';

class PickDateView extends StatefulWidget {
  @override
  _PickDateViewState createState() => _PickDateViewState();
}

class _PickDateViewState extends State<PickDateView> {
  DateTime pickUpDate;
  DateTime deliveryDate;
  TimeOfDay deliveryTime, pickUpTime;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  void _showSnap(String message) {
    _scaffoldKey.currentState.showSnackBar(
      SnackBar(
        content: new Text(message),
      ),
    );
  }

  Future _selectDate({bool isDelivery = false}) async {
    DateTime picked = await showDatePicker(
      context: context,
      initialDate: !isDelivery
          ? new DateTime.now()
          : DateTime.now().add(Duration(days: 1)),
      firstDate: !isDelivery
          ? DateTime.now().subtract(Duration(days: 0))
          : DateTime.now().add(Duration(days: 1)),
      lastDate: DateTime(2100),
    );
    return picked;
  }

  Future _selectTime() async {
    TimeOfDay picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    return picked;
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<DateViewModel>.withConsumer(
        viewModelBuilder: () => DateViewModel(),
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
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      width: screenWidth(context) - 70,
                      child: Text(
                          "Tell us how you’d like us to schedule your clothes ",
                          style: header),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          verticalSpace(20),
                          Text(
                            "Pick up schedule",
                            style: mapStyle,
                          ),
                          TimeAndDate(
                            date: pickUpDate,
                            time: pickUpTime,
                            handleDate: () async {
                              var value = await _selectDate();
                              setState(() {
                                pickUpDate = value;
                              });
                            },
                            handleTime: () async {
                              var value = await _selectTime();
                              setState(() {
                                pickUpTime = value;
                              });
                            },
                          ),
                          verticalSpace(40),
                          Text(
                            " Delivery schedule",
                            style: mapStyle,
                          ),
                          TimeAndDate(
                            date: deliveryDate,
                            time: deliveryTime,
                            handleDate: () async {
                              var value = await _selectDate(isDelivery: true);
                              setState(() {
                                deliveryDate = value;
                              });
                            },
                            handleTime: () async {
                              var value = await _selectTime();
                              setState(() {
                                deliveryTime = value;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20.0),
                      child: BusyButton(
                          title: "Next",
                          onPressed: () {
                            if (pickUpDate == null)
                              return _showSnap("Please select a Pickup date");
                            if (pickUpTime == null)
                              return _showSnap("Please select a Pickup time");
                            if (deliveryDate == null)
                              return _showSnap("Please select a delivery date");
                            if (deliveryTime == null)
                              return _showSnap("Please select a delivery date");

                            data.updatePickupAndDeliveryTime(
                              deliveryDate: deliveryDate,
                              deliveryTime: deliveryTime,
                              pickupDate: pickUpDate,
                              pickupTime: pickUpTime,
                            );

                            Navigator.pushNamed(
                                context, DestinationLocationRoute);
                          }),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}
