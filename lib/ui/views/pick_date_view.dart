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

  Future _selectDate() async {
    DateTime picked = await showDatePicker(
        context: context,
        initialDate: new DateTime.now(),
        firstDate: new DateTime(2020),
        lastDate: new DateTime(2025));
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
                              var value = await _selectDate();
                              setState(() {
                                deliveryDate = value;
                                print(deliveryDate);
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
