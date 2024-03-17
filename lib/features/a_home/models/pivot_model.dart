class PivotModel {
  dynamic projectsId;
  dynamic customersId;
  dynamic customersProjectsType;

  PivotModel({this.projectsId, this.customersId, this.customersProjectsType});

  PivotModel.fromJson(Map<String, dynamic> json) {
    projectsId = json['projects_id'];
    customersId = json['customers_id'];
    customersProjectsType = json['customers_projects_type'];
  }
}
