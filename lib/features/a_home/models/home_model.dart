class HomeModel {
  Data? data;
  Result? result;

  HomeModel({
    this.data,
    this.result,
  });

  HomeModel.fromJson(Map<String, dynamic> json) {
    data = json['Data'] != null ? new Data.fromJson(json['Data']) : null;
    result = json['Result'] != null ? new Result.fromJson(json['Result']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['Data'] = this.data!.toJson();
    }
    if (this.result != null) {
      data['Result'] = this.result!.toJson();
    }
    return data;
  }
}

class Data {
  List<DeliveryBills>? deliveryBills;

  Data({this.deliveryBills});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['DeliveryBills'] != null) {
      deliveryBills = <DeliveryBills>[];
      json['DeliveryBills'].forEach((v) {
        deliveryBills!.add(new DeliveryBills.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.deliveryBills != null) {
      data['DeliveryBills'] = this.deliveryBills!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DeliveryBills {
  String? bILLAMT;
  double? doubleBILLAMT;
  String? bILLDATE;
  String? bILLNO;
  String? bILLSRL;
  String? bILLTIME;
  String? bILLTYPE;
  String? cSTMRADDRSS;
  String? cSTMRAPRTMNTNO;
  String? cSTMRBUILDNO;
  String? cSTMRFLOORNO;
  String? cSTMRNM;
  String? dLVRYAMT;
  String? dLVRYSTATUSFLG;
  String? lATITUDE;
  String? lONGITUDE;
  String? mOBILENO;
  String? rGNNM;
  String? tAXAMT;

  DeliveryBills({
    this.bILLAMT,
    this.doubleBILLAMT,
    this.bILLDATE,
    this.bILLNO,
    this.bILLSRL,
    this.bILLTIME,
    this.bILLTYPE,
    this.cSTMRADDRSS,
    this.cSTMRAPRTMNTNO,
    this.cSTMRBUILDNO,
    this.cSTMRFLOORNO,
    this.cSTMRNM,
    this.dLVRYAMT,
    this.dLVRYSTATUSFLG,
    this.lATITUDE,
    this.lONGITUDE,
    this.mOBILENO,
    this.rGNNM,
    this.tAXAMT,
  });

  DeliveryBills.fromJson(Map<String, dynamic> json) {
    bILLAMT = json['BILL_AMT'];
    doubleBILLAMT = double.parse(json['BILL_AMT']);
    bILLDATE = json['BILL_DATE'];
    bILLNO = json['BILL_NO'];
    bILLSRL = json['BILL_SRL'];
    bILLTIME = json['BILL_TIME'];
    bILLTYPE = json['BILL_TYPE'];
    cSTMRADDRSS = json['CSTMR_ADDRSS'];
    cSTMRAPRTMNTNO = json['CSTMR_APRTMNT_NO'];
    cSTMRBUILDNO = json['CSTMR_BUILD_NO'];
    cSTMRFLOORNO = json['CSTMR_FLOOR_NO'];
    cSTMRNM = json['CSTMR_NM'];
    dLVRYAMT = json['DLVRY_AMT'];
    dLVRYSTATUSFLG = json['DLVRY_STATUS_FLG'];
    lATITUDE = json['LATITUDE'];
    lONGITUDE = json['LONGITUDE'];
    mOBILENO = json['MOBILE_NO'];
    rGNNM = json['RGN_NM'];
    tAXAMT = json['TAX_AMT'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['BILL_AMT'] = this.bILLAMT;
    data['BILL_DATE'] = this.bILLDATE;
    data['BILL_NO'] = this.bILLNO;
    data['BILL_SRL'] = this.bILLSRL;
    data['BILL_TIME'] = this.bILLTIME;
    data['BILL_TYPE'] = this.bILLTYPE;
    data['CSTMR_ADDRSS'] = this.cSTMRADDRSS;
    data['CSTMR_APRTMNT_NO'] = this.cSTMRAPRTMNTNO;
    data['CSTMR_BUILD_NO'] = this.cSTMRBUILDNO;
    data['CSTMR_FLOOR_NO'] = this.cSTMRFLOORNO;
    data['CSTMR_NM'] = this.cSTMRNM;
    data['DLVRY_AMT'] = this.dLVRYAMT;
    data['DLVRY_STATUS_FLG'] = this.dLVRYSTATUSFLG;
    data['LATITUDE'] = this.lATITUDE;
    data['LONGITUDE'] = this.lONGITUDE;
    data['MOBILE_NO'] = this.mOBILENO;
    data['RGN_NM'] = this.rGNNM;
    data['TAX_AMT'] = this.tAXAMT;
    return data;
  }
}

class Result {
  String? errMsg;
  int? errNo;

  Result({this.errMsg, this.errNo});

  Result.fromJson(Map<String, dynamic> json) {
    errMsg = json['ErrMsg'];
    errNo = json['ErrNo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ErrMsg'] = this.errMsg;
    data['ErrNo'] = this.errNo;
    return data;
  }
}
