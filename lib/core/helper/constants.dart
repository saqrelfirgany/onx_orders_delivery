import 'helper.dart';

class AppConstants {
  static const String apiKey = '';

  /// Domain
  static const String domain = 'http://mdev.yemensoft.net:8087';

  // static const String domain = '';

  /// android App Url
  static const String androidAppUrl = '';

  /// ios App Url
  static const String iosAppUrl = '';

  /// App Store ID
  static const String appStoreID = '';

  /// google play ID
  static const String googlePlayID = '';

  /// Base Url
  // static String baseUrl = '$domain/${Helper.lang}/api/$apiVersion';
  static String baseUrl = '$domain';

  /// Language
  static String language = Helper.lang;

  /// Version
  static const String apiVersion = 'v001';

  /// About version shows inside the app
  static const String aboutAppVersion = '1.0.0';

  /// Force user to update after uploading new version on the stores. Get valued from DataBase
  static const double iOSUploadVersion = 1.0;

  static const double androidUploadVersion = 1.0;

  /// login EndPoint
  static const String loginEndPoint = '/OnyxDeliveryService/Service.svc/CheckDeliveryLogin';
}
