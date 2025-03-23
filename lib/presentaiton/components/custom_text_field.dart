import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:module_a_practice3/common/fonts.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.hint,
    this.icon,
    required this.iconImage,
    required this.controller,
    required this.label, this.textInputType = TextInputType.text,
  });

  final String hint;

  final IconData? icon;

  final String iconImage;

  final String label;

  final TextEditingController controller;

  final TextInputType? textInputType;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      width: MediaQuery.sizeOf(context).width * 0.8,
      height: 50,
      decoration: BoxDecoration(
        color: Color(0xFFF9F9F9),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          icon == null ? SizedBox(
            width: 25,
            height: 25,
            child: SvgPicture.asset(
              iconImage,
              colorFilter: ColorFilter.mode(Colors.grey, BlendMode.srcIn),
              semanticsLabel: 'Red dash paths',
            ),
          ) : Icon(icon, color: Colors.grey,),

          SizedBox(
            width: MediaQuery.sizeOf(context).width * 0.8 - 50,
            child: TextField(
              obscureText: textInputType == TextInputType.visiblePassword ? true : false,
              keyboardType: textInputType,
              controller: controller,
              decoration: InputDecoration(
                hintText: hint,
                hintStyle: bodyMedium.grey,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                ),
                suffixIcon: Text(label, style: bodyMedium.grey, textAlign: TextAlign.center,),
              ),
            ),
          ),
        ]
      ),
    );
  }
}
