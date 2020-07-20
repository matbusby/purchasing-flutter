// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Cart _$CartFromJson(Map<String, dynamic> json) {
  return Cart(
    cartID: json['cartID'] as int,
    total: (json['total'] as num)?.toDouble(),
    subscriptions: (json['subscriptions'] as List)
        ?.map((e) => e == null
            ? null
            : SubscriberType.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$CartToJson(Cart instance) => <String, dynamic>{
      'cartID': instance.cartID,
      'total': instance.total,
      'subscriptions': instance.subscriptions,
    };
