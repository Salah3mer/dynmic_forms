import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String? text;

  final double? widthPadding;
  final Function()? onTap;

  final Widget? widget;
  final TextStyle? style;
  const CustomButton(
      {super.key,
      this.text,
      required this.onTap,
      this.style,
      this.widget,
      this.widthPadding});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: widthPadding ?? 30),
      height: 50,
      width: double.infinity,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              elevation: 0,
              backgroundColor: const Color(0xff2e384e),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12))),
          onPressed: onTap,
          child: text != null
              ? FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(text!,
                      style: style ??
                          const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold)))
              : widget),
    );
  }
}
