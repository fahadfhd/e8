import 'package:e8/utils/colors.dart';
import 'package:e8/utils/extension.dart';
import 'package:flutter/material.dart';

class CommonButton extends StatelessWidget {
  final String buttonName;
  final String buttonNameTwo;
  final TextStyle? style;
  final Color? color;
  final Gradient? gradient;
  final double width;
  final double height;
  final double hPadding;
  final double? vPadding;
  final double? elevation;
  final bool enableRowText;
  final bool? isIcon;
  final bool? isFb;
  final Icon? icon;
  final bool? emailIcon;
  final bool? accIcon;
  final bool? isgoogle;
  final bool? isLike;
  final bool? apple;

  final VoidCallback? function;
  const CommonButton({
    Key? key,
    required this.buttonName,
    this.buttonNameTwo = '',
    this.function,
    this.style,
    this.gradient,
    this.color,
    this.height = 45,
    this.elevation,
    this.hPadding = 40,
    this.vPadding,
    this.width = 280,
    this.isIcon = false,
    this.icon,
    this.isFb,
    this.emailIcon,
    this.accIcon,
    this.enableRowText = false,
    this.isgoogle,
    this.isLike,
    this.apple,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(
          horizontal: hPadding,
        ),
        child: Container(
            decoration: BoxDecoration(
              gradient: gradient,
            ),
            height: height,
            width: width,
            child: ElevatedButton(
              onPressed: function,
              style: ButtonStyle(
                elevation: MaterialStateProperty.all(elevation),
                backgroundColor: MaterialStateProperty.all(color),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    side: const BorderSide(color: colorGrey))),
              ),
              child: enableRowText == true
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        if (isgoogle == true)
                          Container(
                            height: 20,
                            width: 20,
                            color: colore6e6e6,
                            child: Image(
                                image: AssetImage('google_logo'.asAssetpng())),
                          ),
                        if (isFb == true)
                          const Icon(
                            Icons.facebook_sharp,
                            color: colorBlue,
                          ),
                        if (emailIcon == true)
                          Container(
                            height: 20,
                            width: 20,
                            color: colore6e6e6,
                            child:
                                Image(image: AssetImage('gmail'.asAssetpng())),
                          ),
                        if (apple == true)
                          Container(
                            height: 20,
                            width: 20,
                            color: colore6e6e6,
                            child:
                                Image(image: AssetImage('apple'.asAssetpng())),
                          ),
                        Text(
                          buttonName,
                          style: style,
                        ),
                      ],
                    )
                  : FittedBox(
                      child: Center(
                        child: Text(
                          buttonName,
                          style: style,
                        ),
                      ),
                    ),
            )));
  }
}
// shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),