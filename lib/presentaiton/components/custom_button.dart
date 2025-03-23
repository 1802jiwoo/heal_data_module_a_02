import 'package:flutter/material.dart';
import 'package:module_a_practice3/common/fonts.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.text, required this.function});

  final String text;

  final VoidCallback function;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: Container(
        alignment: Alignment.center,
        width: MediaQuery.sizeOf(context).width * 0.8,
        height: 50,
        decoration: BoxDecoration(
          color: Colors.black87,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(text, style: bodyMedium.white,),
      ),
    );
  }
}
