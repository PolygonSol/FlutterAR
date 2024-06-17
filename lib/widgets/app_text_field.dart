import 'package:flutter/material.dart';

class AppTextField<T> extends StatelessWidget {
  const AppTextField({
    Key? key,
    this.controller,
    this.minLines = 1,
    this.maxLines = 1,
    this.maxLength,
    this.hintText,
    this.labelText,
    this.obscureText,
    this.keyboardType = TextInputType.text,
    this.textAlign,
    this.prefixIcon,
    this.validator,
    this.filled = true,
    this.enabled,
    this.showLabel = true,
    this.onSaved,
    this.onChanged,
    this.onTap,
    this.suffix,
    this.showDivider = true,
    this.drophintText = 'Please select an Option',
    this.options = const [],
    this.getLabel,
    this.value,
    this.droponChanged,
  }) : super(key: key);
  final TextEditingController? controller;
  final bool? obscureText;
  final String? hintText;
  final String? labelText;
  final int minLines;
  final int maxLines;
  final int? maxLength;
  final bool filled;
  final bool? enabled;
  final bool showLabel;
  final TextInputType? keyboardType;
  final TextAlign? textAlign;
  final String? Function(String? value)? validator;
  final void Function(String? value)? onSaved;
  final void Function(String? value)? onChanged;
  final void Function()? onTap;
  final IconData? prefixIcon;
  final Widget? suffix;
  final bool showDivider;
  final String drophintText;
  final List<T> options;
  final T? value;
  final String Function(T)? getLabel;
  final void Function(T?)? droponChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 50,
        decoration: BoxDecoration(
            border: Border.all(
                color: Colors.black12,width: 1.5,),
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0.0),
              child: Icon(
                prefixIcon,
                color: Colors.grey.shade600,
              ),
            ),

            if (showDivider)
              DropdownButtonHideUnderline(
                child: DropdownButton<T>(
                  value: value,
                  isDense: true,
                  onChanged: droponChanged,
                  items: options.map((T value) {
                    return DropdownMenuItem<T>(
                      value: value,
                      child: Text(getLabel!(value),style: const TextStyle(color: Color(0xFF667085),fontSize: 16,fontWeight: FontWeight.w400,fontFamily: 'outfit'),),
                    );
                  }).toList(),
                ),
              ),
            if (showDivider)
              const Padding(
                padding: EdgeInsets.all(10.0),
                child: VerticalDivider(

                  color: Color(0xFFD0D5DD), //color of divider
                  width: 2, //width space of divider
                  thickness: 2, //thickness of divier line
                ),
              ),

            Expanded(
              child: Theme(
                data:
                    Theme.of(context).copyWith(splashColor: Colors.transparent),
                child: TextFormField(
                  onTap: onTap,
                  keyboardType: keyboardType,
                  controller: controller,
                  obscureText: obscureText ?? false,
                  minLines: minLines,
                  maxLines: maxLines,
                  maxLength: maxLength,
                  autofocus: false,
                  enabled: enabled,

                  style: const TextStyle(color:  Color(0xFF667085),fontFamily: 'outfit',fontSize: 16,fontWeight: FontWeight.w400),
                  decoration: InputDecoration(
                    filled: filled,
                    isDense: true,
                    hintStyle: const TextStyle(color: Color(0xFF667085),fontFamily: 'outfit'),
                    hintText: hintText,
                    labelText: showLabel ? (labelText ?? hintText) : null,
                    fillColor: Colors.transparent,
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal:5),
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                  ),
                  validator: validator,
                  onSaved: onSaved,
                  onChanged: onChanged,
                ),
              ),
            ),
            if (null != suffix) suffix!,
          ],
        ),
      ),
    );
  }
}
