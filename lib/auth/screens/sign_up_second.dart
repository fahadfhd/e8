import 'package:e8/auth/screens/sign_in_screen.dart';
import 'package:e8/common_widgets/common_button.dart';
import 'package:e8/common_widgets/common_text_field_without_border.dart';
import 'package:e8/home/screens/home_screen.dart';
import 'package:e8/utils/colors.dart';
import 'package:e8/utils/size_config.dart';
import 'package:e8/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SignUpScreenSecond extends StatefulWidget {
  static const String route = "/signUpScreenSecond";
  const SignUpScreenSecond({Key? key}) : super(key: key);

  @override
  State<SignUpScreenSecond> createState() => _SignUpScreenSecondState();
}

class _SignUpScreenSecondState extends State<SignUpScreenSecond> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController countryController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
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
                  height: SizeConfig.getHeight(50),
                ),
                CommonTextFieldWithoutBorder(
                  labeltext: "Name",
                  textEditingController: nameController,
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
                      return "Name is required.";
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: SizeConfig.getHeight(15),
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
                  height: SizeConfig.getHeight(15),
                ),
                CommonTextFieldWithoutBorder(
                  labeltext: "Country",
                  textEditingController: countryController,
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
                      return "Country is required.";
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: SizeConfig.getHeight(15),
                ),
                CommonTextFieldWithoutBorder(
                  labeltext: "Phone",
                  textEditingController: phoneController,
                  keyboardtype: TextInputType.number,
                  inputFormatter: [LengthLimitingTextInputFormatter(10)],
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
                      return "Phone number is required.";
                    } else if (value.toString().length < 10) {
                      return "Please enter 10 digit Phone number";
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: SizeConfig.getHeight(15),
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
                CommonButton(
                  buttonName: "Sign in",
                  style: tsS14White,
                  color: colorBlue,
                  function: () {
                    _isClicked = true;
                    FocusScope.of(context).unfocus();
                    if (_keyForm.currentState!.validate()) {
                      Navigator.pushNamed(context, SignInScreen.route);
                    }
                  },
                )
              ],
            ),
          ),
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
