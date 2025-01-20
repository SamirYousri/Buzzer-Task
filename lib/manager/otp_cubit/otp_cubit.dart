// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'otp_state.dart';

class OtpCubit extends Cubit<OtpState> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String? _verificationId;

  OtpCubit() : super(OtpInitial());

  Future<void> sendOtp(String phoneNumber) async {
    emit(OtpLoading());
    try {
      await _auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) async {
          await _auth.signInWithCredential(credential);
          emit(OtpVerified());
        },
        verificationFailed: (FirebaseAuthException e) {
          emit(OtpError(e.message ?? 'Verification failed'));
        },
        codeSent: (String verificationId, int? resendToken) {
          _verificationId = verificationId;
          emit(OtpCodeSent());
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          _verificationId = verificationId;
        },
      );
    } catch (e) {
      emit(OtpError(e.toString()));
    }
  }

  Future<void> verifyOtp(String smsCode) async {
    emit(OtpLoading());
    if (_verificationId == null) {
      emit(OtpError('Verification ID not available'));
      return;
    }
    try {
      final credential = PhoneAuthProvider.credential(
        verificationId: _verificationId!,
        smsCode: smsCode,
      );
      await _auth.signInWithCredential(credential);
      emit(OtpVerified());
    } catch (e) {
      emit(OtpError('Invalid OTP'));
    }
  }
}
