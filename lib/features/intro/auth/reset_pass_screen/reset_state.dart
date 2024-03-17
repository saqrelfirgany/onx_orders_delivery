part of 'reset_cubit.dart';

class ResetState extends Equatable {
  const ResetState({
    this.submissionStatus = SubmissionStatus.idle,
  });

  final SubmissionStatus submissionStatus;

  ResetState copyWith({
    SubmissionStatus? submissionStatus,
  }) {
    return ResetState(
      submissionStatus: submissionStatus ?? this.submissionStatus,
    );
  }

  @override
  List<Object?> get props => [
        submissionStatus,
      ];
}

enum SubmissionStatus {
  /// Used when the form has not been sent yet.
  idle,

  /// Used to disable all buttons and add a progress indicator to the main one.
  inProgress,

  /// Used to close the screen and navigate back to the caller screen.
  success,

  /// Used to display a generic snack bar saying that an error has occurred, e.g., no internet connection.
  genericError,

  /// Used to show a more specific error telling the user they got the email and/or password wrong.
  invalidCredentialsError,
}
