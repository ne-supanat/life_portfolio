import 'package:flutter/material.dart';

bool isSmallDevice(BuildContext context) {
  return MediaQuery.of(context).size.width < 600;
}

K? enumDecodeNullable<K extends Enum, V>(Map<K, V> enumValues, Object? source) {
  if (source == null) {
    return null;
  }

  for (var entry in enumValues.entries) {
    if (entry.value == source) {
      return entry.key;
    }
  }

  throw Error();
}
