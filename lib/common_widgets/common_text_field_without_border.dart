import 'package:e8/utils/colors.dart';
import 'package:e8/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CommonTextFieldWithoutBorder extends StatelessWidget {
  final String? labeltext;
  final Widget? dropDownWidget;
  final String? hint;
  final bool obscureText;
  final Widget? prefix;
  final Widget? sufix;
  final String? errorText;
  final FormFieldValidator? validator;
  final FormFieldSetter? onSaved;
  final ValueChanged? onChanged;
  final void Function()? onTap;
  final TextInputType? keyboardtype;
  final TextEditingController? textEditingController;
  final double hPadding;
  final bool lines;
  final int? minline;
  final int? maxline;
  final double? width;
  final double? height;
  final double? styleHeight;
  final double hContentPadding;
  final double vContentPadding;
  final List<TextInputFormatter>? inputFormatter;
  final bool? enabled;

  // ignore: use_key_in_widget_constructors
  const CommonTextFieldWithoutBorder(
      {this.labeltext,
      this.dropDownWidget,
      this.obscureText = false,
      this.errorText,
      this.onChanged,
      this.onSaved,
      this.prefix,
      this.sufix,
      this.textEditingController,
      this.validator,
      this.hint,
      this.keyboardtype,
      this.lines = false,
      this.hPadding = 40,
      this.minline,
      this.maxline,
      this.width = 326,
      this.height = 45,
      this.styleHeight,
      this.hContentPadding = 0,
      this.vContentPadding = 10,
      this.inputFormatter,
      this.enabled,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: hPadding,
      ),
      child: SizedBox(
        height: height,
        width: width,
        child: TextFormField(
          keyboardType: keyboardtype,
          obscureText: obscureText,
          controller: textEditingController,
          validator: validator,
          onChanged: onChanged,
          onSaved: onSaved,
          enabled: enabled,
          onTap: onTap,
          inputFormatters: inputFormatter,
          style: TextStyle(color: colorBlack, height: styleHeight),
          decoration: InputDecoration(
            icon: dropDownWidget,
            labelText: labeltext,
            labelStyle: const TextStyle(
              fontSize: 14.0,
              color: colorBlack,
            ),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            prefixIcon: prefix,
            suffixIcon: sufix,
            hintText: hint,
            hintStyle: const TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.normal,
                color: color707173),
            contentPadding: EdgeInsets.symmetric(
                vertical: vContentPadding, horizontal: hContentPadding),
            errorText: errorText,
            errorStyle: tsS12fc0404,
            fillColor: Theme.of(context).scaffoldBackgroundColor,
            filled: true,
            errorBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
            ),
            disabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
            ),
            focusedErrorBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
            ),
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.blue),
            ),
          ),
        ),
      ),
    );
  }
}
