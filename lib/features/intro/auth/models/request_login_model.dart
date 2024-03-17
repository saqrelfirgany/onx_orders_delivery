class RequestLoginModel {
  Value? value;

  RequestLoginModel({this.value});

  RequestLoginModel.fromJson(Map<String, dynamic> json) {
    value = json['Value'] != null ? new Value.fromJson(json['Value']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.value != null) {
      data['Value'] = this.value!.toJson();
    }
    return data;
  }
}

class Value {
  String? pLANGNO;
  String? pDLVRYNO;
  String? pPSSWRD;

  Value({this.pLANGNO, this.pDLVRYNO, this.pPSSWRD});

  Value.fromJson(Map<String, dynamic> json) {
    pLANGNO = json['P_LANG_NO'];
    pDLVRYNO = json['P_DLVRY_NO'];
    pPSSWRD = json['P_PSSWRD'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['P_LANG_NO'] = this.pLANGNO;
    data['P_DLVRY_NO'] = this.pDLVRYNO;
    data['P_PSSWRD'] = this.pPSSWRD;
    return data;
  }
}
