import 'package:flutter/material.dart';

class AppDropdownInput<T> extends StatelessWidget {
  final String hintText;
  final List<T> options;
  final T? value;
  final String Function(T)? getLabel;
  final void Function(T?)? onChanged;

  const AppDropdownInput({super.key,
    this.hintText = 'Please select an Option',
    this.options = const [],
    this.getLabel,
    this.value,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return FormField<T>(
      builder: (FormFieldState<T> state) {
        return InputDecorator(
          decoration: InputDecoration(
            contentPadding:  const EdgeInsets.symmetric(
                horizontal: 20.0, vertical: 15.0),
            labelText: value==null?hintText:'',
            labelStyle: const TextStyle(color: Color(0xFF667085),fontSize: 16,fontWeight: FontWeight.w400,fontFamily: 'inter'),

            enabledBorder:const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black12, width: 1.5),
              borderRadius: BorderRadius.all(
                Radius.circular(10.0),
              ),
            ) ,
            border:
            const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black12, width: 1.5),
              borderRadius: BorderRadius.all(
                Radius.circular(10.0),
              ),
            ),
          ),
          isEmpty: value == null || value == '',
          child: DropdownButtonHideUnderline(
            child: DropdownButton<T>(
              value: value,
              isDense: true,
              onChanged: onChanged,
              style: const TextStyle(fontSize: 16,color: Color(0xFF344054),fontFamily: 'inter',fontWeight: FontWeight.w500,),
              items: options.map((T value) {
                return DropdownMenuItem<T>(
                  value: value,
                  child: Text(getLabel!(value)),
                );
              }).toList(),
            ),
          ),
        );
      },
    );
  }
}