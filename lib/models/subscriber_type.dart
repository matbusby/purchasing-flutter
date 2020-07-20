import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'subscriber_type.g.dart';

@JsonSerializable()

class SubscriberType {
  final int subscriptionID;
  String name;
  double price; 
  int count;

  SubscriberType({this.subscriptionID, this.name, this.price, this.count});

  factory SubscriberType.fromJson(Map<String, dynamic> json) => _$SubscriberTypeFromJson(json);

  Map<String, dynamic> toJson() => _$SubscriberTypeToJson(this);

}
