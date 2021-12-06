import 'package:json_annotation/json_annotation.dart';
part 'response.g.dart';

@JsonSerializable()
class BaseResponse {
  @JsonKey(name: "status")
  int? status;
  @JsonKey(name: "message")
  String? message;
}

@JsonSerializable()
class UserResponse {
  @JsonKey(name: "id")
  String? id;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "numOfNotfication")
  int? numOfNotfication;

  UserResponse(this.id, this.name, this.numOfNotfication);

  static fromJson(Map<String, dynamic> json) {
    return _$UserResponseFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$UserResponseToJson(this);
  }
}

@JsonSerializable()
class ContactResponse {
  @JsonKey(name: "phoneNumber")
  int? phoneNumber;
  @JsonKey(name: "link")
  String? link;
  @JsonKey(name: "email")
  String? email;

  ContactResponse(this.phoneNumber, this.link, this.email);

  static fromJson(Map<String, dynamic> json) {
    return _$ContactResponseFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ContactResponseToJson(this);
  }
}

@JsonSerializable()
class AuthResponse extends BaseResponse {
  @JsonKey(name: "user")
  UserResponse? user;
  @JsonKey(name: "contact")
  ContactResponse? contact;

  AuthResponse(this.user, this.contact);

  factory AuthResponse.fromJson(Map<String, dynamic> json) {
    return _$AuthResponseFromJson(json);
  }
  Map<String, dynamic> toJson() {
    return _$AuthResponseToJson(this);
  }
}
