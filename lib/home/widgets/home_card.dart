import 'dart:math';

import 'package:e8/common_widgets/common_button.dart';
import 'package:e8/home/providers/home_provider.dart';
import 'package:e8/utils/colors.dart';
import 'package:e8/utils/size_config.dart';
import 'package:e8/utils/styles.dart';
import 'package:e8/utils/urls.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';

class HomeCard extends StatefulWidget {
  int index;
  HomeCard({Key? key, required this.index}) : super(key: key);

  @override
  State<HomeCard> createState() => _HomeCardState();
}

class _HomeCardState extends State<HomeCard> {
  @override
  Widget build(BuildContext context) {
    double? rating;
    HomeProvider homeProvider = Provider.of<HomeProvider>(context);
    SizeConfig.init(context);
    return Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(1),
        ),
        clipBehavior: Clip.antiAlias,
        child: Container(
            padding: const EdgeInsets.fromLTRB(2, 2, 2, 2),
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 2),
                child: SingleChildScrollView(
                    child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                      SizedBox(
                        height: 200,
                        child: Image.network(
                          baseURL +
                              homeProvider.homeModel!.iData[widget.index]
                                  .data![widget.index].listingImage
                                  .toString(),
                          fit: BoxFit.fill,
                        ),
                      ),
                      SizedBox(
                        height: SizeConfig.getHeight(10),
                      ),
                      SizedBox(
                        width: 330,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            FittedBox(
                              child: Text(
                                homeProvider.homeModel!.iData[widget.index]
                                    .data![widget.index].title
                                    .toString(),
                                style: tsS16BoldBlack,
                              ),
                            ),
                            RatingBar.builder(
                                ignoreGestures: false,
                                initialRating: 5,
                                itemSize: 18,
                                allowHalfRating: true,
                                itemCount: 5,
                                itemBuilder: (_, rating) => Icon(
                                      Icons.star,
                                      color: colorAmber,
                                    ),
                                onRatingUpdate: (value) {
                                  rating = value;
                                }),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: SizeConfig.getHeight(20),
                      ),
                      SizedBox(
                        width: 350,
                        child: Text(
                          homeProvider.homeModel!.iData[widget.index]
                              .data![widget.index].description
                              .toString()
                              .substring(0, 100),
                          style: tsS10Black,
                          textAlign: TextAlign.justify,
                        ),
                      ),
                      SizedBox(
                        height: SizeConfig.getHeight(10),
                      ),
                      Container(
                        color: colorGrey,
                        height: 2,
                        width: 350,
                      ),
                      SizedBox(
                        height: SizeConfig.getHeight(10),
                      ),
                      Text(
                        "AED ${homeProvider.homeModel!.iData[widget.index].data![widget.index].price.toString()}",
                        style: tsS14BoldBLUE,
                      ),
                      SizedBox(
                        height: SizeConfig.getHeight(10),
                      ),
                      CommonButton(
                        buttonName: "Buy Now",
                        color: colorBlue,
                        hPadding: 0,
                        width: 350,
                        style: tsS14White,
                      )
                    ])))));
  }
}
