import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:ticket_purchase/models/subtypelist.dart';
import 'dart:async';

import '../Widgets/cartpanel.dart';
import '../Widgets/subpanel.dart';


class PurchaseScreen extends StatefulWidget {
  PurchaseScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _PurchaseScreenState createState() => _PurchaseScreenState();
}

class _PurchaseScreenState extends State<PurchaseScreen> {
  bool _isInit = true;
  var _isLoading = false;

  final PreferredSizeWidget appBar = AppBar(
    title: Text('Shadow Theatre'),
  );

  @override
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      print('fetching your stuff');
      Provider.of<SubTypes>(context).fetchSubTypes().then((_) {
        setState(() {
          _isLoading = false;
        });
      });
    }
    _isInit = false;
    super.didChangeDependencies();
  }


  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: appBar,
      body: Column(
        children: [
          CartPanel(),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Column(
                  children: [
                    Subtype(),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
