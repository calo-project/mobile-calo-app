// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      id: (json['id'] as num?)?.toInt(),
      email: json['email'] as String,
      email_verified_at: json['email_verified_at'] as String?,
      name: json['name'] as String?,
      nama_pengguna: json['nama_pengguna'] as String?,
      role: json['role'] as String?,
      foto_profile: json['foto_profile'] as String?,
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'email_verified_at': instance.email_verified_at,
      'name': instance.name,
      'nama_pengguna': instance.nama_pengguna,
      'role': instance.role,
      'foto_profile': instance.foto_profile,
    };
