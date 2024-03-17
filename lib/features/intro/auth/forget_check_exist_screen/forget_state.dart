part of 'forget_cubit.dart';

class ForgetState extends Equatable {
  const ForgetState({
    this.submissionStatus = SubmissionStatus.idle,
  });

  final SubmissionStatus submissionStatus;

  ForgetState copyWith({
    SubmissionStatus? submissionStatus,
  }) {
    return ForgetState(
      submissionStatus: submissionStatus ?? this.submissionStatus,
    );
  }

  @override
  List<Object?> get props => [
        submissionStatus,
      ];
}
