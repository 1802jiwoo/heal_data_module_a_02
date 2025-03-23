import 'package:flutter/material.dart';
import 'package:module_a_practice3/common/fonts.dart';

class CustomButton2 extends StatelessWidget {
  const CustomButton2({super.key, required this.text, required this.function, required this.outLine});

  final String text;

  final VoidCallback function;

  final bool outLine;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: Container(
        alignment: Alignment.center,
        width: MediaQuery.sizeOf(context).width * 0.75,
        height: 40,
        decoration: BoxDecoration(
          color: outLine ? Colors.white : Colors.black,
          border: outLine ? Border.all(color: Colors.grey, width: 1) : null,
        ),
        child: Text(text, style: outLine ? bodyBold.black : bodyBold.white,),
      ),
    );
  }
}
