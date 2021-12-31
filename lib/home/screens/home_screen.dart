import 'package:e8/home/providers/home_provider.dart';
import 'package:e8/home/widgets/home_card.dart';
import 'package:e8/utils/colors.dart';
import 'package:e8/utils/extension.dart';
import 'package:e8/utils/size_config.dart';
import 'package:e8/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreeViw extends StatelessWidget {
  static const String route = "/homeScreen";
  const HomeScreeViw({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    HomeProvider homeProvider = Provider.of<HomeProvider>(context);
    return SafeArea(
      child: homeProvider.isLoading == true
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              physics: const ScrollPhysics(),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Image(
                          image: AssetImage('home_one'.asAssetpng()),
                        ),
                        SizedBox(
                          height: SizeConfig.getHeight(25),
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Our Courses",
                            style: tsS16BoldBlack,
                          ),
                        ),
                        SizedBox(
                          height: SizeConfig.getHeight(10),
                        ),
                        const Divider(
                          thickness: 1,
                          color: colorGrey,
                        ),
                        SizedBox(
                          height: SizeConfig.getHeight(10),
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: SizedBox(
                                height: 400,
                                width: 200,
                                child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    physics: const ClampingScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount: 2,
                                    itemBuilder: (BuildContext context,
                                            int index) =>
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: HomeCard(
                                            index: index,
                                          ),
                                        )),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
