class GetLanguagesResponse {
  List<Data>? data;
  bool? error;

  GetLanguagesResponse({this.data, this.error});

  GetLanguagesResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    error = json['error'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['error'] = this.error;
    return data;
  }
}

class Data {
  String? createdAt;
  bool? deleted;
  bool? isAfrican;
  String? languageCode;
  String? languageIcon;
  String? languageName;
  String? languageId;
  bool? published;
  int? totalModules;

  Data(
      {this.createdAt,
      this.deleted,
      this.isAfrican,
      this.languageCode,
      this.languageIcon,
      this.languageName,
      this.languageId,
      this.published,
      this.totalModules});

  Data.fromJson(Map<String, dynamic> json) {
    createdAt = json['created_at'];
    deleted = json['deleted'];
    isAfrican = json['isAfrican'];
    languageCode = json['languageCode'];
    languageIcon = json['languageIcon'];
    languageName = json['languageName'];
    languageId = json['language_id'];
    published = json['published'];
    totalModules = json['totalModules'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['created_at'] = this.createdAt;
    data['deleted'] = this.deleted;
    data['isAfrican'] = this.isAfrican;
    data['languageCode'] = this.languageCode;
    data['languageIcon'] = this.languageIcon;
    data['languageName'] = this.languageName;
    data['language_id'] = this.languageId;
    data['published'] = this.published;
    data['totalModules'] = this.totalModules;
    return data;
  }
}
