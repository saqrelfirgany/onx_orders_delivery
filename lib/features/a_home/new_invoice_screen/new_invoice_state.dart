part of 'new_invoice_cubit.dart';

class RechargeState extends Equatable {
  const RechargeState({
    this.submissionStatus = SubmissionStatus.idle,
    this.loadingProjects,
  });

  final bool? loadingProjects;

  get isLoadingProjects => loadingProjects ?? false;

  final SubmissionStatus submissionStatus;

  RechargeState copyWith({
    SubmissionStatus? submissionStatus,
  }) {
    return RechargeState(
      submissionStatus: submissionStatus ?? this.submissionStatus,
    );
  }

  RechargeState copyWithLoadingProjects({
    bool? loadingProjects,
  }) {
    return RechargeState(
      loadingProjects: loadingProjects ?? this.loadingProjects,
    );
  }

  @override
  List<Object?> get props => [
        submissionStatus,
        loadingProjects,
      ];
}
