import 'package:e8/auth/screens/sign_in_screen.dart';
import 'package:e8/common_widgets/common_button.dart';
import 'package:e8/common_widgets/common_text_field_without_border.dart';
import 'package:e8/utils/colors.dart';
import 'package:e8/utils/size_config.dart';
import 'package:e8/utils/styles.dart';
import 'package:flutter/material.dart';

class ChangePassword extends StatefulWidget {
  static const String route = "/changePassword";
  const ChangePassword({Key? key}) : super(key: key);

  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final TextEditingController currentpasswordController =
      TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
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
                    "Change Password",
                    style: tsS22BoldBLUE,
                  ),
                ),
                SizedBox(
                  height: SizeConfig.getHeight(10),
                ),
                SizedBox(
                  height: SizeConfig.getHeight(50),
                ),
                CommonTextFieldWithoutBorder(
                  labeltext: "Current Password",
                  textEditingController: currentpasswordController,
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
                  height: SizeConfig.getHeight(15),
                ),
                CommonTextFieldWithoutBorder(
                  labeltext: "New Password",
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
                  height: SizeConfig.getHeight(15),
                ),
                CommonTextFieldWithoutBorder(
                  labeltext: "Confirm Password",
                  textEditingController: confirmPasswordController,
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
                  buttonName: "Submit",
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
    );
  }
}
