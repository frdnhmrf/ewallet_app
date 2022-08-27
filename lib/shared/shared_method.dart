import 'package:another_flushbar/flushbar.dart';
import 'package:ewallet/shared/shared_theme.dart';
import 'package:flutter/material.dart';

void showCustomSnackBar(
  BuildContext context,
  String message,
) {
  Flushbar(
    message: message,
    flushbarPosition: FlushbarPosition.TOP,
    backgroundColor: redColor,
    duration: const Duration(seconds: 2),
  ).show(context);
}
