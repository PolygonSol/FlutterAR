import 'package:flutter/material.dart';

class CustomPageIndicator extends StatelessWidget {
  final int pageCount;
  final int currentPage;

  const CustomPageIndicator({super.key, required this.pageCount, required this.currentPage});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(pageCount, (index) {
        return Container(
          width: index==currentPage?25:13.0,
          height: index==currentPage?25:13.0,
          margin: const EdgeInsets.symmetric(horizontal: 8.0),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: index == currentPage ? const Color(0xff7F4458) : const Color(0xffF5D9E3),
          ),
          child: Center(child: Text(index==currentPage?"${currentPage+1}":"",style: const TextStyle(color: Colors.white ,fontSize: 14),)),
        );
      }),
    );
  }
}
