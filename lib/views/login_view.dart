// ignore_for_file: library_private_types_in_public_api
import 'package:auth_task/core/utils/styles/text_style.dart';
import 'package:auth_task/manager/otp_cubit/otp_cubit.dart';
import 'package:auth_task/views/widgets/custom_button.dart';
import 'package:auth_task/views/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final TextEditingController phoneController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocListener<OtpCubit, OtpState>(
      listener: (context, state) {
        if (state is OtpCodeSent) {
          final phone = phoneController.text;
          Navigator.pushNamed(context, '/loginCode', arguments: phone);
        } else if (state is OtpError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message)),
          );
          print(state.message);
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
                            'Sign In',
                            style: AppTextStyles.textStyle20,
                          ),
                          const SizedBox(height: 200),
                          const Text(
                            "Welcome!",
                            style: AppTextStyles.textStyle20,
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            "Please enter your phone number to continue using our app",
                            style: AppTextStyles.textStyle16,
                          ),
                          const SizedBox(height: 10),
                          CustomTextField(
                            keyboardType: TextInputType.phone,
                            controller: phoneController,
                            hintText: 'Phone Number',
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your phone';
                              }
                              if (!RegExp(r"^\+[1-9][0-9]{1,14}$")
                                  .hasMatch(value)) {
                                return 'Please enter a valid phone number';
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
                            text: 'NEXT',
                            onPressed: () {
                              if (_formKey.currentState?.validate() ?? false) {
                                final phone = phoneController.text;
                                context.read<OtpCubit>().sendOtp(phone);
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
