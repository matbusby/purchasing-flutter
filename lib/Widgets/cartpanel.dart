import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../models/subscriber_type.dart';
import 'package:provider/provider.dart';
import 'package:ticket_purchase/models/subtypelist.dart';

import '../models/cart.dart';

class CartPanel extends StatefulWidget {
  @override
  _CartPanelState createState() => _CartPanelState();
}

class _CartPanelState extends State<CartPanel> {
  @override
  Widget build(BuildContext context) {
    final subTypes = Provider.of<SubTypes>(context).subTypes.subscriptionTypes;

    Cart cart;
    Cart tempCart;
    cart = new Cart();
    cart.subscriptions = new List<SubscriberType>();

    if (Provider.of<CurrentCart>(context).currentCart == null) {
      tempCart = new Cart();

      tempCart.subscriptions = new List<SubscriberType>();
      subTypes.forEach((element) {
        SubscriberType tempSub = new SubscriberType(
          count: 0,
          name: element.name,
          price: element.price,
          subscriptionID: element.subscriptionID,
        );
        tempCart.subscriptions.add(tempSub);
      });
    } else {
      tempCart = Provider.of<CurrentCart>(context).currentCart;
    }

    tempCart.subscriptions.forEach((element) {
      if (element.count != 0) {
        cart.subscriptions.add(element);
      }
    });

    return AnimatedOpacity(
      opacity: cart.subscriptions.length > 0 ? 1.0 : 0.0,
      duration: Duration(milliseconds: 500),
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight: 200,
          minHeight: 40,
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border(
              bottom: BorderSide(
                color: Colors.blue,
                width: 4,
              ),
              top: BorderSide(
                color: Colors.blue,
                width: 4,
              ),
            ),
            // borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListView.builder(
                  shrinkWrap: true,
                  itemBuilder: (ctx, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 60, vertical: 8),
                      child: IntrinsicHeight(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Flexible(
                              fit: FlexFit.tight,
                              flex: 60,
                              child: FittedBox(
                                fit: BoxFit.fitHeight,
                                child: Text(
                                  cart.subscriptions[index].name,
                                  textScaleFactor: 1.2,
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            ),
                            Flexible(
                              fit: FlexFit.tight,
                              flex: 5,
                              child: VerticalDivider(
                                color: Colors.black54,
                                thickness: 2,
                              ),
                            ),
                            Flexible(
                              fit: FlexFit.tight,
                              flex: 35,
                              child: Text(
                                '\$${(cart.subscriptions[index].count * cart.subscriptions[index].price).toStringAsFixed(2)}',
                                textAlign: TextAlign.right,
                                textScaleFactor: 1.2,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  itemCount: cart.subscriptions.length),
              Container(
                width: MediaQuery.of(context).size.width * .4,
                padding: EdgeInsets.all(8),
                margin: EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  border: Border.all(
                    width: 2,
                    color: Colors.grey[200],
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
                child: Provider.of<CurrentCart>(context).currentCart != null
                    ? Text(
                        '\$${Provider.of<CurrentCart>(context).currentCart.total.toStringAsFixed(2)}',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20),
                      )
                    : Text('0'),
              ),
              RaisedButton(
                  hoverColor: Colors.blueGrey[300],
                  child: Text('Purchase'),
                  elevation: 15,
                  onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
