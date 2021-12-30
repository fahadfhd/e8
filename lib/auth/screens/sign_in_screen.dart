import 'package:e8/auth/screens/sigin_in_with_email.dart';
import 'package:e8/auth/screens/sign_up_screen.dart';
import 'package:e8/common_widgets/common_button.dart';
import 'package:e8/utils/colors.dart';
import 'package:e8/utils/size_config.dart';
import 'package:e8/utils/styles.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  static const String route = "SignInScreen";
  const SignInScreen({Key? key}) : super(key: key);

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: SizeConfig.getHeight(100),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Text(
                "Sign in",
                style: tsS22BoldBLUE,
              ),
            ),
            SizedBox(
              height: SizeConfig.getHeight(10),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Text(
                "By using our services you are agreeing to our",
                style: tsS14Black,
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Text(
                "Terms and Privacy Statement.",
                style: tsS14BoldBlack,
              ),
            ),
            SizedBox(
              height: SizeConfig.getHeight(100),
            ),
            CommonButton(
              color: colorffffff,
              enableRowText: true,
              buttonName: "Sign in with Email",
              emailIcon: true,
              style: tsS14Black,
              function: () {
                Navigator.pushNamed(context, SigninWithEmail.route);
              },
            ),
            SizedBox(
              height: SizeConfig.getHeight(15),
            ),
            CommonButton(
              color: colorffffff,
              enableRowText: true,
              buttonName: "Sign in with Google",
              isgoogle: true,
              style: tsS14Black,
            ),
            SizedBox(
              height: SizeConfig.getHeight(15),
            ),
            CommonButton(
              color: colorffffff,
              enableRowText: true,
              buttonName: "Sign in with Facebook",
              isFb: true,
              style: tsS14Black,
            )
          ],
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.center,
              child: Text(
                "New here?",
                style: tsS14Black,
              ),
            ),
            InkWell(
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  "Sign up",
                  style: tsS14BoldBLUE,
                ),
              ),
              onTap: () {
                Navigator.pushNamed(context, SignUpScreen.route);
              },
            )
          ],
        ),
      ),
    );
  }
}
