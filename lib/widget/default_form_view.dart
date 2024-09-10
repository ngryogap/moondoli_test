import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mondoli_test/resource/resources.dart';

class FormDefault extends StatelessWidget {
  const FormDefault({
    this.sufixIcon,
    super.key,
    this.textController,
    this.prefixIcon,
    this.textInputType = TextInputType.text,
    this.textInputAction = TextInputAction.next,
    this.textCapitalization = TextCapitalization.none,
    this.enable = true,
    this.validation,
    this.hintText,
    this.hidePassword = false,
    this.title,
    this.height,
    this.onChanged,
    this.onTapOutside,
    this.onEditingComplete,
    //  this.onFieldSubmitted,
    this.inputFormatter,
    this.prefix,
    this.fontFamily = 'HelveticaNeue',
    this.readOnly = false,
    this.fontSize = 14,
    this.maxlines = 1,
  });
  final String? hintText;
  final Widget? sufixIcon;
  final Widget? prefixIcon;
  final Widget? prefix;
  final bool hidePassword;
  final TextEditingController? textController;
  final TextInputType textInputType;
  final TextInputAction textInputAction;
  final TextCapitalization textCapitalization;
  final bool enable;
  final String? Function(String?)? validation;
  final String? title;
  final double? height;
  final ValueChanged<String>? onChanged;
  final Function? onTapOutside;
  final VoidCallback? onEditingComplete;
  //  final Function? onFieldSubmitted;
  final List<TextInputFormatter>? inputFormatter;
  final String? fontFamily;
  final double? fontSize;
  final bool? readOnly;
  final int? maxlines;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (height != null)
          SizedBox(
            height: height,
          ),
        if (title != null)
          Text(
            '$title',
            style: TextStyle(
              color: const Color(0xFF757575),
              fontSize: 14,
              fontWeight: FontWeight.w500,
              fontFamily: fontFamily,
            ),
          ),
        const SizedBox(
          height: 10,
        ),
        TextFormField(
          readOnly: readOnly!,
          onTapOutside: (event) =>
              onTapOutside == null ? null : onTapOutside!(),
          onEditingComplete: onEditingComplete,
          inputFormatters: inputFormatter,
          controller: textController,
          obscureText: hidePassword,
          enabled: enable,
          maxLines: maxlines,
          onChanged: (value) => onChanged != null ? onChanged!(value) : null,
          style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              fontFamily: fontFamily,
              color: Colors.black),
          decoration: StyleTextFormField.outlineInputBorder().copyWith(
            contentPadding: const EdgeInsets.all(15),
            prefix: prefix,
            prefixIcon: prefixIcon,
            suffixIcon: sufixIcon,
            border: InputBorder.none,
            hintText: hintText,
            hintStyle: TextStyle(
              color: Colors.grey,
              fontSize: fontSize,
              fontWeight: FontWeight.w400,
              fontFamily: fontFamily,
            ),
          ),
          keyboardType: textInputType,
          textInputAction: textInputAction,
          textCapitalization: textCapitalization,
          validator: validation,
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
