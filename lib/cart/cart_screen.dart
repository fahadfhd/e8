import 'package:e8/common_widgets/common_button.dart';
import 'package:e8/utils/colors.dart';
import 'package:e8/utils/extension.dart';
import 'package:e8/utils/size_config.dart';
import 'package:e8/utils/styles.dart';
import 'package:flutter/material.dart';

class CardScreen extends StatelessWidget {
  static const String route = "/cardScreen";
  const CardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                color: colorBlue,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        child: const Icon(
                          Icons.arrow_back_ios,
                          color: colorffffff,
                        ),
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                      SizedBox(height: SizeConfig.getHeight(60)),
                      Text(
                        "Cart",
                        style: tsS16White,
                      ),
                      Text(
                        "Home/cart",
                        style: tsS12White,
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: SizeConfig.getHeight(60)),
              Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: Container(
                      width: double.infinity,
                      height: 450,
                      padding: const EdgeInsets.fromLTRB(2, 2, 2, 2),
                      child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 2, vertical: 2),
                          child: SingleChildScrollView(
                              child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                Image(
                                  image: AssetImage('home_one'.asAssetpng()),
                                ),
                                SizedBox(height: SizeConfig.getHeight(10)),
                                Text(
                                  "Basic",
                                  style: tsS14BoldBlack,
                                ),
                                SizedBox(height: SizeConfig.getHeight(10)),
                                SizedBox(
                                    width: 350,
                                    child: Text(
                                      "Medical Imaging Overview, Radiation Basics, X-Ray, Computerized Tomography, Magnetic Resonance Imageing ",
                                      style: tsS14Grey,
                                      textAlign: TextAlign.justify,
                                    )),
                                SizedBox(height: SizeConfig.getHeight(10)),
                                Container(
                                  color: colorGrey,
                                  width: 350,
                                  height: 1,
                                ),
                                SizedBox(height: SizeConfig.getHeight(5)),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      width: 111,
                                      child: Column(
                                        children: const [
                                          Text("Quantity:"),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: 111,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text("Price"),
                                          Text(
                                            "AED 199.00",
                                            style: tsS14Black,
                                          ),
                                          const Text("Total"),
                                          Text(
                                            "AED 199.00",
                                            style: tsS14BoldBLUE,
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                                CommonButton(
                                    buttonName: "Check Out",
                                    color: colorBlue,
                                    style: tsS12White,
                                    hPadding: 0,
                                    width: 350)

                                // Image.network(homeProvider.homeModel!.banner.banner)
                              ]))))),
            ],
          ),
        ),
      ),
    );
  }
}
