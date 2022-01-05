import 'dart:io';
import 'html_shim.dart' if (dart.library.html) 'dart:html' show window;

import 'package:e8/auth/screens/sigin_in_with_email.dart';
import 'package:e8/auth/screens/sign_up_screen.dart';
import 'package:e8/common_widgets/common_button.dart';
import 'package:e8/utils/colors.dart';
import 'package:e8/utils/size_config.dart';
import 'package:e8/utils/styles.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:http/http.dart' as http;

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
              buttonName: "Sign in with Apple",
              apple: true,
              style: tsS14Black,
              function: () async{
                final credential = await SignInWithApple.getAppleIDCredential(
                  scopes: [
                    AppleIDAuthorizationScopes.email,
                    AppleIDAuthorizationScopes.fullName,
                  ],
                  webAuthenticationOptions: WebAuthenticationOptions(
                    // TODO: Set the `clientId` and `redirectUri` arguments to the values you entered in the Apple Developer portal during the setup
                    clientId:
                        'de.lunaone.flutter.signinwithappleexample.service',

                    redirectUri:
                        // For web your redirect URI needs to be the host of the "current page",
                        // while for Android you will be using the API server that redirects back into your app via a deep link
                        kIsWeb
                            ? Uri.parse('https://${window.location.host}/')
                            : Uri.parse(
                                'https://flutter-sign-in-with-apple-example.glitch.me/callbacks/sign_in_with_apple',
                              ),
                  ),
                  // TODO: Remove these if you have no need for them
                  nonce: 'example-nonce',
                  state: 'example-state',
                );

                // ignore: avoid_print
                print(credential);

                // This is the endpoint that will convert an authorization code obtained
                // via Sign in with Apple into a session in your system
                final signInWithAppleEndpoint = Uri(
                  scheme: 'https',
                  host: 'flutter-sign-in-with-apple-example.glitch.me',
                  path: '/sign_in_with_apple',
                  queryParameters: <String, String>{
                    'code': credential.authorizationCode,
                    if (credential.givenName != null)
                      'firstName': credential.givenName!,
                    if (credential.familyName != null)
                      'lastName': credential.familyName!,
                    'useBundleId':
                        !kIsWeb && (Platform.isIOS || Platform.isMacOS)
                            ? 'true'
                            : 'false',
                    if (credential.state != null) 'state': credential.state!,
                  },
                );

                final session = await http.Client().post(
                  signInWithAppleEndpoint,
                );

                // If we got this far, a session based on the Apple ID credential has been created in your system,
                // and you can now set this as the app's session
                // ignore: avoid_print
                print(session);
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
