// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'receiver_instituition.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ReceiverInstituition _$$_ReceiverInstituitionFromJson(
        Map<String, dynamic> json) =>
    _$_ReceiverInstituition(
      id: json['id'] as String,
      name: json['name'] as String,
      phoneNumber: json['phoneNumber'] as int,
      emailAddress: json['emailAddress'] as String,
      address: Address.fromJson(json['address'] as Map<String, dynamic>),
      fcmToken: json['fcmToken'] as String?,
    );

Map<String, dynamic> _$$_ReceiverInstituitionToJson(
        _$_ReceiverInstituition instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'phoneNumber': instance.phoneNumber,
      'emailAddress': instance.emailAddress,
      'address': instance.address.toJson(),
      'fcmToken': instance.fcmToken,
    };
