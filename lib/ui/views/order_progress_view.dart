import 'package:flutter/material.dart';
import 'package:little_drops/constants/assets.dart';
import 'package:little_drops/constants/route_names.dart';
import 'package:little_drops/models/order_model.dart';
import 'package:little_drops/ui/shared/app_colors.dart';
import 'package:little_drops/ui/shared/shared_styles.dart';
import 'package:little_drops/ui/shared/ui_helpers.dart';
import 'package:little_drops/ui/widgets/busy_button.dart';
import 'package:little_drops/ui/widgets/progress_item.dart';
import 'package:little_drops/viewModel/order_progress_view_model.dart';
import 'package:provider_architecture/_viewmodel_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class OrderProgressView extends StatelessWidget {
  final String id;
  OrderProgressView(this.id);
  @override
  Widget build(BuildContext context) {
    final _fireStore = Firestore.instance;
    return ViewModelProvider<OrderProgressViewModel>.withConsumer(
      viewModelBuilder: () => OrderProgressViewModel(),
      builder: (context, data, child) {
        return Scaffold(
          backgroundColor: AppColors().background,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: AppColors().background,
            leading: IconButton(
              onPressed: () => Navigator.pushNamedAndRemoveUntil(
                  context, HomeViewRoute, (r) => false),
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
                    child:
                        Text("Please input your card details.", style: header),
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
                      border:
                          Border.all(color: AppColors().borderColor, width: 1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Container(
                                  height: 44,
                                  width: 44,
                                  child: Image.asset(AppAsset.orderBan),
                                ),
                                horizontalSpaceMedium,
                                Column(
                                  children: <Widget>[
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                  ],
                                ),
                              ],
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
                        StreamBuilder<Object>(
                            stream: _fireStore
                                .collection("orders")
                                .document(id.toString())
                                .snapshots(),
                            builder: (context, snapshot) {
                              if (!snapshot.hasData) {
                                return Center(
                                  child: CircularProgressIndicator(
                                    backgroundColor: Colors.lightBlueAccent,
                                  ),
                                );
                              }
                              OrderModel order =
                                  data.getOrderDetail(snapshot.data);
                              return Column(
                                children: <Widget>[
                                  ProgressIndicators(
                                    title: "Order Placed",
                                    description:
                                        "We have received your payment! ",
                                    active: order.placed,
                                  ),
                                  verticalSpace(10),
                                  ProgressIndicators(
                                    title: "Pickup Agent on his way",
                                    description:
                                        "Your clothes have been picked up! ",
                                    active: order.placed && order.pickup,
                                  ),
                                  verticalSpace(10),
                                  ProgressIndicators(
                                    title: "Clothes Picked",
                                    description:
                                        "our clothes have been picked up! ",
                                    active: order.pickup && order.picked,
                                  ),
                                  verticalSpace(10),
                                  ProgressIndicators(
                                    title: "Washing Clothes",
                                    description:
                                        "Your clothes are being tushed up! ",
                                    active: order.picked && order.washing,
                                  ),
                                  verticalSpace(10),
                                  ProgressIndicators(
                                    title: "Packed Clothes",
                                    description:
                                        "Your clothes have been cleaned up and packed in a sweet way! ",
                                    active: order.washing && order.packed,
                                  ),
                                  verticalSpace(10),
                                  ProgressIndicators(
                                    title: "Delivery agent is on his way!",
                                    description:
                                        "We’ve done all you’ve asked for. Your clothes are coming!",
                                    active: order.packed && order.delivery,
                                    isLast: true,
                                  ),
                                ],
                              );
                            })
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20.0, horizontal: 20),
                    child: BusyButton(
                        title: "Done",
                        onPressed: () => Navigator.pushNamedAndRemoveUntil(
                            context, HomeViewRoute, (r) => false)),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
