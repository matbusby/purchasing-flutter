// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subscriber_type.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubscriberType _$SubscriberTypeFromJson(Map<String, dynamic> json) {
  return SubscriberType(
    subscriptionID: json['subscriptionID'] as int,
    name: json['name'] as String,
    price: (json['price'] as num)?.toDouble(),
    count: json['count'] as int,
  );
}

Map<String, dynamic> _$SubscriberTypeToJson(SubscriberType instance) =>
    <String, dynamic>{
      'subscriptionID': instance.subscriptionID,
      'name': instance.name,
      'price': instance.price,
      'count': instance.count,
    };
