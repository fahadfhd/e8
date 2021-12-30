import 'package:e8/auth/screens/change_passwrd.dart';
import 'package:e8/common_widgets/common_button.dart';

import 'package:e8/utils/colors.dart';
import 'package:e8/utils/size_config.dart';
import 'package:e8/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pin_put/pin_put.dart';

class OtpScreen extends StatefulWidget {
  static const String route = "/otpScreen";
  const OtpScreen({Key? key}) : super(key: key);

  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final TextEditingController pinOtpController = TextEditingController();
  final FocusNode pinOtpFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    final BoxDecoration pinOtpDecoration = BoxDecoration(
      color: Theme.of(context).scaffoldBackgroundColor,
      border: Border.all(color: Colors.black),
      borderRadius: BorderRadius.circular(10.0),
    );
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
              child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: SizeConfig.getHeight(60),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Text(
              "Verification",
              style: tsS22BoldBLUE,
            ),
          ),
          SizedBox(
            height: SizeConfig.getHeight(20),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Text(
              "Enter your Verification code we just sent you",
              style: tsS14Black,
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Text(
              "on your email address",
              style: tsS14Black,
            ),
          ),
          SizedBox(
            height: SizeConfig.getHeight(40),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: PinPut(
              fieldsCount: 4,
              textStyle: tsS18BLUE,
              eachFieldHeight: 50.0,
              eachFieldWidth: 50.0,
              focusNode: pinOtpFocus,
              controller: pinOtpController,
              submittedFieldDecoration: pinOtpDecoration,
              selectedFieldDecoration: pinOtpDecoration,
              followingFieldDecoration: pinOtpDecoration,
              pinAnimationType: PinAnimationType.rotation,
              onSubmit: (s) {
                Navigator.pushReplacementNamed(context, ChangePassword.route);
              },
            ),
          ),
          SizedBox(
            height: SizeConfig.getHeight(40),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Text(
                  "Didn't receive a code?",
                  style: tsS14Black,
                ),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Text(
                  "Resend code",
                  style: tsS14BoldBLUE,
                ),
              ),
            ],
          ),
          SizedBox(
            height: SizeConfig.getHeight(25),
          ),
          CommonButton(
            buttonName: "Send",
            color: colorBlue,
            style: tsS14White,
            function: () {
              Navigator.pushNamed(context, ChangePassword.route);
            },
          ),
        ],
      ))),
    );
  }
}
