import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en')
  ];

  /// No description provided for @storekeeper.
  ///
  /// In en, this message translates to:
  /// **'Storekeeper'**
  String get storekeeper;

  /// No description provided for @welcomeLogin.
  ///
  /// In en, this message translates to:
  /// **'Welcome Back!'**
  String get welcomeLogin;

  /// No description provided for @logBackIntoYourAccount.
  ///
  /// In en, this message translates to:
  /// **'Log back into your account'**
  String get logBackIntoYourAccount;

  /// No description provided for @userID.
  ///
  /// In en, this message translates to:
  /// **'User ID'**
  String get userID;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @login.
  ///
  /// In en, this message translates to:
  /// **'Log in'**
  String get login;

  /// No description provided for @userIDRequired.
  ///
  /// In en, this message translates to:
  /// **'User ID Required'**
  String get userIDRequired;

  /// No description provided for @passwordError.
  ///
  /// In en, this message translates to:
  /// **'Password required'**
  String get passwordError;

  /// No description provided for @goCashless.
  ///
  /// In en, this message translates to:
  /// **'Go cashless, promote healthy spending.'**
  String get goCashless;

  /// No description provided for @enterInvoiceNumber.
  ///
  /// In en, this message translates to:
  /// **'Enter your invoice number'**
  String get enterInvoiceNumber;

  /// No description provided for @invoiceNumber.
  ///
  /// In en, this message translates to:
  /// **'Invoice number'**
  String get invoiceNumber;

  /// No description provided for @newInvoice.
  ///
  /// In en, this message translates to:
  /// **'New invoice'**
  String get newInvoice;

  /// No description provided for @contactUsMessage.
  ///
  /// In en, this message translates to:
  /// **'The contact us message'**
  String get contactUsMessage;

  /// No description provided for @peaceOfMind.
  ///
  /// In en, this message translates to:
  /// **'Peace of mind with real-time whereabouts.'**
  String get peaceOfMind;

  /// No description provided for @atSchool.
  ///
  /// In en, this message translates to:
  /// **'At school'**
  String get atSchool;

  /// No description provided for @aM.
  ///
  /// In en, this message translates to:
  /// **'8:30 AM'**
  String get aM;

  /// No description provided for @scontinue.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get scontinue;

  /// No description provided for @enterVerification.
  ///
  /// In en, this message translates to:
  /// **'Enter your Verification '**
  String get enterVerification;

  /// No description provided for @sentVerification.
  ///
  /// In en, this message translates to:
  /// **'We just sent you a Verification code to\n+966 '**
  String get sentVerification;

  /// No description provided for @oTPTest.
  ///
  /// In en, this message translates to:
  /// **'The OTP For Test '**
  String get oTPTest;

  /// No description provided for @campusExperience.
  ///
  /// In en, this message translates to:
  /// **'Welcome to your new campus experience.'**
  String get campusExperience;

  /// No description provided for @userName.
  ///
  /// In en, this message translates to:
  /// **'User Name'**
  String get userName;

  /// No description provided for @rememberMe.
  ///
  /// In en, this message translates to:
  /// **'Remember me'**
  String get rememberMe;

  /// No description provided for @forgetPassword.
  ///
  /// In en, this message translates to:
  /// **'Forget Password'**
  String get forgetPassword;

  /// No description provided for @enterYourPhoneNumber.
  ///
  /// In en, this message translates to:
  /// **'Enter your phone number'**
  String get enterYourPhoneNumber;

  /// No description provided for @weWillSendYouVerificationCode.
  ///
  /// In en, this message translates to:
  /// **'We will send you a Verification code'**
  String get weWillSendYouVerificationCode;

  /// No description provided for @next.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get next;

  /// No description provided for @limitsTypeError.
  ///
  /// In en, this message translates to:
  /// **'Spend limits type is required'**
  String get limitsTypeError;

  /// No description provided for @limitsAmountError.
  ///
  /// In en, this message translates to:
  /// **'Spend limits amount is required'**
  String get limitsAmountError;

  /// No description provided for @getStarted.
  ///
  /// In en, this message translates to:
  /// **'Get Started'**
  String get getStarted;

  /// No description provided for @re.
  ///
  /// In en, this message translates to:
  /// **'Re'**
  String get re;

  /// No description provided for @sendCode.
  ///
  /// In en, this message translates to:
  /// **'send Code in'**
  String get sendCode;

  /// No description provided for @s.
  ///
  /// In en, this message translates to:
  /// **' s'**
  String get s;

  /// No description provided for @balance.
  ///
  /// In en, this message translates to:
  /// **'Balance'**
  String get balance;

  /// No description provided for @recharge.
  ///
  /// In en, this message translates to:
  /// **'Recharge'**
  String get recharge;

  /// No description provided for @familyMembers.
  ///
  /// In en, this message translates to:
  /// **'Family members'**
  String get familyMembers;

  /// No description provided for @activity.
  ///
  /// In en, this message translates to:
  /// **'Activity'**
  String get activity;

  /// No description provided for @allMembers.
  ///
  /// In en, this message translates to:
  /// **'All family members'**
  String get allMembers;

  /// No description provided for @total.
  ///
  /// In en, this message translates to:
  /// **'Total:'**
  String get total;

  /// No description provided for @date.
  ///
  /// In en, this message translates to:
  /// **'Date:'**
  String get date;

  /// No description provided for @today.
  ///
  /// In en, this message translates to:
  /// **'Today'**
  String get today;

  /// No description provided for @sr.
  ///
  /// In en, this message translates to:
  /// **'SR'**
  String get sr;

  /// No description provided for @pickMethod.
  ///
  /// In en, this message translates to:
  /// **'Pick a payment method'**
  String get pickMethod;

  /// No description provided for @creditDebit.
  ///
  /// In en, this message translates to:
  /// **'Credit or Debit Card'**
  String get creditDebit;

  /// No description provided for @debitCard.
  ///
  /// In en, this message translates to:
  /// **'Debit Card'**
  String get debitCard;

  /// No description provided for @creditCard.
  ///
  /// In en, this message translates to:
  /// **'Credit Card'**
  String get creditCard;

  /// No description provided for @creditRefundable.
  ///
  /// In en, this message translates to:
  /// **'Credit recharges are non-refundable.'**
  String get creditRefundable;

  /// No description provided for @tappingRecharge.
  ///
  /// In en, this message translates to:
  /// **'By tapping recharge you agree to the '**
  String get tappingRecharge;

  /// No description provided for @creditTerms.
  ///
  /// In en, this message translates to:
  /// **'credit card load-up terms and conditions.'**
  String get creditTerms;

  /// No description provided for @spending.
  ///
  /// In en, this message translates to:
  /// **'Spending'**
  String get spending;

  /// No description provided for @thisWeek.
  ///
  /// In en, this message translates to:
  /// **'This Week'**
  String get thisWeek;

  /// No description provided for @spentToday.
  ///
  /// In en, this message translates to:
  /// **'Spent Today'**
  String get spentToday;

  /// No description provided for @noPurchases.
  ///
  /// In en, this message translates to:
  /// **'No purchases recorded this week yet'**
  String get noPurchases;

  /// No description provided for @allPurchases.
  ///
  /// In en, this message translates to:
  /// **'View All Purchases'**
  String get allPurchases;

  /// No description provided for @transportation.
  ///
  /// In en, this message translates to:
  /// **'Transportation'**
  String get transportation;

  /// No description provided for @noTransportations.
  ///
  /// In en, this message translates to:
  /// **'Today: No Transportations'**
  String get noTransportations;

  /// No description provided for @allTransportation.
  ///
  /// In en, this message translates to:
  /// **'View All Transportation'**
  String get allTransportation;

  /// No description provided for @attendance.
  ///
  /// In en, this message translates to:
  /// **'Attendance'**
  String get attendance;

  /// No description provided for @noChecked.
  ///
  /// In en, this message translates to:
  /// **'This family member has not checked in yet today'**
  String get noChecked;

  /// No description provided for @allAttendance.
  ///
  /// In en, this message translates to:
  /// **'View All Attendance'**
  String get allAttendance;

  /// No description provided for @addExcuse.
  ///
  /// In en, this message translates to:
  /// **'Add Excuse'**
  String get addExcuse;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @restrictedProducts.
  ///
  /// In en, this message translates to:
  /// **'Restricted Products'**
  String get restrictedProducts;

  /// No description provided for @noProducts.
  ///
  /// In en, this message translates to:
  /// **'No restricted products'**
  String get noProducts;

  /// No description provided for @manageRestrictions.
  ///
  /// In en, this message translates to:
  /// **'Manage Restrictions'**
  String get manageRestrictions;

  /// No description provided for @pin.
  ///
  /// In en, this message translates to:
  /// **'Pin'**
  String get pin;

  /// No description provided for @setPin.
  ///
  /// In en, this message translates to:
  /// **'Tap to set your digital id’s pin. once set, your family member will need this when making a purchase. '**
  String get setPin;

  /// No description provided for @notifications.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get notifications;

  /// No description provided for @enNotifications.
  ///
  /// In en, this message translates to:
  /// **'Enable or disable notifications for your children.'**
  String get enNotifications;

  /// No description provided for @spendingLimits.
  ///
  /// In en, this message translates to:
  /// **'Spending limits'**
  String get spendingLimits;

  /// No description provided for @enableDaily.
  ///
  /// In en, this message translates to:
  /// **'Enable daily, weekly or monthly limits to enforce healthy habits.'**
  String get enableDaily;

  /// No description provided for @amount.
  ///
  /// In en, this message translates to:
  /// **'The amount'**
  String get amount;

  /// No description provided for @daily.
  ///
  /// In en, this message translates to:
  /// **'daily'**
  String get daily;

  /// No description provided for @weekly.
  ///
  /// In en, this message translates to:
  /// **'weekly'**
  String get weekly;

  /// No description provided for @monthly.
  ///
  /// In en, this message translates to:
  /// **'monthly'**
  String get monthly;

  /// No description provided for @update.
  ///
  /// In en, this message translates to:
  /// **'Update'**
  String get update;

  /// No description provided for @basicNotifications.
  ///
  /// In en, this message translates to:
  /// **'Basic notifications'**
  String get basicNotifications;

  /// No description provided for @notificationsFor.
  ///
  /// In en, this message translates to:
  /// **'Notifications for every failed transaction, limit warnings, attendance alerts, and more.'**
  String get notificationsFor;

  /// No description provided for @manageAllergens.
  ///
  /// In en, this message translates to:
  /// **'Manage Allergens'**
  String get manageAllergens;

  /// No description provided for @noRecorded.
  ///
  /// In en, this message translates to:
  /// **'No spending recorded'**
  String get noRecorded;

  /// No description provided for @totalPrice.
  ///
  /// In en, this message translates to:
  /// **'Total Price: '**
  String get totalPrice;

  /// No description provided for @viewDetails.
  ///
  /// In en, this message translates to:
  /// **'View details'**
  String get viewDetails;

  /// No description provided for @ordersDetails.
  ///
  /// In en, this message translates to:
  /// **'Orders details'**
  String get ordersDetails;

  /// No description provided for @order.
  ///
  /// In en, this message translates to:
  /// **'Order'**
  String get order;

  /// No description provided for @bonnNo.
  ///
  /// In en, this message translates to:
  /// **'Bonn No'**
  String get bonnNo;

  /// No description provided for @item.
  ///
  /// In en, this message translates to:
  /// **'item'**
  String get item;

  /// No description provided for @price.
  ///
  /// In en, this message translates to:
  /// **'Price'**
  String get price;

  /// No description provided for @schoolName.
  ///
  /// In en, this message translates to:
  /// **'School name'**
  String get schoolName;

  /// No description provided for @arrivedSchool.
  ///
  /// In en, this message translates to:
  /// **'Arrived at school'**
  String get arrivedSchool;

  /// No description provided for @leftSchool.
  ///
  /// In en, this message translates to:
  /// **'Left school'**
  String get leftSchool;

  /// No description provided for @at.
  ///
  /// In en, this message translates to:
  /// **'At'**
  String get at;

  /// No description provided for @enterExcuse.
  ///
  /// In en, this message translates to:
  /// **'Enter your excuse'**
  String get enterExcuse;

  /// No description provided for @gettingHome.
  ///
  /// In en, this message translates to:
  /// **'How will they be getting home instead?'**
  String get gettingHome;

  /// No description provided for @oneTime.
  ///
  /// In en, this message translates to:
  /// **'One-time or repeating?'**
  String get oneTime;

  /// No description provided for @onlyFor.
  ///
  /// In en, this message translates to:
  /// **'Only for 25 march  `23'**
  String get onlyFor;

  /// No description provided for @everyMonday.
  ///
  /// In en, this message translates to:
  /// **'Every monday'**
  String get everyMonday;

  /// No description provided for @arrangeTheir.
  ///
  /// In en, this message translates to:
  /// **'I will arrange their pickup'**
  String get arrangeTheir;

  /// No description provided for @anotherBus.
  ///
  /// In en, this message translates to:
  /// **'On another bus'**
  String get anotherBus;

  /// No description provided for @importantNote.
  ///
  /// In en, this message translates to:
  /// **'Important note: This excuse will not be added immediately. your company will be in touch to confirm the alternate bus.'**
  String get importantNote;

  /// No description provided for @done.
  ///
  /// In en, this message translates to:
  /// **'Done'**
  String get done;

  /// No description provided for @latestNews.
  ///
  /// In en, this message translates to:
  /// **'Latest News'**
  String get latestNews;

  /// No description provided for @stayUp.
  ///
  /// In en, this message translates to:
  /// **'Stay up to date on the latest news shared by your school.'**
  String get stayUp;

  /// No description provided for @onlineStore.
  ///
  /// In en, this message translates to:
  /// **'Online Store'**
  String get onlineStore;

  /// No description provided for @purchaseProducts.
  ///
  /// In en, this message translates to:
  /// **'See and Purchase products directly in-app.'**
  String get purchaseProducts;

  /// No description provided for @resources.
  ///
  /// In en, this message translates to:
  /// **'Resources & Useful Links'**
  String get resources;

  /// No description provided for @requests.
  ///
  /// In en, this message translates to:
  /// **'Requests'**
  String get requests;

  /// No description provided for @requestsSent.
  ///
  /// In en, this message translates to:
  /// **'Requests sent directly to you by your school.'**
  String get requestsSent;

  /// No description provided for @newsFeed.
  ///
  /// In en, this message translates to:
  /// **'News Feed'**
  String get newsFeed;

  /// No description provided for @noNews.
  ///
  /// In en, this message translates to:
  /// **'No news yet'**
  String get noNews;

  /// No description provided for @schoolOnlineStore.
  ///
  /// In en, this message translates to:
  /// **'School Online Store'**
  String get schoolOnlineStore;

  /// No description provided for @onlineBrach.
  ///
  /// In en, this message translates to:
  /// **'Online Brach'**
  String get onlineBrach;

  /// No description provided for @trips.
  ///
  /// In en, this message translates to:
  /// **'Trips'**
  String get trips;

  /// No description provided for @classPhoto.
  ///
  /// In en, this message translates to:
  /// **'Class Photo'**
  String get classPhoto;

  /// No description provided for @sortieAux.
  ///
  /// In en, this message translates to:
  /// **'Sortie aux Pyramids- forever is now'**
  String get sortieAux;

  /// No description provided for @allergens.
  ///
  /// In en, this message translates to:
  /// **'Allergens'**
  String get allergens;

  /// No description provided for @theVendor.
  ///
  /// In en, this message translates to:
  /// **'The vendor has not reported any allergens yet.'**
  String get theVendor;

  /// No description provided for @viewCart.
  ///
  /// In en, this message translates to:
  /// **'View Cart'**
  String get viewCart;

  /// No description provided for @schoolCanteen.
  ///
  /// In en, this message translates to:
  /// **'School Canteen Menu'**
  String get schoolCanteen;

  /// No description provided for @hereAre.
  ///
  /// In en, this message translates to:
  /// **'Here are the food and drink options available on the School main campus and secondary building. '**
  String get hereAre;

  /// No description provided for @profile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profile;

  /// No description provided for @appearance.
  ///
  /// In en, this message translates to:
  /// **'Appearance'**
  String get appearance;

  /// No description provided for @security.
  ///
  /// In en, this message translates to:
  /// **'Security'**
  String get security;

  /// No description provided for @about.
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get about;

  /// No description provided for @aboutUS.
  ///
  /// In en, this message translates to:
  /// **'About US'**
  String get aboutUS;

  /// No description provided for @privacyPolicy.
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get privacyPolicy;

  /// No description provided for @termsConditions.
  ///
  /// In en, this message translates to:
  /// **'Terms And Conditions'**
  String get termsConditions;

  /// No description provided for @support.
  ///
  /// In en, this message translates to:
  /// **'Support'**
  String get support;

  /// No description provided for @social.
  ///
  /// In en, this message translates to:
  /// **'Social'**
  String get social;

  /// No description provided for @contactUs.
  ///
  /// In en, this message translates to:
  /// **'Contact Us'**
  String get contactUs;

  /// No description provided for @signOut.
  ///
  /// In en, this message translates to:
  /// **'Sign out'**
  String get signOut;

  /// No description provided for @phoneNumber.
  ///
  /// In en, this message translates to:
  /// **'Phone Number'**
  String get phoneNumber;

  /// No description provided for @name.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get name;

  /// No description provided for @tapUpdate.
  ///
  /// In en, this message translates to:
  /// **'Tap to update'**
  String get tapUpdate;

  /// No description provided for @notificationsSchool.
  ///
  /// In en, this message translates to:
  /// **'Notifications from school'**
  String get notificationsSchool;

  /// No description provided for @darkMode.
  ///
  /// In en, this message translates to:
  /// **'Dark Mode'**
  String get darkMode;

  /// No description provided for @updateProfile.
  ///
  /// In en, this message translates to:
  /// **'Update Profile'**
  String get updateProfile;

  /// No description provided for @changeNumber.
  ///
  /// In en, this message translates to:
  /// **'Change Number'**
  String get changeNumber;

  /// No description provided for @changeCan.
  ///
  /// In en, this message translates to:
  /// **'This change can not be undone'**
  String get changeCan;

  /// No description provided for @toProceed.
  ///
  /// In en, this message translates to:
  /// **'To proceed, make sure that your new number can receive SMS messages and tap next to verify that number.'**
  String get toProceed;

  /// No description provided for @useChange.
  ///
  /// In en, this message translates to:
  /// **'Use Change Number to migrate your account info, family members, and Digital IDs from your current phone number to a new phone number.'**
  String get useChange;

  /// No description provided for @agreeTerms.
  ///
  /// In en, this message translates to:
  /// **'Ok , i agree terms'**
  String get agreeTerms;

  /// No description provided for @oldNumber.
  ///
  /// In en, this message translates to:
  /// **'Your Old Number'**
  String get oldNumber;

  /// No description provided for @newNumber.
  ///
  /// In en, this message translates to:
  /// **'Your New Number'**
  String get newNumber;

  /// No description provided for @bnoud.
  ///
  /// In en, this message translates to:
  /// **'Bnoud'**
  String get bnoud;

  /// No description provided for @welcome.
  ///
  /// In en, this message translates to:
  /// **'Welcome'**
  String get welcome;

  /// No description provided for @activeProjects.
  ///
  /// In en, this message translates to:
  /// **'Active Projects'**
  String get activeProjects;

  /// No description provided for @viewMore.
  ///
  /// In en, this message translates to:
  /// **'View more'**
  String get viewMore;

  /// No description provided for @addNewProject.
  ///
  /// In en, this message translates to:
  /// **'Add New Project'**
  String get addNewProject;

  /// No description provided for @projectName.
  ///
  /// In en, this message translates to:
  /// **'Project Name'**
  String get projectName;

  /// No description provided for @projectAddress.
  ///
  /// In en, this message translates to:
  /// **'Project Address'**
  String get projectAddress;

  /// No description provided for @contactNumber.
  ///
  /// In en, this message translates to:
  /// **'Contact Number'**
  String get contactNumber;

  /// No description provided for @accountSystem.
  ///
  /// In en, this message translates to:
  /// **'Account System'**
  String get accountSystem;

  /// No description provided for @percentageOrAmount.
  ///
  /// In en, this message translates to:
  /// **'Percentage or amount'**
  String get percentageOrAmount;

  /// No description provided for @percentage.
  ///
  /// In en, this message translates to:
  /// **'Percentage'**
  String get percentage;

  /// No description provided for @rate.
  ///
  /// In en, this message translates to:
  /// **'Rate'**
  String get rate;

  /// No description provided for @value.
  ///
  /// In en, this message translates to:
  /// **'Value'**
  String get value;

  /// No description provided for @contract.
  ///
  /// In en, this message translates to:
  /// **'Contract'**
  String get contract;

  /// No description provided for @finishProject.
  ///
  /// In en, this message translates to:
  /// **'Finish project'**
  String get finishProject;

  /// No description provided for @finishProjectConfirm.
  ///
  /// In en, this message translates to:
  /// **'Please confirm the completion of the project'**
  String get finishProjectConfirm;

  /// No description provided for @deleteProject.
  ///
  /// In en, this message translates to:
  /// **'Delete project'**
  String get deleteProject;

  /// No description provided for @deleteProjectConfirm.
  ///
  /// In en, this message translates to:
  /// **'Please confirm deletion of the project'**
  String get deleteProjectConfirm;

  /// No description provided for @activeEdit.
  ///
  /// In en, this message translates to:
  /// **'Please activate the modification first from the settings above'**
  String get activeEdit;

  /// No description provided for @edit.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get edit;

  /// No description provided for @delete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get delete;

  /// No description provided for @deleteConfirm.
  ///
  /// In en, this message translates to:
  /// **'Please confirm deletion'**
  String get deleteConfirm;

  /// No description provided for @projectExport.
  ///
  /// In en, this message translates to:
  /// **'Project export'**
  String get projectExport;

  /// No description provided for @projectExportConfirm.
  ///
  /// In en, this message translates to:
  /// **'Please confirm the project export'**
  String get projectExportConfirm;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @confirm.
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get confirm;

  /// No description provided for @description.
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get description;

  /// No description provided for @home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// No description provided for @myTransactions.
  ///
  /// In en, this message translates to:
  /// **'My Transactions'**
  String get myTransactions;

  /// No description provided for @logout.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get logout;

  /// No description provided for @duePayments.
  ///
  /// In en, this message translates to:
  /// **'Due payments'**
  String get duePayments;

  /// No description provided for @supervisorPledge.
  ///
  /// In en, this message translates to:
  /// **'Supervisor \'s pledge'**
  String get supervisorPledge;

  /// No description provided for @expenses.
  ///
  /// In en, this message translates to:
  /// **'Expenses'**
  String get expenses;

  /// No description provided for @actualRevenue.
  ///
  /// In en, this message translates to:
  /// **'Actual revenue'**
  String get actualRevenue;

  /// No description provided for @search.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get search;

  /// No description provided for @addPayments.
  ///
  /// In en, this message translates to:
  /// **'Add payments'**
  String get addPayments;

  /// No description provided for @addExpenses.
  ///
  /// In en, this message translates to:
  /// **'Add expenses'**
  String get addExpenses;

  /// No description provided for @addBatches.
  ///
  /// In en, this message translates to:
  /// **'Add batches'**
  String get addBatches;

  /// No description provided for @mainItem.
  ///
  /// In en, this message translates to:
  /// **'Main item'**
  String get mainItem;

  /// No description provided for @subItem.
  ///
  /// In en, this message translates to:
  /// **'Sub item'**
  String get subItem;

  /// No description provided for @batchesNo.
  ///
  /// In en, this message translates to:
  /// **'Batch Number'**
  String get batchesNo;

  /// No description provided for @paymentNumber.
  ///
  /// In en, this message translates to:
  /// **'Payment number'**
  String get paymentNumber;

  /// No description provided for @project.
  ///
  /// In en, this message translates to:
  /// **'The project'**
  String get project;

  /// No description provided for @moreDetails.
  ///
  /// In en, this message translates to:
  /// **'More details'**
  String get moreDetails;

  /// No description provided for @addImageCheck.
  ///
  /// In en, this message translates to:
  /// **'Add an image of a check or bank transfer'**
  String get addImageCheck;

  /// No description provided for @selectOption.
  ///
  /// In en, this message translates to:
  /// **'Select an option'**
  String get selectOption;

  /// No description provided for @cameraGallery.
  ///
  /// In en, this message translates to:
  /// **'Do you want to pick an image from camera or gallery?'**
  String get cameraGallery;

  /// No description provided for @camera.
  ///
  /// In en, this message translates to:
  /// **'Camera'**
  String get camera;

  /// No description provided for @gallery.
  ///
  /// In en, this message translates to:
  /// **'Gallery'**
  String get gallery;

  /// No description provided for @noImageSelected.
  ///
  /// In en, this message translates to:
  /// **'No image selected'**
  String get noImageSelected;

  /// No description provided for @viewImage.
  ///
  /// In en, this message translates to:
  /// **'View the image'**
  String get viewImage;

  /// No description provided for @allProjects.
  ///
  /// In en, this message translates to:
  /// **'All Projects'**
  String get allProjects;

  /// No description provided for @projectDetails.
  ///
  /// In en, this message translates to:
  /// **'Project Details'**
  String get projectDetails;

  /// No description provided for @payments.
  ///
  /// In en, this message translates to:
  /// **'Payments'**
  String get payments;

  /// No description provided for @payment.
  ///
  /// In en, this message translates to:
  /// **'Payment'**
  String get payment;

  /// No description provided for @clause.
  ///
  /// In en, this message translates to:
  /// **'Clause'**
  String get clause;

  /// No description provided for @subclause.
  ///
  /// In en, this message translates to:
  /// **'Subclause'**
  String get subclause;

  /// No description provided for @expensesDetails.
  ///
  /// In en, this message translates to:
  /// **'Expenses details'**
  String get expensesDetails;

  /// No description provided for @batchDetails.
  ///
  /// In en, this message translates to:
  /// **'Batch Details'**
  String get batchDetails;

  /// No description provided for @batchNumber.
  ///
  /// In en, this message translates to:
  /// **'Batch Number'**
  String get batchNumber;

  /// No description provided for @batchesValue.
  ///
  /// In en, this message translates to:
  /// **'Batch Value'**
  String get batchesValue;

  /// No description provided for @batchImage.
  ///
  /// In en, this message translates to:
  /// **'Batch image'**
  String get batchImage;

  /// No description provided for @bill.
  ///
  /// In en, this message translates to:
  /// **'Bill'**
  String get bill;

  /// No description provided for @change.
  ///
  /// In en, this message translates to:
  /// **'change'**
  String get change;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// No description provided for @phone.
  ///
  /// In en, this message translates to:
  /// **'phone'**
  String get phone;

  /// No description provided for @company.
  ///
  /// In en, this message translates to:
  /// **'Company'**
  String get company;

  /// No description provided for @birthDate.
  ///
  /// In en, this message translates to:
  /// **'Birth Date'**
  String get birthDate;

  /// No description provided for @gender.
  ///
  /// In en, this message translates to:
  /// **'Gender'**
  String get gender;

  /// No description provided for @country.
  ///
  /// In en, this message translates to:
  /// **'Country'**
  String get country;

  /// No description provided for @logInNow.
  ///
  /// In en, this message translates to:
  /// **'Log in now'**
  String get logInNow;

  /// No description provided for @phoneOrEmail.
  ///
  /// In en, this message translates to:
  /// **'Phone number / email'**
  String get phoneOrEmail;

  /// No description provided for @haveNoAcc.
  ///
  /// In en, this message translates to:
  /// **'Don\'t have an account with us?'**
  String get haveNoAcc;

  /// No description provided for @registerNow.
  ///
  /// In en, this message translates to:
  /// **'Register now'**
  String get registerNow;

  /// No description provided for @register.
  ///
  /// In en, this message translates to:
  /// **'Register'**
  String get register;

  /// No description provided for @registerAccount.
  ///
  /// In en, this message translates to:
  /// **'Register a new account'**
  String get registerAccount;

  /// No description provided for @confirmPassword.
  ///
  /// In en, this message translates to:
  /// **'Confirm password'**
  String get confirmPassword;

  /// No description provided for @haveAccount.
  ///
  /// In en, this message translates to:
  /// **'Do you have an account? '**
  String get haveAccount;

  /// No description provided for @send.
  ///
  /// In en, this message translates to:
  /// **'Send'**
  String get send;

  /// No description provided for @verification.
  ///
  /// In en, this message translates to:
  /// **'Verification'**
  String get verification;

  /// No description provided for @enterCode.
  ///
  /// In en, this message translates to:
  /// **'Enter the code'**
  String get enterCode;

  /// No description provided for @codeSent.
  ///
  /// In en, this message translates to:
  /// **'A 6-digit code was sent to \nYour email '**
  String get codeSent;

  /// No description provided for @digitCode.
  ///
  /// In en, this message translates to:
  /// **'6-digit code'**
  String get digitCode;

  /// No description provided for @resetPassword.
  ///
  /// In en, this message translates to:
  /// **'Reset Password'**
  String get resetPassword;

  /// No description provided for @newPassword.
  ///
  /// In en, this message translates to:
  /// **'New password'**
  String get newPassword;

  /// No description provided for @confirmNewPassword.
  ///
  /// In en, this message translates to:
  /// **'Confirm New password'**
  String get confirmNewPassword;

  /// No description provided for @phoneOrEmailError.
  ///
  /// In en, this message translates to:
  /// **'Phone number/email required'**
  String get phoneOrEmailError;

  /// No description provided for @verificationCodeError.
  ///
  /// In en, this message translates to:
  /// **'Your verification code is required'**
  String get verificationCodeError;

  /// No description provided for @nameError.
  ///
  /// In en, this message translates to:
  /// **'Name required'**
  String get nameError;

  /// No description provided for @conPasswordError.
  ///
  /// In en, this message translates to:
  /// **'Confirm password required'**
  String get conPasswordError;

  /// No description provided for @matchPasswordError.
  ///
  /// In en, this message translates to:
  /// **'The password and confirmation password do not match'**
  String get matchPasswordError;

  /// No description provided for @emailError.
  ///
  /// In en, this message translates to:
  /// **'Email required'**
  String get emailError;

  /// No description provided for @phoneError.
  ///
  /// In en, this message translates to:
  /// **'Phone required'**
  String get phoneError;

  /// No description provided for @messageError.
  ///
  /// In en, this message translates to:
  /// **'The contact us message is required'**
  String get messageError;

  /// No description provided for @companyError.
  ///
  /// In en, this message translates to:
  /// **'Company required'**
  String get companyError;

  /// No description provided for @birthDateError.
  ///
  /// In en, this message translates to:
  /// **'BirthDate required'**
  String get birthDateError;

  /// No description provided for @genderError.
  ///
  /// In en, this message translates to:
  /// **'Gender required'**
  String get genderError;

  /// No description provided for @countryError.
  ///
  /// In en, this message translates to:
  /// **'Country required'**
  String get countryError;

  /// No description provided for @male.
  ///
  /// In en, this message translates to:
  /// **'Male'**
  String get male;

  /// No description provided for @female.
  ///
  /// In en, this message translates to:
  /// **'Female'**
  String get female;

  /// No description provided for @projectNameError.
  ///
  /// In en, this message translates to:
  /// **'Project name is required'**
  String get projectNameError;

  /// No description provided for @projectAddressError.
  ///
  /// In en, this message translates to:
  /// **'Project address is required'**
  String get projectAddressError;

  /// No description provided for @contactNumberError.
  ///
  /// In en, this message translates to:
  /// **'Contact number is required'**
  String get contactNumberError;

  /// No description provided for @accountSystemError.
  ///
  /// In en, this message translates to:
  /// **'Account System is required'**
  String get accountSystemError;

  /// No description provided for @percentageError.
  ///
  /// In en, this message translates to:
  /// **'Percentage or amount'**
  String get percentageError;

  /// No description provided for @amountError.
  ///
  /// In en, this message translates to:
  /// **'Amount is required'**
  String get amountError;

  /// No description provided for @dateError.
  ///
  /// In en, this message translates to:
  /// **'Date is required'**
  String get dateError;

  /// No description provided for @itemError.
  ///
  /// In en, this message translates to:
  /// **'Item is required'**
  String get itemError;

  /// No description provided for @batchNoError.
  ///
  /// In en, this message translates to:
  /// **'Batch Number is required'**
  String get batchNoError;

  /// No description provided for @dues.
  ///
  /// In en, this message translates to:
  /// **'Dues'**
  String get dues;

  /// No description provided for @changeLanguage.
  ///
  /// In en, this message translates to:
  /// **'Change language'**
  String get changeLanguage;

  /// No description provided for @english.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get english;

  /// No description provided for @arabic.
  ///
  /// In en, this message translates to:
  /// **'Arabic'**
  String get arabic;

  /// No description provided for @test.
  ///
  /// In en, this message translates to:
  /// **'test'**
  String get test;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar': return AppLocalizationsAr();
    case 'en': return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
