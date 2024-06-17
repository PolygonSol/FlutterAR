import 'package:flutter/material.dart';

class OutlinedAppLoginButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  const OutlinedAppLoginButton({
    Key? key,
    required this.text,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'loginButton',
      child: MaterialButton(

        disabledColor: const Color(0xff393939),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),side: const BorderSide(color: Color(0xFFD0D5DD),width: 1.5 )),
        elevation: 0.0,
        color: const Color(0xffffffff),
        height: 48,
        minWidth: double.infinity,
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Image.asset('assets/images/user_circle.png'),
          const SizedBox(width: 20,),
          Text(
            text,
            style: TextStyle(
                fontFamily: 'intersemibold',
                fontSize: 17, fontWeight: FontWeight.w600,
                color: onPressed == null ? const Color(0xff959595) : const Color(0xFF7F4458)),
          )
        ],),
      ),
    );
  }
}
