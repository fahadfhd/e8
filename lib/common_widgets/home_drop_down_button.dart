import 'package:e8/home/providers/home_provider.dart';
import 'package:e8/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:dropdown_search/dropdown_search.dart';
// ignore: unused_import

class HomeDropDownButton extends StatelessWidget {
  const HomeDropDownButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeProvider homeProvider = Provider.of<HomeProvider>(context);
    // return DropdownButtonHideUnderline(
    //   child: DropdownButton<String>(
    //     value: homeProvider.dropDownInitialValue,
    //     elevation: 0,
    //     alignment: AlignmentDirectional.center,
    //     items: List<String>.generate(12, (i) => (i + 1).toString())
    //         .map<DropdownMenuItem<String>>((String value) {
    //       return DropdownMenuItem<String>(
    //         value: value,
    //         child: Text(
    //           value,
    //           style: const TextStyle(color: Colors.black),
    //         ),
    //       );
    //     }).toList(),
    //     // hint: const Text(
    //     //   "Please choose a langauage",
    //     //   style: TextStyle(
    //     //       color: Colors.black, fontSize: 14, fontWeight: FontWeight.w500),
    //     // ),
    //     onChanged: (String? value) {
    //       homeProvider.dropDownInitialValue = value!;
    //     },
    //   ),
    // );

    return Padding(
      padding: const EdgeInsets.only(top: 11, bottom: 6),
      child: SizedBox(
        width: 70,
        height: 90,
        child: DropdownSearch<String>(
            dropdownSearchDecoration: InputDecoration(
              contentPadding: const EdgeInsets.all(0),
              border: InputBorder.none,
              label: Text(
                'Hours',
                style: tsS14BoldGrey,
              ),
              // labelText: 'Hours',
              // labelStyle: tsS12Grey),
            ),
            mode: Mode.MENU,
            items: List<String>.generate(12, (i) => (i + 1).toString()),
            // label: "Menu mode",
            // hint: "country in menu mode",
            onChanged: (String? value) {
              homeProvider.dropDownInitialValue = value;
            },
            selectedItem: homeProvider.dropDownInitialValue),
      ),
    );
  }
}
