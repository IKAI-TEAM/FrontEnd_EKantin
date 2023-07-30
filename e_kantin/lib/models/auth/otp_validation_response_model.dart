import 'dart:convert';

OtpValidationResponseModel otpValidationResponseJson(String str) =>
	OtpValidationResponseModel.fromJson(json.decode(str));

class OtpValidationResponseModel {
  bool? success;
  bool? oldUser;

  OtpValidationResponseModel({this.success, this.oldUser});

  OtpValidationResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    oldUser = json['OldUser'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['OldUser'] = oldUser;
    return data;
  }
}