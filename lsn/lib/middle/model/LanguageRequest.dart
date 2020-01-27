class LanguageRequest {
  String countryName;
  String countryCode;
  String flag;

  LanguageRequest({this.countryName, this.countryCode, this.flag});

  LanguageRequest.fromJson(Map<String, dynamic> json) {
    countryName = json['country_name'];
    countryCode = json['country_code'];
    flag = json['flag'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['country_name'] = this.countryName;
    data['country_code'] = this.countryCode;
    data['flag'] = this.flag;
    return data;
  }
}
