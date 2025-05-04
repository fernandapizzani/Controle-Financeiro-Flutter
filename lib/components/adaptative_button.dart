import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io';

class AdaptativeButton extends StatelessWidget {
  

  final String label;
  final VoidCallback onPressed;

  AdaptativeButton({
    required this.label,
    required this.onPressed,
  });
  
  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoButton(
          child: Text(label), 
          onPressed: onPressed,
          color: Theme.of(context).colorScheme.primary,
          padding: EdgeInsets.symmetric(
            horizontal: 20,
          ),
          )
        : ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Theme.of(context).colorScheme.primary,
            foregroundColor: Colors.black
          ),
          onPressed: onPressed,
          child: Text(label)
          );
  }
}
