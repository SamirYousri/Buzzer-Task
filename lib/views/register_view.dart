// ignore_for_file: library_private_types_in_public_api

import 'package:auth_task/core/utils/text_style.dart';
import 'package:auth_task/manager/auth_cubit/auth_cubit.dart';
import 'package:auth_task/manager/auth_cubit/auth_state.dart';
import 'package:auth_task/views/widgets/custom_button.dart';
import 'package:auth_task/views/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(
                height: 235,
              ),
              const Text(
                "Create your account",
                style: AppTextStyles.textStyle45,
              ),
              const SizedBox(height: 40),
              const Text(
                "Email",
                style: AppTextStyles.textStyle20,
              ),
              CustomTextField(
                controller: emailController,
                hintText: 'Your email',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }

                  if (!RegExp(
                          r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$")
                      .hasMatch(value)) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Password",
                style: AppTextStyles.textStyle20,
              ),
              BlocBuilder<AuthCubit, AuthState>(
                builder: (context, state) {
                  final cubit = context.read<AuthCubit>();
                  return CustomTextField(
                    controller: passwordController,
                    hintText: 'Password',
                    isPassword: true,
                    obscureText: !cubit.isPasswordVisible,
                    onIconPressed: () {
                      cubit.togglePasswordVisibility();
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      if (value.length < 6) {
                        return 'Password must be at least 6 characters';
                      }
                      return null;
                    },
                  );
                },
              ),
              const SizedBox(
                height: 150,
              ),
              BlocConsumer<AuthCubit, AuthState>(
                listener: (context, state) {
                  if (state is AuthSuccess) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content: Text(
                        'Registration Successful',
                      )),
                    );
                    Navigator.pop(context);
                  } else if (state is AuthError) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(state.error)),
                    );
                  }
                },
                builder: (context, state) {
                  if (state is AuthLoading) {
                    return const CircularProgressIndicator();
                  }
                  return CustomButton(
                    text: 'Register',
                    onPressed: () {
                      BlocProvider.of<AuthCubit>(context).register(
                        emailController.text,
                        passwordController.text,
                      );
                    },
                  );
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "you have an account?",
                    style: AppTextStyles.textStyle14,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/login');
                    },
                    child: const Text(
                      "Login",
                      style: AppTextStyles.textStyle15,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
