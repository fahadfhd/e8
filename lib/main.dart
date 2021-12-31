import 'package:e8/auth/screens/sign_in_screen.dart';
import 'package:e8/home/providers/home_provider.dart';

import 'package:e8/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => HomeProvider())],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          routes: appRoutes(),
          // onGenerateRoute: onAppGenerateRoute(),
          initialRoute: SignInScreen.route),
    );
  }
}
