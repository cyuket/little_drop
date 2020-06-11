import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:little_drops/models/order_model.dart';
import 'package:little_drops/models/user.dart';

class FirestoreService {
  final CollectionReference _usersCollectionReference =
      Firestore.instance.collection('users');
  final CollectionReference _orderCollectionReference =
      Firestore.instance.collection('orders');

  Future createUser(User user) async {
    try {
      await _usersCollectionReference.document(user.id).setData(user.toJson());
    } catch (e) {
      return e.message;
    }
  }

  Future createOrder(OrderModel order) async {
    try {
      DocumentReference ref =
          await _orderCollectionReference.add(order.toJson());
      return ref.documentID;
    } catch (e) {
      print(e);
      return e.message;
    }
  }

  Future fetchAllOrder(String uid) async {
    try {
      var orders = await _orderCollectionReference
          .where("user", isEqualTo: uid)
          .getDocuments();

      return orders.documents;
    } catch (e) {
      print(e.message);
      return e.message;
    }
  }

  Future getUser(String uid) async {
    try {
      var userData = await _usersCollectionReference.document(uid).get();
      return User.fromData(userData.data);
    } catch (e) {
      return e.message;
    }
  }
}
