import 'package:flutter/material.dart';

import '../../shared/shared_theme.dart';

class TextFormFieldWidget extends StatelessWidget {
  final String text;
  final TextEditingController? controller;
  final bool obscureText;
  final TextInputType? keyboardType;
  const TextFormFieldWidget({
    Key? key,
    required this.text,
    this.controller,
    this.obscureText = false,
    this.keyboardType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: blackTextStyle.copyWith(
            fontWeight: medium,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        TextFormField(
          keyboardType: keyboardType,
          controller: controller,
          obscureText: obscureText,
          decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
              ),
              contentPadding: const EdgeInsets.all(12)),
        ),
      ],
    );
  }
}
