import 'package:flutter/material.dart';
import 'package:ticket_purchase/models/cart.dart';
import './Widgets/subpanel.dart';
import 'package:provider/provider.dart';

import './Screens/purchase_screen.dart';
import './models/subtypelist.dart';
import './models/cart.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: SubTypes(),
        ),
        ChangeNotifierProvider.value(
          value: CurrentCart(),
        ),
        // ChangeNotifierProvider.value(
        //   value: ActiveUser(),
        // )
      ],
      child: MaterialApp(
          title: 'Shadow Theatre',
          theme: ThemeData(
            primarySwatch: Colors.cyan,
            accentColor: Colors.deepOrange,
            fontFamily: 'Lato',
          ),
          home: PurchaseScreen(),
          routes: {
            // // UserScreen.routeName: (ctx) => UserScreen(),
            // AdminScreen.routeName: (ctx) => AdminScreen(),
          }),
    );
  }
}