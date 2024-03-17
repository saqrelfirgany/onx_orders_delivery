import 'helper.dart';

class AppConstants {
  static const String apiKey = '';

  /// Domain
  static const String domain = 'https://sys-access.com/system';

  // static const String domain = 'https://testadam.adamonline.sa';

  /// Images End
  static const String imageParentOriginal = '$domain/uploads/parents/original/';

  static const String imageChildsOriginal = '$domain/uploads/childs/original/';

  static const String imageAllergensOriginal = '$domain/uploads/allergens/original/';

  /// Currencies
  static const String egyPound = 'EGP';
  static const String sr = 'SR';

  /// android App Url
  static const String androidAppUrl = 'https://play.google.com/store/apps/details?id=com.namaait.adampharmacy';

  /// ios App Url
  static const String iosAppUrl = 'https://apps.apple.com/us/app/adam-pharmacy/id1672276218';

  /// App Store ID
  static const String appStoreID = 'id1672276218';

  /// google play ID
  static const String googlePlayID = 'com.namaait.adampharmacy';

  /// Base Url
  static String baseUrl = '$domain/${Helper.lang}/api/$apiVersion';

  /// Language
  static String language = Helper.lang;

  /// Version
  static const String apiVersion = 'v001';

  /// About version shows inside the app
  static const String aboutAppVersion = '1.0.0';

  /// Force user to update after uploading new version on the stores. Get valued from DataBase
  static const double iOSUploadVersion = 1.0;

  static const double androidUploadVersion = 1.0;

  /// Initial EndPoint
  static const String initialEndPoint = '/Initial';

  /// Countries EndPoint
  static const String countriesEndPoint = '/countries';

  /// Items EndPoint
  static const String itemsEndPoint = '/items';

  /// login EndPoint
  static const String loginEndPoint = '/login';

  /// login EndPoint
  static const String parentUpdateEndPoint = '/parentUpdate';

  /// checkPhoneNumber EndPoint
  static const String checkPhoneNumberEndPoint = '/checkPhoneNumber';

  /// checkPhoneNumber EndPoint
  static const String checkVerifyCodeEndPoint = '/checkVerifyCode';

  /// checkPhoneNumber EndPoint
  static const String forgotPasswordMobileEndPoint = '/forgotPasswordMobile';

  /// changePassword EndPoint
  static const String changePasswordEndPoint = '/changePassword';

  /// checkPhoneNumber EndPoint
  static const String sendVerifyCodeEndPoint = '/sendVerifyCode';

  /// register EndPoint
  static const String registerEndPoint = '/register';

  /// logout EndPoint
  static const String logoutEndPoint = '/logout';

  ///
  /// Home
  ///

  /// Home EndPoint
  static const String myChildsEndPoint = '/myChilds';

  /// Home EndPoint
  static const String parentDataEndPoint = '/parentData';

  /// Home EndPoint
  static const String infosEndPoint = '/infos';

  /// Home EndPoint
  static const String contactsEndPoint = '/contacts';

  /// Home EndPoint
  static const String homeEndPoint = '/home';

  /// Child Profile EndPoint
  static const String childEndPoint = '/childProfile';

  /// Child Profile EndPoint
  static const String addTransportationEndPoint = '/addTransportation';

  /// Child Profile EndPoint
  static const String addAttendenceEndPoint = '/addAttendence';

  /// Child Purchases EndPoint
  static const String childPurchasesEndPoint = '/getChildPurchases';

  /// Child Transportations EndPoint
  static const String childTransportationsEndPoint = '/childTransportations';

  /// Child Attendance EndPoint
  static const String childAttendanceEndPoint = '/childAttendences';

  /// getAllergens
  static const String getAllergensEndPoint = '/getAllergens';

  /// updateChildAllergens
  static const String updateChildAllergensEndPoint = '/updateChildAllergens';

  /// updateChildAllergens
  static const String postContactEndPoint = '/postContact';

  /// updateChildAllergens
  static const String rechargeEndPoint = '/recharge';

  /// updateChildAllergens
  static const String addSpendingLimitEndPoint = '/addSpendingLimit';

  /// getPurchasesDate
  static const String getPurchasesDateEndPoint = '/getPurchasesDate';
}
