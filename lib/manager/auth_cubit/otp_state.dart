part of 'otp_cubit.dart';

abstract class OtpState {
  const OtpState();
}

class OtpInitial extends OtpState {}

class OtpLoading extends OtpState {}

class OtpCodeSent extends OtpState {}

class OtpVerified extends OtpState {}

class OtpError extends OtpState {
  final String message;

  const OtpError(this.message);
}
