part of 'verification_cubit.dart';

class VerificationState extends Equatable {
  const VerificationState({
    this.submissionStatus = SubmissionStatus.idle,
  });

  final SubmissionStatus submissionStatus;

  VerificationState copyWith({
    SubmissionStatus? submissionStatus,
  }) {
    return VerificationState(
      submissionStatus: submissionStatus ?? this.submissionStatus,
    );
  }

  @override
  List<Object?> get props => [
        submissionStatus,
      ];
}
