import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import './subscriber_type.dart';


class SubList with ChangeNotifier {
  final List<SubscriberType> subscriptionTypes;

  SubList({this.subscriptionTypes});

  factory SubList.fromJson(List<dynamic> parsedJson) {
    List<SubscriberType> subscriptionTypes = new List<SubscriberType>();
    subscriptionTypes = parsedJson.map((i) => SubscriberType.fromJson(i)).toList();
    return new SubList(
      subscriptionTypes: subscriptionTypes,
    );
  }
}

class SubTypes with ChangeNotifier {
  SubList _subTypes;

  SubList get subTypes {
    if (_subTypes == null) {
      fetchSubTypes();
    }
    return _subTypes;
  }

Future<void> fetchSubTypes() async {
  const url = 'https://oedipustechs-ab41a.firebaseio.com/subscriptiontypes.json';
  try {
    final response = await http.get(url);
    final extractedTypes = json.decode(response.body).toList();
    final listOfSubTypes = SubList.fromJson(extractedTypes);

    print("new sublist");
    print(listOfSubTypes.subscriptionTypes);

    _subTypes = listOfSubTypes;
  } catch (error) {
    throw (error);
  }
  notifyListeners();

}

}