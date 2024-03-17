part of 'Settings_cubit.dart';

class SettingsState extends Equatable {
  const SettingsState({
    this.submissionStatus = SubmissionStatus.idle,
    this.loadingProjects,
    this.loadingPickDate,
  });

  final bool? loadingProjects;
  final bool? loadingPickDate;

  get isLoadingProjects => loadingProjects ?? false;

  get isLoadingPickDate => loadingPickDate ?? false;

  final SubmissionStatus submissionStatus;

  SettingsState copyWith({
    SubmissionStatus? submissionStatus,
  }) {
    return SettingsState(
      submissionStatus: submissionStatus ?? this.submissionStatus,
    );
  }

  SettingsState copyWithLoadingProjects({
    bool? loadingProjects,
  }) {
    return SettingsState(
      loadingProjects: loadingProjects ?? this.loadingProjects,
    );
  }

  SettingsState copyWithPickDate({required bool loading}) {
    return SettingsState(
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
