class RegistrationResponse {
  bool? error;
  String? message;
  String? refreshToken;
  String? token;
  UserData? userData;

  RegistrationResponse(
      {this.error, this.message, this.refreshToken, this.token, this.userData});

  RegistrationResponse.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    message = json['message'];
    refreshToken = json['refreshToken'];
    token = json['token'];
    userData = json['userData'] != null
        ? new UserData.fromJson(json['userData'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['error'] = this.error;
    data['message'] = this.message;
    data['refreshToken'] = this.refreshToken;
    data['token'] = this.token;
    if (this.userData != null) {
      data['userData'] = this.userData!.toJson();
    }
    return data;
  }
}

class UserData {
  int? iV;
  String? sId;
  Country? country;
  String? createdAt;
  bool? deleted;
  String? email;
  String? firstName;
  String? lastName;
  String? signinType;
  String? spokenLanguage;
  String? updatedAt;
  String? userType;
  int? userShortId;
  bool? verifiedEmail;
  bool? verifiedPhone;

  UserData(
      {this.iV,
      this.sId,
      this.country,
      this.createdAt,
      this.deleted,
      this.email,
      this.firstName,
      this.lastName,
      this.signinType,
      this.spokenLanguage,
      this.updatedAt,
      this.userType,
      this.userShortId,
      this.verifiedEmail,
      this.verifiedPhone});

  UserData.fromJson(Map<String, dynamic> json) {
    iV = json['__v'];
    sId = json['_id'];
    country =
        json['country'] != null ? new Country.fromJson(json['country']) : null;
    createdAt = json['createdAt'];
    deleted = json['deleted'];
    email = json['email'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    signinType = json['signinType'];
    spokenLanguage = json['spokenLanguage'];
    updatedAt = json['updatedAt'];
    userType = json['userType'];
    userShortId = json['user_short_id'];
    verifiedEmail = json['verifiedEmail'];
    verifiedPhone = json['verifiedPhone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['__v'] = this.iV;
    data['_id'] = this.sId;
    if (this.country != null) {
      data['country'] = this.country!.toJson();
    }
    data['createdAt'] = this.createdAt;
    data['deleted'] = this.deleted;
    data['email'] = this.email;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['signinType'] = this.signinType;
    data['spokenLanguage'] = this.spokenLanguage;
    data['updatedAt'] = this.updatedAt;
    data['userType'] = this.userType;
    data['user_short_id'] = this.userShortId;
    data['verifiedEmail'] = this.verifiedEmail;
    data['verifiedPhone'] = this.verifiedPhone;
    return data;
  }
}

class Country {
  String? code;
  String? flag;
  String? name;

  Country({this.code, this.flag, this.name});

  Country.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    flag = json['flag'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['flag'] = this.flag;
    data['name'] = this.name;
    return data;
  }
}
