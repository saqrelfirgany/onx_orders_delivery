part of 'home_cubit.dart';

class HomeState extends Equatable {
  const HomeState({
    this.submissionStatus = SubmissionStatus.idle,
    this.loadingProjects,
  });

  final bool? loadingProjects;

  get isLoadingProjects => loadingProjects ?? false;

  final SubmissionStatus submissionStatus;

  HomeState copyWith({
    SubmissionStatus? submissionStatus,
  }) {
    return HomeState(
      submissionStatus: submissionStatus ?? this.submissionStatus,
    );
  }

  HomeState copyWithLoadingProjects({
    bool? loadingProjects,
  }) {
    return HomeState(
      loadingProjects: loadingProjects ?? this.loadingProjects,
    );
  }

  @override
  List<Object?> get props => [
        submissionStatus,
        loadingProjects,
      ];
}
