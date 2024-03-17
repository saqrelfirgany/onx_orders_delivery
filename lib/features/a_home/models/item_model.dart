class ItemsModel {
  dynamic id;
  dynamic name;
  List<SubItemsModel>? subItems;

  ItemsModel({this.id, this.name, this.subItems});

  ItemsModel.fromJson(Map<String, dynamic> json) {
    id = json['items_id'];
    name = json['items_name'];
    if (json['sub_items'] != null) {
      subItems = <SubItemsModel>[];
      json['sub_items'].forEach((v) {
        subItems!.add(SubItemsModel.fromJson(v));
      });
    }
  }
}

class SubItemsModel {
  dynamic id;
  dynamic name;

  SubItemsModel({this.id, this.name});

  SubItemsModel.fromJson(Map<String, dynamic> json) {
    id = json['sub_items_id'];
    name = json['sub_items_title'];
  }
}
