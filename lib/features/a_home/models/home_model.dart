class HomeModel {
  List<ChildsBalance>? childsBalance;
  dynamic activities;

  HomeModel({this.childsBalance, this.activities});

  HomeModel.fromJson(Map<String, dynamic> json) {
    if (json['childs_balance'] != null) {
      childsBalance = <ChildsBalance>[];
      json['childs_balance'].forEach((v) {
        childsBalance!.add(new ChildsBalance.fromJson(v));
      });
    }
    activities = json['activities'];
  }
}

class ChildsBalance {
  dynamic childsId;
  dynamic childsName;
  dynamic childsBalance;
  dynamic childsImage;

  ChildsBalance({this.childsId, this.childsName, this.childsBalance, this.childsImage});

  ChildsBalance.fromJson(Map<String, dynamic> json) {
    childsId = json['childs_id'];
    childsName = json['childs_name'];
    childsBalance = json['childs_balance'];
    childsImage = json['childs_image'];
  }
}
