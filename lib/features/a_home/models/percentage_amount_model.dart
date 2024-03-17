class CountryModel {
  dynamic id;
  dynamic name;

  CountryModel({this.id, this.name});

  CountryModel.fromJson(Map<String, dynamic> json) {
    id = json['countries_id'];
    name = json['countries_name'];
  }
}
