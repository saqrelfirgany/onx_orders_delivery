import 'pivot_model.dart';

class MembersModel {
  dynamic customersId;
  dynamic customersName;
  dynamic customersCountryCode;
  dynamic customersPhone;
  dynamic customersEmail;
  dynamic countriesId;
  dynamic customersBirthdate;
  dynamic customersGender;
  dynamic customersCompany;
  dynamic customersImage;
  dynamic customersStatus;
  dynamic phoneVerified;
  dynamic emailVerified;
  dynamic customersCreatedAt;
  dynamic customersUpdatedAt;
  PivotModel? pivot;

  MembersModel({
    this.customersId,
    this.customersName,
    this.customersCountryCode,
    this.customersPhone,
    this.customersEmail,
    this.countriesId,
    this.customersBirthdate,
    this.customersGender,
    this.customersCompany,
    this.customersImage,
    this.customersStatus,
    this.phoneVerified,
    this.emailVerified,
    this.customersCreatedAt,
    this.customersUpdatedAt,
    this.pivot,
  });

  MembersModel.fromJson(Map<String, dynamic> json) {
    customersId = json['customers_id'];
    customersName = json['customers_name'];
    customersCountryCode = json['customers_country_code'];
    customersPhone = json['customers_phone'];
    customersEmail = json['customers_email'];
    countriesId = json['countries_id'];
    customersBirthdate = json['customers_birthdate'];
    customersGender = json['customers_gender'];
    customersCompany = json['customers_company'];
    customersImage = json['customers_image'];
    customersStatus = json['customers_status'];
    phoneVerified = json['phone_verified'];
    emailVerified = json['email_verified'];
    customersCreatedAt = json['customers_created_at'];
    customersUpdatedAt = json['customers_updated_at'];
    pivot = json['pivot'] != null ? PivotModel.fromJson(json['pivot']) : null;
  }
}
