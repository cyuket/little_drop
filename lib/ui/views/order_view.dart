import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:little_drops/ui/shared/app_colors.dart';
import 'package:little_drops/ui/shared/shared_styles.dart';
import 'package:little_drops/ui/shared/ui_helpers.dart';
import 'package:little_drops/ui/widgets/order_card.dart';
import 'package:little_drops/viewModel/order_view_model.dart';
import 'package:provider_architecture/_viewmodel_provider.dart';

class OrderView extends StatefulWidget {
  @override
  _OrderViewState createState() => _OrderViewState();
}

class _OrderViewState extends State<OrderView> {
  bool isCurrent = true;
  final _fireStore = Firestore.instance;

  changeStatus() {
    setState(() {
      isCurrent = !isCurrent;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<OrderViewModel>.withConsumer(
        viewModelBuilder: () => OrderViewModel(),
        builder: (context, data, child) {
          return Scaffold(
            backgroundColor: AppColors().background,
            appBar: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: Colors.white,
              elevation: 0,
              title: Text(
                "Order",
                style: header,
              ),
            ),
            body: StreamBuilder<QuerySnapshot>(
                stream: _fireStore
                    .collection("orders")
                    .where("user", isEqualTo: data.user.id)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: CircularProgressIndicator(
                        backgroundColor: Colors.lightBlueAccent,
                      ),
                    );
                  }
                  data.snapshotData(snapshot.data.documents.reversed);
                  return SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Column(
                        children: <Widget>[
                          verticalSpace(20),
                          Container(
                            width: screenWidth(context) - 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                color: AppColors().primaryColor,
                              ),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  child: InkWell(
                                    onTap: changeStatus,
                                    child: Container(
                                      color: isCurrent
                                          ? AppColors().primaryColor
                                          : Colors.transparent,
                                      child: Center(
                                        child: Text(
                                          "Current",
                                          style: GoogleFonts.lato(
                                            textStyle: TextStyle(
                                                color: isCurrent
                                                    ? Colors.white
                                                    : AppColors().textColor,
                                                fontSize: 16),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: InkWell(
                                    onTap: changeStatus,
                                    child: Container(
                                      color: !isCurrent
                                          ? AppColors().primaryColor
                                          : Colors.transparent,
                                      child: Center(
                                        child: Text(
                                          "Past",
                                          style: GoogleFonts.lato(
                                            textStyle: TextStyle(
                                                color: !isCurrent
                                                    ? Colors.white
                                                    : AppColors().textColor,
                                                fontSize: 16),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Expanded(
                            child: isCurrent
                                ? ListView.builder(
                                    itemBuilder: (context, index) {
                                      return !data.orders[index].status
                                          ? OrderCards(
                                              order: data.orders[index],
                                            )
                                          : SizedBox();
                                    },
                                    itemCount: data.orders.length,
                                  )
                                : ListView.builder(
                                    itemBuilder: (context, index) {
                                      return data.orders[index].status
                                          ? OrderCards(
                                              order: data.orders[index],
                                            )
                                          : SizedBox();
                                    },
                                    itemCount: data.orders.length,
                                  ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
          );
        });
  }
}
