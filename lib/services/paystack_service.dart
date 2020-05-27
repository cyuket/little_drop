import 'package:flutter/material.dart';
import 'package:flutter_paystack/flutter_paystack.dart';
import 'package:little_drops/constants/route_names.dart';
import 'package:little_drops/locator.dart';
import 'package:little_drops/models/order_model.dart';
import 'item_selection_services.dart';
import 'authentication_service.dart';
import 'navigation_service.dart';
import 'firestore_service.dart';

class PaystackService {
  final ItemSelectionServices _itemSelectionServices =
      locator<ItemSelectionServices>();
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();
  final NavigationService _navigationService = locator<NavigationService>();
  final FirestoreService _firestoreService = locator<FirestoreService>();

  PaymentCard _getCardFromUI() {
    List spiltDates = _itemSelectionServices.expiryDate.split("/");
    return PaymentCard(
      number: _itemSelectionServices.cardNumber,
      cvc: _itemSelectionServices.cvv,
      expiryMonth: int.parse(spiltDates[0]),
      expiryYear: int.parse(spiltDates[1]),
    );
  }

  Future chargeCard(String reference, BuildContext context) async {
    var charge = Charge()
      ..amount = (_itemSelectionServices.totalAmount * 100).round()
      ..email = _authenticationService.currentUser.email
      ..reference = reference
      ..card = _getCardFromUI();

    await PaystackPlugin.chargeCard(
      context,
      charge: charge,
      beforeValidate: (transaction) => handleBeforeValidate(transaction),
      onSuccess: (transaction) async =>
          await handleOnSuccess(transaction, context),
      onError: (error, transaction) =>
          handleOnError(error, transaction, context),
    );
  }

  // Future testPayment(String reference, BuildContext context) async {
  //   var charge = Charge()
  //     ..amount = (_itemSelectionServices.totalAmount * 100).round()
  //     ..email = _authenticationService.currentUser.email
  //     ..reference = reference;
  //   // ..card = _getCardFromUI();

  //   // await PaystackPlugin.chargeCard(
  //   //   context,
  //   //   charge: charge,
  //   //   beforeValidate: (transaction) => handleBeforeValidate(transaction),
  //   //   onSuccess: (transaction) => handleOnSuccess(transaction),
  //   //   onError: (error, transaction) =>
  //   //       handleOnError(error, transaction, context),
  //   // );

  //   CheckoutResponse response = await PaystackPlugin.checkout(
  //     context,
  //     method: CheckoutMethod.card, // Defaults to CheckoutMethod.selectable
  //     charge: charge,
  //   );

  //   if (response.status) {
  //     print(response.reference);
  //     OrderModel order = OrderModel(
  //       status: false,
  //       orderDetails: _itemSelectionServices.selectedItems,
  //       reference: response.reference,
  //       user: _authenticationService.currentUser,
  //       paymentType: _itemSelectionServices.paymentMethod,
  //       pickup: true,
  //       pickupDate: _itemSelectionServices.pickUpDate,
  //       pickupTime: _itemSelectionServices.pickUpTime.format(context),
  //       deliveryDate: _itemSelectionServices.deliveryDate,
  //       deliveryTime: _itemSelectionServices.deliveryTime.format(context),
  //       deliveryAddress: _itemSelectionServices.deliveryAdress,
  //       pickupAddress: _itemSelectionServices.pickupAdress,
  //     );
  //     await _firestoreService.createOrder(order);
  //     _navigationService.clearLastAndNavigateTo(OrderProgressRoute);
  //   }
  // }

  handleBeforeValidate(Transaction transaction) {
    print(transaction.message);
  }

  Future handleOnSuccess(Transaction transaction, BuildContext context) async {
    // _dialogService.successfulPayment(() => null)
    List _items = [];
    for (var item in _itemSelectionServices.selectedItems) {
      var detail = item.toJson();
      _items.add(detail);
    }

    OrderModel order = OrderModel(
      status: false,
      orderDetails: _items,
      reference: transaction.reference,
      user: _authenticationService.currentUser.id,
      paymentType: _itemSelectionServices.paymentMethod,
      pickup: true,
      pickupDate: _itemSelectionServices.pickUpDate,
      pickupTime: _itemSelectionServices.pickUpTime.format(context),
      deliveryDate: _itemSelectionServices.deliveryDate,
      deliveryTime: _itemSelectionServices.deliveryTime.format(context),
      deliveryAddress: _itemSelectionServices.deliveryAdress,
      pickupAddress: _itemSelectionServices.pickupAdress,
      createdAt: new DateTime.now(),
    );
    await _firestoreService.createOrder(order);
    _navigationService.clearLastAndNavigateTo(OrderProgressRoute);
  }

  handleOnError(Object error, Transaction transaction, BuildContext context) {
    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text(error),
    ));
    // print(error);
    // _showErrorDialog();
  }
}
