class ProjectModel {
  int? projectsId;
  String? projectsStatus;
  String? projectsName;
  String? projectsAddress;
  String? projectsContactPhone;
  String? projectsAccountingSystem;
  String? projectsValue;
  String? projectsDescription;
  int? customersId;
  String? projectsCreatedAt;
  String? projectsUpdatedAt;

  ProjectModel({
    this.projectsId,
    this.projectsStatus,
    this.projectsName,
    this.projectsAddress,
    this.projectsContactPhone,
    this.projectsAccountingSystem,
    this.projectsValue,
    this.projectsDescription,
    this.customersId,
    this.projectsCreatedAt,
    this.projectsUpdatedAt,
  });

  ProjectModel.fromJson(Map<String, dynamic> json) {
    projectsId = json['projects_id'];
    projectsStatus = json['projects_status'];
    projectsName = json['projects_name'];
    projectsAddress = json['projects_address'];
    projectsContactPhone = json['projects_contact_phone'];
    projectsAccountingSystem = json['projects_accounting_system'];
    projectsValue = json['projects_value'];
    projectsDescription = json['projects_description'];
    customersId = json['customers_id'];
    projectsCreatedAt = json['projects_created_at'];
    projectsUpdatedAt = json['projects_updated_at'];
  }
}
