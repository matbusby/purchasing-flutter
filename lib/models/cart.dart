import 'package:flutter/cupertino.dart';
import 'package:ticket_purchase/models/subscriber_type.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cart.g.dart';

@JsonSerializable()
class Cart {
  final int cartID;
  double total;
  List<SubscriberType> subscriptions;

  Cart({this.cartID, this.total, this.subscriptions});

  factory Cart.fromJson(Map<String, dynamic> json) => _$CartFromJson(json);

  Map<String, dynamic> toJson() => _$CartToJson(this);
}

class CurrentCart with ChangeNotifier {
  Cart _cart;

  double get totalAmount {
    var total = 0.0;
    _cart.subscriptions.forEach((element) {
      if (element.count > 0) {
        total += element.count * element.price;
      }
    });
    _cart.total = total;

    return _cart.total;
  }

  Cart get currentCart {
    // double total;
    // if (_cart.total == null) {
    //   _cart.total = 0;
    // }

    // _cart.subscriptions.forEach((element) {
    //   if (element.count > 0) {
    //     total = total + (element.count * element.price);
    //   }
    // });

    // _cart.total = total;

    return _cart;
  }

  void updateCart(Cart newCart) {
    double total = 0.0;

    newCart.subscriptions.forEach((element) {
      // if (element.count > 0) {
      total += element.count * element.price;
      // }
    });
    newCart.total = total;
    _cart = newCart;
    notifyListeners();
  }
}
