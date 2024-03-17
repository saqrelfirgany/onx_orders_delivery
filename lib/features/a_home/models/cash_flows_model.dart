class CashFlowsModel {
  dynamic cashFlowsId;
  dynamic customersId;
  dynamic supervisorId;
  dynamic projectsId;
  dynamic cashFlowsValue;
  dynamic cashFlowsDate;
  dynamic cashFlowsDesc;
  dynamic cashFlowsCreatedAt;
  dynamic cashFlowsUpdatedAt;

  CashFlowsModel({
    this.cashFlowsId,
    this.customersId,
    this.supervisorId,
    this.projectsId,
    this.cashFlowsValue,
    this.cashFlowsDate,
    this.cashFlowsDesc,
    this.cashFlowsCreatedAt,
    this.cashFlowsUpdatedAt,
  });

  CashFlowsModel.fromJson(Map<String, dynamic> json) {
    cashFlowsId = json['cash_flows_id'];
    customersId = json['customers_id'];
    supervisorId = json['supervisor_id'];
    projectsId = json['projects_id'];
    cashFlowsValue = json['cash_flows_value'];
    cashFlowsDate = json['cash_flows_date'];
    cashFlowsDesc = json['cash_flows_desc'];
    cashFlowsCreatedAt = json['cash_flows_created_at'];
    cashFlowsUpdatedAt = json['cash_flows_updated_at'];
  }
}
