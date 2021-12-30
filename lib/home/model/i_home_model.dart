import 'package:e8/home/model/home_model.dart';

abstract class IhomePageModel {
  int get iStatusCode;
  bool get iStatus;
  // ignore: non_constant_identifier_names
  Banner get Ibanner;
  String get iMessage;
  List<HorizontalSlider> get iData;
}
