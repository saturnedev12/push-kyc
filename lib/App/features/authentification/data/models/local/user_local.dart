import 'package:isar/isar.dart';

part 'user_local.g.dart';

@collection
class UserLocal {
  Id id = 1;
  String? phoneNumber;
  String? logo;
  String? password;
  @Index(unique: true, replace: true)
  String? userId;
  String? status;
  String? firstName;
  String? lastName;
  String? email;
  String? token;
}
