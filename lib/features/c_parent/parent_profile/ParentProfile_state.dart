part of 'ParentProfile_cubit.dart';

class ParentProfileState extends Equatable {
  const ParentProfileState({
    this.submissionStatus = SubmissionStatus.idle,
    this.loadingProjects,
  });

  final bool? loadingProjects;

  get isLoadingProjects => loadingProjects ?? false;

  final SubmissionStatus submissionStatus;

  ParentProfileState copyWith({
    SubmissionStatus? submissionStatus,
  }) {
    return ParentProfileState(
      submissionStatus: submissionStatus ?? this.submissionStatus,
    );
  }

  ParentProfileState copyWithLoadingProjects({
    bool? loadingProjects,
  }) {
    return ParentProfileState(
      loadingProjects: loadingProjects ?? this.loadingProjects,
    );
  }

  @override
  List<Object?> get props => [
        submissionStatus,
        loadingProjects,
      ];
}
