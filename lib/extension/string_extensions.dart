import 'dart:convert';

import 'package:flutter/material.dart';


extension Util on String? {
  bool get isNullOrEmpty => this == null || this!.isEmpty;

  bool get isNotNullOrEmpty => !isNullOrEmpty;

  bool get isBlank => this == null || this!.trim().isEmpty;

  bool get isNotBlank => !isBlank;

  bool get isNullOrBlank => this == null || isBlank;

  bool get isNotNullOrBlank => !isNullOrBlank;

  String get toTitleCase =>
      this == null ? '' : '${this![0].toUpperCase()}${this!.substring(1)}';

  String get toBase64 => base64.encode(utf8.encode(this ?? ''));

  Color get stringToColor {
    var valueString = this?.split('(0x')[1].split(')')[0]; // kind of hacky..
    if (valueString != null) {
      var value = int.parse(valueString, radix: 16);
      return Color(value);
    } else {
      return Colors.white;
    }
  }
}

extension ListUtil on List<String> {
  String get joinToString => reduce((curr, next) => '$curr,$next');
}
