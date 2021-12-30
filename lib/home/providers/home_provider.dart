import 'package:e8/home/model/home_model.dart';
import 'package:e8/providers/base_provider.dart';
import 'package:e8/services/web_api_services.dart';

class HomeProvider extends BaseProvider {
  HomeProvider() : super(name: "HomeProvider");

  String? _dropDownInitialValue = '1';
  String? get dropDownInitialValue => _dropDownInitialValue;

  set dropDownInitialValue(String? value) {
    _dropDownInitialValue = value;
    notifyListeners();
  }

  int _index = 0;
  int get index => _index;

  set index(int value) {
    _index = value;
    notifyListeners();
  }

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  HomeModel? homeModel;
  Future<HomeModel?> loadHome() async {
    isLoading = true;
    await WebAPIServices().loadHome().then((value) {
      homeModel = value;
      isLoading = false;
      return homeModel;
    });
    notifyListeners();
  }
}
