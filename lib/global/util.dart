import 'package:flutter/material.dart';

bool isSmallDevice(BuildContext context) {
  return MediaQuery.of(context).size.width < 600;
}
