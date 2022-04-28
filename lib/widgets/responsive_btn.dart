import 'package:flutter/material.dart';
import 'package:travel_app/constants/constants.dart';

class ResponsiveBtn extends StatelessWidget {
  const ResponsiveBtn({Key? key, this.isResponsive = false, this.width})
      : super(key: key);
  final bool? isResponsive;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 60.0,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Constants.mainColor),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Image.asset("assets/images/button-one.png")]),
    );
  }
}
