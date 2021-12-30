import 'package:e8/auth/screens/sign_in_screen.dart';
import 'package:e8/auth/screens/sign_up_second.dart';
import 'package:e8/common_widgets/common_button.dart';
import 'package:e8/utils/colors.dart';
import 'package:e8/utils/size_config.dart';
import 'package:e8/utils/styles.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  static const String route = "/SignUpScreen";
  const SignUpScreen({Key? key}) : super(key: key);

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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: SizeConfig.getHeight(60),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Text(
                "Sign up",
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
                Navigator.pushNamed(context, SignUpScreenSecond.route);
              },
            ),
            SizedBox(
              height: SizeConfig.getHeight(30),
            ),
            Row(
              children: const [
                Expanded(
                  child: Divider(
                    thickness: 1,
                    indent: 45,
                    endIndent: 20,
                    height: 20,
                    color: colorGrey,
                  ),
                ),
                Text("OR"),
                Expanded(
                  child: Divider(
                    thickness: 1,
                    indent: 20,
                    endIndent: 45,
                    height: 20,
                    color: colorGrey,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: SizeConfig.getHeight(30),
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
                "Have an account?",
                style: tsS14Black,
              ),
            ),
            InkWell(
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  "Sign in",
                  style: tsS14BoldBLUE,
                ),
              ),
              onTap: () {
                Navigator.pushNamed(context, SignInScreen.route);
              },
            )
          ],
        ),
      ),
    );
  }
}
