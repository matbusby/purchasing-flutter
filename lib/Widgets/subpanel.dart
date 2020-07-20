import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../models/subscriber_type.dart';
import 'package:provider/provider.dart';
import '../models/cart.dart';
import 'package:ticket_purchase/models/subtypelist.dart';

class Subtype extends StatefulWidget {
  const Subtype({
    Key key,
  }) : super(key: key);

  @override
  _SubtypeState createState() => _SubtypeState();
}

class _SubtypeState extends State<Subtype> {
  int subCount = 0;
  double subPrice = 155;

  @override
  Widget build(BuildContext context) {
    final subTypes = Provider.of<SubTypes>(context).subTypes.subscriptionTypes;

    Cart cart;

    if (Provider.of<CurrentCart>(context).currentCart == null) {
      cart = new Cart();

      cart.subscriptions = new List<SubscriberType>();
      subTypes.forEach((element) {
        SubscriberType tempSub = new SubscriberType(
          count: 0,
          name: element.name,
          price: 0,
          subscriptionID: 1,
        );
        cart.subscriptions.add(tempSub);
      });
    } else {
      cart = Provider.of<CurrentCart>(context).currentCart;
    }

    subTypes.forEach((element) {
      if (element.count == null) {
        element.count = 0;
      }
    });

    return Container(
      padding: EdgeInsets.all(10),
      child: Container(
        height: (MediaQuery.of(context).size.height * .3),
        child: ListView.builder(
          itemBuilder: (ctx, index) {
            return Card(
              elevation: 3,
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 20, right: 20, top: 5, bottom: 5),
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      fit: FlexFit.tight,
                      flex: 50,
                      child: Container(
                        child: Text(
                            '${subTypes[index].name} - \$${subTypes[index].price.toStringAsFixed(2)} / each'),
                      ),
                    ),
                    Flexible(
                      fit: FlexFit.tight,
                      flex: 30,
                      child: FittedBox(
                        fit: BoxFit.fitWidth,
                        child: Row(
                          children: [
                            IconButton(
                              icon: Icon(Icons.remove),
                              onPressed: () {
                                if (subTypes[index].count > 0) {
                                  subTypes[index].count--;
                                  cart.subscriptions[index] = subTypes[index];
                                  Provider.of<CurrentCart>(context)
                                      .updateCart(cart);
                                } else if (cart.subscriptions[index].name !=
                                    'null') {
                                  // cart.subscriptions[index].name = 'null';
                                }
                                setState(() {});
                              },
                            ),
                            Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                border: Border.all(width: 1),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(5),
                                ),
                              ),
                              child: Text(subTypes[index].count.toString()),
                            ),
                            IconButton(
                              icon: Icon(Icons.add),
                              onPressed: () {
                                subTypes[index].count++;
                                cart.subscriptions[index] = subTypes[index];
                                Provider.of<CurrentCart>(context)
                                    .updateCart(cart);
                                print(Provider.of<CurrentCart>(context)
                                    .currentCart
                                    .subscriptions[1]
                                    .name);
                                setState(() {});
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    Spacer(
                      flex: 5,
                    ),
                    Flexible(
                      fit: FlexFit.tight,
                      flex: 15,
                      child: Container(
                        child: FittedBox(
                          fit: BoxFit.fitWidth,
                          child: Text(
                            '\$${(subTypes[index].price * subTypes[index].count).toStringAsFixed(2)}',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
          itemCount: subTypes.length,
        ),
      ),
    );
  }
}

updateCart(SubscriberType element, Cart cart, var index) {
  cart.subscriptions[index].name = element.name;
  cart.subscriptions[index].count = element.count;
  cart.subscriptions[index].price = element.price;

  return cart;
}
