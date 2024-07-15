// ignore_for_file: non_constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';

part 'model.freezed.dart';
part 'model.g.dart';

bool? _parseBool(dynamic data) => data is int? && data != null
    ? data == 1
    : data is bool
        ? data
        : null;
        
int? _parseInt(dynamic value) => value is String? && value != null
    ? int.tryParse(value)
    : value is int
        ? value
        : null;

@freezed
class User with _$User {
  const factory User({
    @JsonKey(fromJson: _parseInt) int? id,
    String? name,
    String? email,
    @JsonKey(name: 'email_verified_at') DateTime? emailVerifiedAt,
    @JsonKey(name: 'nama_pengguna') String? namaPengguna,
    String? wallet,
    String? role,
    @JsonKey(name: 'foto_profile') String? fotoProfile,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updateAt,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
