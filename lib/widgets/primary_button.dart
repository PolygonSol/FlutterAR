import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  const PrimaryButton({
    Key? key,
    required this.text,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'PrimaryButton',
      child: MaterialButton(
        disabledColor: const Color(0xff393939),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(37)),
        elevation: 0.0,
        color: const Color(0xff7F4458),
        height: 44,
        minWidth: double.infinity,
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
              fontSize: 17, fontWeight: FontWeight.w600,
              fontFamily: 'margarine',
              color: onPressed == null ? const Color(0xff959595) : Colors.white),
        ),
      ),
    );
  }
}
