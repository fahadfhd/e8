import 'package:e8/auth/screens/change_passwrd.dart';
import 'package:e8/auth/screens/forget_password.dart';
import 'package:e8/auth/screens/otp_screen.dart';
import 'package:e8/auth/screens/sigin_in_with_email.dart';
import 'package:e8/auth/screens/sign_in_screen.dart';
import 'package:e8/auth/screens/sign_up_screen.dart';
import 'package:e8/auth/screens/sign_up_second.dart';
import 'package:e8/bottom_nav/bottom_navigtion.dart';
import 'package:e8/home/screens/home_screen.dart';
import 'package:flutter/material.dart';

Map<String, WidgetBuilder> appRoutes() => {
      HomeScreeViw.route: (_) => const HomeScreeViw(),
      SignInScreen.route: (_) => const SignInScreen(),
      SignUpScreen.route: (_) => const SignUpScreen(),
      SignUpScreenSecond.route: (_) => const SignUpScreenSecond(),
      SigninWithEmail.route: (_) => const SigninWithEmail(),
      ForgetScreen.route: (_) => const ForgetScreen(),
      OtpScreen.route: (_) => const OtpScreen(),
      ChangePassword.route: (_) => const ChangePassword(),
      BottomNav.route: (_) => const BottomNav(),
    };
