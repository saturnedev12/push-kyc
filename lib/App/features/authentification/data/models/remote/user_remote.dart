import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_remote.freezed.dart';
part 'user_remote.g.dart';

@freezed
class UserRemote with _$UserRemote {
  const factory UserRemote({
    required String id,
    @Default('') String? avatarId,
    @Default('') String? status,
    @Default('') String? description,
    @Default('') String? firstName,
    @Default('') String? lastName,
    @Default('') String? email,
  }) = _UserRemote;

  factory UserRemote.fromJson(Map<String, dynamic> json) =>
      _$UserRemoteFromJson(json);
}
