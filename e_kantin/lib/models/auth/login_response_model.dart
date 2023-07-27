import 'dart:convert';

LoginResponseModel loginResponseJson(String str) =>
    LoginResponseModel.fromJson(json.decode(str));

class LoginResponseModel {
  bool? success;
  Data? data;
  String? message;

  LoginResponseModel({this.success, this.data, this.message});

<<<<<<< Updated upstream
  LoginResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = this.message;
    return data;
  }
=======
	LoginResponseModel.fromJson(Map<String, dynamic> json) {
		success = json['success'];
		data = json['data'] != null ? Data.fromJson(json['data']) : null;
		message = json['message'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = <String, dynamic>{};
		data['success'] = success;
		if (this.data != null) {
			data['data'] = this.data!.toJson();
		}
		data['message'] = message;
		return data;
	}
>>>>>>> Stashed changes

  String? getToken() {
    var token = data?.token;

    if (token != null) {
      return token;
    }
    return null;
  }
}

class Data {
  String? token;

  Data({this.token});

  Data.fromJson(Map<String, dynamic> json) {
    token = json['token'];
  }

<<<<<<< Updated upstream
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    return data;
  }
}
=======
	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = <String, dynamic>{};
		data['token'] = token;
		return data;
	}
}
>>>>>>> Stashed changes
