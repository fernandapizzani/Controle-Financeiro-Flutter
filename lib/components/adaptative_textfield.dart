import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io';

class AdaptativeTextfield extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final Function(String) onSubmitted;

  AdaptativeTextfield({
    required this.label,
    required this.controller,
    this.keyboardType = TextInputType.text,
    required this.onSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: CupertinoTextField(
            controller: controller,
            keyboardType: keyboardType,
            onSubmitted: onSubmitted,
            placeholder: label,
            padding: EdgeInsets.symmetric(horizontal: 6, vertical: 12),
          ),
        )
        : TextField(
          controller: controller,
          keyboardType: keyboardType,
          onSubmitted: onSubmitted,
          decoration: InputDecoration(labelText: label),
        );
  }
}
