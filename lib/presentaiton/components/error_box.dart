import 'package:flutter/material.dart';
import 'package:module_a_practice3/common/fonts.dart';

class ErrorBox extends StatelessWidget {
  const ErrorBox({super.key, required this.text, this.height = 160});

  final String text;

  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      alignment: Alignment.center,
      width: MediaQuery.sizeOf(context).width * 0.9,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.black87.withOpacity(0.7),
      ),
      child: Text(text, style: bodyMedium.white,),
    );
  }
}
