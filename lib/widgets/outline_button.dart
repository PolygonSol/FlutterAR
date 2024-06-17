import 'package:flutter/material.dart';

class OutlinedAppButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  const OutlinedAppButton({
    Key? key,
    required this.text,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'OutlineButton',
      child: MaterialButton(
        disabledColor: const Color(0xff393939),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(37),side: const BorderSide(color: Color(0xFF7F4458),width: 1.5 )),
        elevation: 0.0,
        color: const Color(0xffffffff),
        height: 44,
        minWidth: double.infinity,
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.w600,
              color: onPressed == null ? const Color(0xff959595) : const Color(0xFF7F4458)),
        ),
      ),
    );
  }
}
