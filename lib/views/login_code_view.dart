// ignore_for_file: library_private_types_in_public_api
import 'package:auth_task/core/utils/styles/text_style.dart';
import 'package:auth_task/manager/auth_cubit/otp_cubit.dart';
import 'package:auth_task/views/widgets/custom_button.dart';
import 'package:auth_task/views/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCodeView extends StatelessWidget {
  LoginCodeView({super.key});

  final TextEditingController phoneCodeController = TextEditingController();
  final TextEditingController staticPhoneController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocListener<OtpCubit, OtpState>(
      listener: (context, state) {
        if (state is OtpVerified) {
          Navigator.pushNamed(context, '/home');
        } else if (state is OtpError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message)),
          );
        }
      },
      child: Scaffold(
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Stack(clipBehavior: Clip.none, children: [
                  Container(
                    height: MediaQuery.sizeOf(context).height * 0.7,
                    width: MediaQuery.sizeOf(context).width,
                    decoration: BoxDecoration(
                      image: const DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/images/Rectangle 1.png'),
                      ),
                      borderRadius: const BorderRadius.only(
                        bottomRight: Radius.circular(100),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 20),
                          Text(
                            'Login Code',
                            style: AppTextStyles.textStyle20,
                          ),
                          const SizedBox(height: 200),
                          const Text(
                            "Login by OTP",
                            style: AppTextStyles.textStyle20,
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            "Enter the authentication code we sent to this number",
                            style: AppTextStyles.textStyle16,
                          ),
                          const SizedBox(height: 10),
                          CustomTextField(
                            controller: staticPhoneController,
                            hintText: '0123456789',
                            isEnabled: false,
                          ),
                          CustomTextField(
                            keyboardType: TextInputType.phone,
                            controller: phoneCodeController,
                            hintText: 'Login Code',
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your phone code';
                              }
                              if (!RegExp(r"^[0-9]{6}$").hasMatch(value)) {
                                return 'Please enter a valid phone code';
                              }
                              return null;
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    right: 0,
                    left: 0,
                    bottom: -25,
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: BlocBuilder<OtpCubit, OtpState>(
                        builder: (context, state) {
                          if (state is OtpLoading) {
                            return const CircularProgressIndicator();
                          }
                          return CustomButton(
                            text: 'SUBMIT',
                            onPressed: () {
                              if (_formKey.currentState?.validate() ?? false) {
                                final otpCode = phoneCodeController.text;
                                context.read<OtpCubit>().verifyOtp(otpCode);
                              }
                            },
                          );
                        },
                      ),
                    ),
                  ),
                ]),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
