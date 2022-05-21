import 'dart:convert';

UserError userErrorFromJson(String str) =>
    UserError.fromJson(jsonDecode(str) as Map<String, dynamic>);
String userErrorToJson(UserError data) => jsonEncode(data.toJson());

class UserError {
  int code;
  String message;

  UserError({
    required this.code,
    required this.message,
  });

  factory UserError.fromJson(Map<String, dynamic> json) => UserError(
        code: json['code'] as int,
        message: json['message'] as String,
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'code': code,
        'message': message,
      };
}
