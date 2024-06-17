import 'package:flutter/material.dart';

class AppTextFormField extends StatelessWidget {
  const AppTextFormField({
    Key? key,
    this.controller,
    this.minLines = 1,
    this.maxLines,
    this.maxLength,
    this.hintText,
    this.labelText,
    this.obscureText,
    this.onChanged,
    this.keyboardType = TextInputType.text,
    this.textAlign,
    this.fillColor,
    this.prefixIcon,
    this.border = const OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(10.0),
      ),
    ),
    this.focusedBorder = const OutlineInputBorder(
      borderSide: BorderSide(color: Colors.black12, width: 1.5),
      borderRadius: BorderRadius.all(
        Radius.circular(10.0),
      ),
    ),
    this.enabledBorder = const OutlineInputBorder(
      borderSide: BorderSide(color: Colors.black12, width: 1.5),
      borderRadius: BorderRadius.all(
        Radius.circular(10.0),
      ),
    ),
    this.disabledBorder = const OutlineInputBorder(
      borderSide: BorderSide(color: Colors.grey, width: 1.5),
      borderRadius: BorderRadius.all(
        Radius.circular(12.0),
      ),
    ),
    this.validator,
    this.filled = true,
    this.enabled,
    this.font = 'outfit',
    this.showLabel = true,
    this.onSaved,
    this.onTap,
  }) : super(key: key);
  final TextEditingController? controller;
  final bool? obscureText;
  final String? hintText;
  final String? labelText;
  final int minLines;
  final String font;
  final int? maxLines;
  final int? maxLength;
  final bool filled;
  final bool? enabled;
  final bool showLabel;
  final InputBorder border;
  final InputBorder focusedBorder;
  final InputBorder enabledBorder;
  final InputBorder disabledBorder;
  final TextInputType? keyboardType;
  final TextAlign? textAlign;
  final Color? fillColor;
  final String? Function(String? value)? validator;
  final void Function(String? value)? onSaved;
  final void Function(String value)? onChanged;
  final void Function()? onTap;
  final ImageIcon? prefixIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),

      child: TextFormField(
        onTap: onTap,
        keyboardType: keyboardType,
        controller: controller,
        obscureText: obscureText ?? false,
        minLines: minLines,
        maxLines: maxLines ?? minLines,
        maxLength: maxLength,
        autofocus: false,
        onChanged: onChanged,
        style:TextStyle(color: const Color(0xFF667085),fontSize: 16,fontWeight: FontWeight.w400,fontFamily: font) ,
        enabled: enabled,
        decoration: InputDecoration(
            filled: filled,
            isDense: true,
            hintStyle:  TextStyle(color: const Color(0xFF667085),fontSize: 16,fontWeight: FontWeight.w400,fontFamily: font),
            hintText: hintText,
            labelText: showLabel ? (labelText ?? hintText) : null,
            fillColor: fillColor ?? const Color(0xFFFFFFFF),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
            border: border,
            focusedBorder: focusedBorder,
            enabledBorder: enabledBorder,
            prefixIcon: prefixIcon),
        validator: validator,
        onSaved: onSaved,
      ),
    );
  }
}
