import 'batches_model.dart';
import 'cash_flows_model.dart';
import 'expenses_model.dart';
import 'members_model.dart';

class ProjectDetailsModel {
  dynamic projectsId;
  dynamic projectsStatus;
  dynamic projectsName;
  dynamic projectsAddress;
  dynamic projectsContactPhone;
  dynamic projectsAccountingSystem;
  dynamic projectsValue;
  dynamic projectsDescription;
  dynamic customersId;
  dynamic projectsCreatedAt;
  dynamic projectsUpdatedAt;
  dynamic projectsTotalCashFlows;
  dynamic projectsTotalExpenses;
  dynamic projectsTotalBatches;
  dynamic projectsAmountsOwed;
  List<MembersModel>? members;
  List<ExpensesModel>? expenses;
  List<BatchesModel>? batches;
  List<CashFlowsModel>? cashFlows;

  ProjectDetailsModel({
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
    this.projectsTotalCashFlows,
    this.projectsTotalExpenses,
    this.projectsTotalBatches,
    this.projectsAmountsOwed,
    this.members,
    this.expenses,
    this.batches,
    this.cashFlows,
  });

  ProjectDetailsModel.fromJson(Map<String, dynamic> json) {
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
    projectsTotalCashFlows = json['projects_total_cash_flows'];
    projectsTotalExpenses = json['projects_total_expenses'];
    projectsTotalBatches = json['projects_total_batches'];
    projectsAmountsOwed = json['projects_amounts_owed'];
    if (json['members'] != null) {
      members = <MembersModel>[];
      json['members'].forEach((v) {
        members!.add(MembersModel.fromJson(v));
      });
    }
    if (json['expenses'] != null) {
      expenses = <ExpensesModel>[];
      json['expenses'].forEach((v) {
        expenses!.add(ExpensesModel.fromJson(v));
      });
    }
    if (json['batches'] != null) {
      batches = <BatchesModel>[];
      json['batches'].forEach((v) {
        batches!.add(BatchesModel.fromJson(v));
      });
    }
    if (json['cash_flows'] != null) {
      cashFlows = <CashFlowsModel>[];
      json['cash_flows'].forEach((v) {
        cashFlows!.add(CashFlowsModel.fromJson(v));
      });
    }
  }
}
