import 'dart:convert';

class Constant {
  static const String clientId = "garageWa";
  static const String clientSecret = "garageWa321\$";
  static const String baseUrl = prod;
  static const String stage = "https://stageapi.garagewa.com";
  static const String prod = "https://api.garagewa.com";
  static const String origin = prodOrigin;
  static const String stageOrigin = "https://stageportal.garagewa.com";
  static const String devOrigin = "https://gaportal.garagewa.com:3000";
  static const String prodOrigin = "https://garagewa.com";

  static String clientString =
      base64Encode(utf8.encode("$clientId:$clientSecret"));
  static String clientIdSecret = "Basic $clientString";
}
