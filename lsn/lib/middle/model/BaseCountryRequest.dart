class BaseCountryRequest {
  final String phoneCode;
  final String phoneNumber;
  final String phoneIso;
  final String phoneCountryName;

  BaseCountryRequest(
      {this.phoneCode, this.phoneNumber, this.phoneIso, this.phoneCountryName});
}
