class InfoModel {
  dynamic infosKey;
  dynamic infosTitle;
  dynamic infosDesc;

  InfoModel({this.infosKey, this.infosTitle, this.infosDesc});

  InfoModel.fromJson(Map<String, dynamic> json) {
    infosKey = json['infos_key'];
    infosTitle = json['infos_title'];
    infosDesc = json['infos_desc'];
  }
}
