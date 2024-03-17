part of 'info_cubit.dart';

class InfoState extends Equatable {
  const InfoState({
    this.submissionStatus = SubmissionStatus.idle,
    this.loadingProjects,
    this.loadingPickDate,
  });

  final bool? loadingProjects;
  final bool? loadingPickDate;

  get isLoadingProjects => loadingProjects ?? false;

  get isLoadingPickDate => loadingPickDate ?? false;

  final SubmissionStatus submissionStatus;

  InfoState copyWith({
    SubmissionStatus? submissionStatus,
  }) {
    return InfoState(
      submissionStatus: submissionStatus ?? this.submissionStatus,
    );
  }

  InfoState copyWithLoadingProjects({
    bool? loadingProjects,
  }) {
    return InfoState(
      loadingProjects: loadingProjects ?? this.loadingProjects,
    );
  }

  InfoState copyWithPickDate({required bool loading}) {
    return InfoState(
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
