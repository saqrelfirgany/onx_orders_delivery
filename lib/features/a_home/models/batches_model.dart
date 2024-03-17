class BatchesModel {
  dynamic batchesId;
  dynamic customersId;
  dynamic projectsId;
  dynamic batchesNo;
  dynamic batchesValue;
  dynamic batchesDate;
  dynamic batchesImage;
  dynamic batchesDesc;
  dynamic batchesCreatedAt;
  dynamic batchesUpdatedAt;

  BatchesModel({
    this.batchesId,
    this.customersId,
    this.projectsId,
    this.batchesNo,
    this.batchesValue,
    this.batchesDate,
    this.batchesImage,
    this.batchesDesc,
    this.batchesCreatedAt,
    this.batchesUpdatedAt,
  });

  BatchesModel.fromJson(Map<String, dynamic> json) {
    batchesId = json['batches_id'];
    customersId = json['customers_id'];
    projectsId = json['projects_id'];
    batchesNo = json['batches_no'];
    batchesValue = json['batches_value'];
    batchesDate = json['batches_date'];
    batchesImage = json['batches_image'];
    batchesDesc = json['batches_desc'];
    batchesCreatedAt = json['batches_created_at'];
    batchesUpdatedAt = json['batches_updated_at'];
  }
}
