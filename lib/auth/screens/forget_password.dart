import 'package:e8/auth/screens/otp_screen.dart';
import 'package:e8/common_widgets/common_button.dart';
import 'package:e8/common_widgets/common_text_field_without_border.dart';

import 'package:e8/utils/colors.dart';
import 'package:e8/utils/size_config.dart';
import 'package:e8/utils/styles.dart';
import 'package:flutter/material.dart';

class ForgetScreen extends StatefulWidget {
  static const String route = "/ForgetScreen";
  const ForgetScreen({Key? key}) : super(key: key);

  @override
  _ForgetScreenState createState() => _ForgetScreenState();
}

class _ForgetScreenState extends State<ForgetScreen> {
  final TextEditingController emailController = TextEditingController();

  bool _isClicked = false;
  final _keyForm = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
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
                              "Forgot Password",
                              style: tsS22BoldBLUE,
                            ),
                          ),
                          SizedBox(
                            height: SizeConfig.getHeight(10),
                          ),
                          Align(
                            alignment: Alignment.topCenter,
                            child: Text(
                              "Enter your email address associated with",
                              style: tsS14Black,
                            ),
                          ),
                          Align(
                            alignment: Alignment.topCenter,
                            child: Text(
                              "your account. We will email you a ",
                              style: tsS14Black,
                            ),
                          ),
                          Align(
                            alignment: Alignment.topCenter,
                            child: Text(
                              "Verification code",
                              style: tsS14BoldBlack,
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
                          CommonButton(
                            buttonName: "Submit",
                            style: tsS14White,
                            color: colorBlue,
                            function: () {
                              _isClicked = true;
                              FocusScope.of(context).unfocus();
                              if (_keyForm.currentState!.validate()) {
                                Navigator.pushNamed(context, OtpScreen.route);
                              }
                            },
                          )
                        ])))));
  }
}
