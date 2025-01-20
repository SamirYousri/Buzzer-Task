import 'package:auth_task/core/utils/styles/theme_manager.dart';
import 'package:auth_task/manager/auth_cubit/otp_cubit.dart';
import 'package:auth_task/views/home_view.dart';
import 'package:auth_task/views/login_code_view.dart';
import 'package:auth_task/views/login_view.dart';
import 'package:auth_task/views/splash_view.dart';
import 'package:auth_task/views/widgets/product_details.dart';
import 'package:auth_task/views/widgets/supplier_products.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'repository/auth_repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(AuthTask());
}

class AuthTask extends StatelessWidget {
  final AuthRepository authRepository = AuthRepository();

  AuthTask({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => OtpCubit(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeManager.getAppTheme(),
        debugShowCheckedModeBanner: false,
        initialRoute: '/splash',
        routes: {
          '/login': (context) => LoginScreen(),
          '/splash': (context) => SplashView(),
          '/loginCode': (context) => LoginCodeView(),
          '/home': (context) => HomeView(),
          '/supplierProducts': (context) => SupplierProducts(),
          '/productDetails': (context) => ProductDetails(),
        },
      ),
    );
  }
}
