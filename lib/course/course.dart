import 'package:flutter/material.dart';

class CourseScreen extends StatelessWidget {
  static const String route = "Course Screen";
  const CourseScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [Text("Course")],
          ),
        ),
      ),
    );
  }
}
