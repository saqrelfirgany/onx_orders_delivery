class ContactsModel {
  dynamic contactsPhone;
  dynamic contactsWhatsapp;
  dynamic contactsFacebook;
  dynamic contactsTwitter;
  dynamic contactsInstagram;
  dynamic contactsSnapchat;
  dynamic contactsYoutube;
  dynamic contactsEmail;
  dynamic contactsAddress;
  dynamic contactsText;

  ContactsModel({
    this.contactsPhone,
    this.contactsWhatsapp,
    this.contactsFacebook,
    this.contactsTwitter,
    this.contactsInstagram,
    this.contactsSnapchat,
    this.contactsYoutube,
    this.contactsEmail,
    this.contactsAddress,
    this.contactsText,
  });

  ContactsModel.fromJson(Map<String, dynamic> json) {
    contactsPhone = json['contacts_phone'];
    contactsWhatsapp = json['contacts_whatsapp'];
    contactsFacebook = json['contacts_facebook'];
    contactsTwitter = json['contacts_twitter'];
    contactsInstagram = json['contacts_instagram'];
    contactsSnapchat = json['contacts_snapchat'];
    contactsYoutube = json['contacts_youtube'];
    contactsEmail = json['contacts_email'];
    contactsAddress = json['contacts_address'];
    contactsText = json['contacts_text'];
  }
}
