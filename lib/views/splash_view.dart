// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();

    navigateToHome();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
      height: MediaQuery.sizeOf(context).height,
      width: MediaQuery.sizeOf(context).width,
      child: FittedBox(
        fit: BoxFit.cover,
        child: Image.asset('assets/images/buzzerSplash.png'),
      ),
    ));
  }

  void navigateToHome() {
    Future.delayed(
      const Duration(seconds: 1),
      () {
        Navigator.pushNamed(context, '/login');
      },
    );
  }
}
