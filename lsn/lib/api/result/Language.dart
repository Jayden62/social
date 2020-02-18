class Language {
  String countryName;
  String countryCode;
  String flag;
  String postCode;

  Language({this.countryName, this.countryCode, this.flag,this.postCode});

  Language.fromJson(Map<String, dynamic> json) {
    countryName = json['country_name'];
    countryCode = json['country_code'];
    flag = json['flag'];
    postCode = json['post_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['country_name'] = this.countryName;
    data['country_code'] = this.countryCode;
    data['flag'] = this.flag;
    data['post_code'] = this.postCode;
    return data;
  }
}
