class ExpensesModel {
  dynamic expensesId;
  dynamic customersId;
  dynamic projectsId;
  dynamic itemsId;
  dynamic subItemsId;
  dynamic expensesImage;
  dynamic expensesValue;
  dynamic expensesDate;
  dynamic expensesCreatedAt;
  dynamic expensesUpdatedAt;
  dynamic expensesDesc;

  ExpensesModel({
    this.expensesId,
    this.customersId,
    this.projectsId,
    this.itemsId,
    this.subItemsId,
    this.expensesImage,
    this.expensesValue,
    this.expensesDate,
    this.expensesCreatedAt,
    this.expensesUpdatedAt,
    this.expensesDesc,
  });

  ExpensesModel.fromJson(Map<String, dynamic> json) {
    expensesId = json['expenses_id'];
    customersId = json['customers_id'];
    projectsId = json['projects_id'];
    itemsId = json['items_id'];
    subItemsId = json['sub_items_id'];
    expensesImage = json['expenses_image'];
    expensesValue = json['expenses_value'];
    expensesDate = json['expenses_date'];
    expensesCreatedAt = json['expenses_created_at'];
    expensesUpdatedAt = json['expenses_updated_at'];
    expensesDesc = json['expenses_desc'];
  }
}
