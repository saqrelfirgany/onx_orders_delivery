part of 'phone_number_cubit.dart';

class PhoneNumberState extends Equatable {
  const PhoneNumberState({
    this.submissionStatus = SubmissionStatus.idle,
    this.loadingProjects,
    this.loadingPickDate,
  });

  final bool? loadingProjects;
  final bool? loadingPickDate;

  get isLoadingProjects => loadingProjects ?? false;

  get isLoadingPickDate => loadingPickDate ?? false;

  final SubmissionStatus submissionStatus;

  PhoneNumberState copyWith({
    SubmissionStatus? submissionStatus,
  }) {
    return PhoneNumberState(
      submissionStatus: submissionStatus ?? this.submissionStatus,
    );
  }

  PhoneNumberState copyWithLoadingProjects({
    bool? loadingProjects,
  }) {
    return PhoneNumberState(
      loadingProjects: loadingProjects ?? this.loadingProjects,
    );
  }

  PhoneNumberState copyWithPickDate({required bool loading}) {
    return PhoneNumberState(
      loadingPickDate: loading,
    );
  }

  @override
  List<Object?> get props => [
        submissionStatus,
        loadingProjects,
        loadingPickDate,
      ];
}
