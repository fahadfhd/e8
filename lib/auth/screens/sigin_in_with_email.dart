import 'package:e8/auth/screens/forget_password.dart';
import 'package:e8/bottom_nav/bottom_navigtion.dart';
import 'package:e8/common_widgets/common_button.dart';
import 'package:e8/common_widgets/common_text_field_without_border.dart';
import 'package:e8/home/providers/home_provider.dart';

import 'package:e8/utils/colors.dart';
import 'package:e8/utils/size_config.dart';
import 'package:e8/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SigninWithEmail extends StatefulWidget {
  static const String route = "/SignInWithemail";
  const SigninWithEmail({Key? key}) : super(key: key);

  @override
  State<SigninWithEmail> createState() => _SigninWithEmailState();
}

class _SigninWithEmailState extends State<SigninWithEmail> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool _isClicked = false;
  final _keyForm = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    HomeProvider homeProvider = Provider.of<HomeProvider>(context);
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        bottomOpacity: 0.0,
        elevation: 0.0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: colorBlack,
            size: 20,
          ),
          onPressed: Navigator.of(context).pop,
        ),
      ),
      body: SingleChildScrollView(
          child: SafeArea(
              child: Form(
                  key: _keyForm,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: SizeConfig.getHeight(60),
                        ),
                        Align(
                          alignment: Alignment.topCenter,
                          child: Text(
                            "Welcome back!",
                            style: tsS22BoldBLUE,
                          ),
                        ),
                        SizedBox(
                          height: SizeConfig.getHeight(10),
                        ),
                        Align(
                          alignment: Alignment.topCenter,
                          child: Text(
                            "Enter your email to sign in to your account  ",
                            style: tsS14Black,
                          ),
                        ),
                        SizedBox(
                          height: SizeConfig.getHeight(100),
                        ),
                        CommonTextFieldWithoutBorder(
                          labeltext: "Email",
                          textEditingController: emailController,
                          onChanged: (s) {
                            setState(() {
                              _isClicked = false;
                            });
                            _keyForm.currentState!.validate();
                          },
                          validator: (value) {
                            if (!_isClicked) {
                              return null;
                            }
                            if (value?.toString().trim().isEmpty ?? true) {
                              return "Email is required.";
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: SizeConfig.getHeight(30),
                        ),
                        CommonTextFieldWithoutBorder(
                          labeltext: "Password",
                          textEditingController: passwordController,
                          onChanged: (s) {
                            setState(() {
                              _isClicked = false;
                            });
                            _keyForm.currentState!.validate();
                          },
                          validator: (value) {
                            if (!_isClicked) {
                              return null;
                            }
                            if (value?.toString().trim().isEmpty ?? true) {
                              return "password is required.";
                            } else if (value.toString().length < 6) {
                              return "Password must be 6 characters long";
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: SizeConfig.getHeight(25),
                        ),
                        InkWell(
                          child: Text(
                            "Forget Password",
                            style: tsS14red,
                          ),
                          onTap: () {
                            Navigator.pushNamed(context, ForgetScreen.route);
                          },
                        ),
                        SizedBox(
                          height: SizeConfig.getHeight(10),
                        ),
                        CommonButton(
                          buttonName: "Sign in",
                          style: tsS14White,
                          color: colorBlue,
                          function: () {
                            _isClicked = true;
                            FocusScope.of(context).unfocus();
                            if (_keyForm.currentState!.validate()) {
                              homeProvider.loadHome();
                              Navigator.pushNamed(context, BottomNav.route);
                            }
                          },
                        )
                      ])))),
      bottomNavigationBar: SizedBox(
        height: 50,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.center,
              child: Text(
                "By clicking on 'Sign in' you agree to our",
                style: tsS14Black,
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                "Terms of use and Privacy policy.",
                style: tsS14BoldBlack,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
